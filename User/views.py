from django.contrib import messages
from django.contrib.auth import authenticate, login, logout, update_session_auth_hash
from django.contrib.auth.models import User as AuthUser  # Renomeie o modelo User para AuthUser
from django.contrib.auth.decorators import login_required
from django.http import HttpResponseRedirect
from django.shortcuts import redirect, render, get_object_or_404
from django.urls import reverse
from django.core.exceptions import ObjectDoesNotExist, ValidationError
from .models import Profile, UserAddress, UserPayments, Feedback
from pages.models import Product
from .forms import AddressForm, PaymentForm
from datetime import datetime

# Create your views here.
def index(request):
    if not request.user.is_authenticated:
        return HttpResponseRedirect(reverse("login"))
    return render(request, "User/user.html")

def login_view(request):
    if request.method == "POST":
        username = request.POST["username"]
        password = request.POST["password"]

        user = authenticate(request, username=username, password=password)

            # If user objet is returned, log in and route to index page:
        if user:
            login(request, user)
            return HttpResponseRedirect(reverse("index"))
            # Otherwise, return login page again with new context
        else:
            return render(request, "User/login.html", {
            "message": "Usuário ou senha inválido"
            })
        
    return render(request, "User/login.html")

def logout_view(request):
    logout(request)
    return render(request, "User/login.html", {
        "message": "Logged Out"
    })

def signup(request):
    if request.method == "POST":
        username = request.POST["username"]
        first_name = request.POST['first']
        last_name = request.POST['last']
        password = request.POST["password"]
        email = request.POST["email"]

        # Creating a new user
        user = AuthUser.objects.create_user(username=username, password=password, email=email)
        user.first_name = first_name
        user.last_name = last_name
        user.save()

        # Authenticate and login the user automatically after the sign up
        login(request, user)
        return redirect("index")  # Redirect to index 

    return render(request, "User/signup.html")

@login_required
def profile(request):
    return render(request, "User/profile.html")

@login_required
def edit_profile(request):
    if request.method == 'POST':
        # Obtendo os dados do formulário
        first_name = request.POST.get('first_name')
        last_name = request.POST.get('last_name')
        email = request.POST.get('email')
        password = request.POST.get('password')
        profile_image = request.FILES.get('profile_image')  # Aqui pegamos a imagem enviada

        user = request.user  # Usuário autenticado

        # Atualizando as informações básicas do usuário
        user.first_name = first_name
        user.last_name = last_name
        user.email = email

        # Se houver nova senha, ela será atualizada
        if password:
            user.set_password(password)  # Criptografa a senha antes de salvar

        # Tentando obter o perfil do usuário
        try:
            profile = user.profile
        except ObjectDoesNotExist:
            profile = Profile(user=user)

        # Se uma nova imagem de perfil for enviada, atualiza o campo
        if profile_image:
            profile.profile_image = profile_image

        # Salvando as alterações no perfil e no usuário
        profile.save()
        user.save()

        # Se a senha foi alterada, atualiza a sessão para não desconectar o usuário
        if password:
            update_session_auth_hash(request, user)

        messages.success(request, 'Perfil atualizado com sucesso!')
        return redirect('profile')  # Redireciona para a página do perfil

    return render(request, "User/edit_profile.html", {'user': request.user})

def view_addresses(request):
    addresses = UserAddress.objects.filter(user=request.user)

    return render(request, "User/addresses.html", {
        "addresses": addresses
    })

def add_address(request):
    if request.method == "POST":
        street = request.POST.get("street")
        city = request.POST.get("city")
        state = request.POST.get("state")
        cep = request.POST.get("cep")
        country = request.POST.get("country")
        is_default = request.POST.get("is_default") == "on"

        UserAddress.objects.create(
            user=request.user,
            street=street,
            city=city,
            state=state,
            cep=cep,
            country=country,
            is_default=is_default,
        )

        messages.success(request, "Endereço adicionado com sucesso!")
        return redirect('view_addresses')

    return render(request, "User/add_address.html")

def edit_address(request, address_id):
    address = get_object_or_404(UserAddress, id=address_id)
    if request.method == 'POST':
        form = AddressForm(request.POST, request.FILES, instance=address)
        if form.is_valid():
            form.save()
            return redirect('view_addresses')
    else:
        form = AddressForm(instance=address)
    return render(request, 'User/edit_address.html', {
        'form': form,
        'address': address
    })

def delete_address(request, address_id):
    address = get_object_or_404(UserAddress, id=address_id)
    address.delete()
    return redirect('view_addresses')

def view_payments(request):
    payments = UserPayments.objects.filter(user=request.user)

    return render(request, "User/payments.html", {
        "payments": payments
    })


def add_payment(request):
    if request.method == "POST":
        payment_type = request.POST.get("payment_type")
        card_holder_name = request.POST.get("card_holder_name")
        card_number = request.POST.get("card_number")
        expiration_date = request.POST.get("expiration_date")
        is_default = request.POST.get("is_default") == "on"

        # Validação de Expiração de Cartão
        try:
            expiration_date = datetime.strptime(expiration_date, "%m/%Y")
            if expiration_date < datetime.now():
                messages.error(request, "O cartão está expirado.")
                return render(request, "User/add_payment.html")
        except ValueError:
            messages.error(request, "Formato de data de expiração inválido.")
            return render(request, "User/add_payment.html")

        # Verificar se outro método já está marcado como padrão
        if is_default:
            # Desmarcar o padrão dos outros métodos do usuário
            UserPayments.objects.filter(user=request.user, is_default=True).update(is_default=False)

        # Criando o pagamento
        UserPayments.objects.create(
            user=request.user,
            payment_type=payment_type,
            card_holder_name=card_holder_name,
            card_number=card_number,  
            expiration_date=expiration_date,
            is_default=is_default
        )

        messages.success(request, "Método de pagamento adicionado com sucesso!")
        return redirect('payments')

    return render(request, "User/add_payment.html")

def edit_payment(request, payment_id):
    payment = get_object_or_404(UserPayments, id=payment_id, user=request.user)

    if request.method == "POST":
        payment_type = request.POST.get("payment_type")
        card_holder_name = request.POST.get("card_holder_name")
        card_number = request.POST.get("card_number")
        expiration_date = request.POST.get("expiration_date")
        is_default = request.POST.get("is_default") == "on"

        # Validação de Expiração de Cartão
        try:
            expiration_date = datetime.strptime(expiration_date, "%m/%Y")
            if expiration_date < datetime.now():
                messages.error(request, "O cartão está expirado.")
                return render(request, "User/edit_payment.html", {'payment': payment})
        except ValueError:
            messages.error(request, "Formato de data de expiração inválido.")
            return render(request, "User/edit_payment.html", {'payment': payment})


        # Verificar se outro método já está marcado como padrão
        if is_default:
            UserPayments.objects.filter(user=request.user, is_default=True).update(is_default=False)

        # Atualizando o método de pagamento
        payment.payment_type = payment_type
        payment.card_holder_name = card_holder_name
        payment.card_number = card_number
        payment.expiration_date = expiration_date
        payment.is_default = is_default
        payment.save()

        messages.success(request, "Método de pagamento atualizado com sucesso!")
        return redirect('payments')

    # Pré-preenchendo os dados no formulário
    return render(request, "User/edit_payment.html", {
        'payment': payment,
    })

def delete_payment(request, payment_id):
    payment = get_object_or_404(UserPayments, id=payment_id)
    payment.delete()
    return redirect('payments')

@login_required
def view_feedbacks(request):
    feedbacks = Feedback.objects.filter(user=request.user).select_related('product').order_by('-created_at')
    context = {
        'feedbacks': feedbacks
    }
    return render(request, 'User/feedbacks.html', context)

@login_required
def make_feedback(request, product_id):
    product = get_object_or_404(Product, id=product_id)
    
    if request.method == 'POST':
        feedback_text = request.POST.get('feedback_text')
        rating = request.POST.get('rating')

        if not feedback_text or not rating:
            messages.error(request, "Por favor, preencha todos os campos.")
            return redirect('make_feedback', product_id=product_id)

        try:
            rating = int(rating)
            if rating < 1 or rating > 5:
                raise ValueError("Avaliação inválida")
        except ValueError:
            messages.error(request, "Por favor, forneça uma avaliação válida (1 a 5).")
            return redirect('make_feedback', product_id=product_id)

        # Criação do feedback
        Feedback.objects.create(user=request.user, product=product, feedback_text=feedback_text, rating=rating)
        messages.success(request, "Seu feedback foi enviado com sucesso!")
        
        # Redireciona para a página de feedbacks do usuário
        return redirect('feedbacks')  # Aqui redireciona para 'view_feedbacks', que já está configurado

    return render(request, 'User/add_feedback.html', {
        'product': product
    })

@login_required
def edit_feedback(request, feedback_id):
    feedback = get_object_or_404(Feedback, id=feedback_id, user=request.user)

    if request.method == 'POST':
        feedback_text = request.POST.get("feedback_text")
        rating = request.POST.get("rating")

        feedback.feedback_text = feedback_text
        feedback.rating = rating
        feedback.save()

        messages.success(request, "Feedback atualizado com sucesso!")
        return redirect('feedbacks')
    
    return render(request, "User/edit_feedback.html", {
        'feedback': feedback
    })

