from django.contrib import messages
from django.contrib.auth import authenticate, login, logout, update_session_auth_hash
from django.contrib.auth.models import User as AuthUser  # Renomeie o modelo User para AuthUser
from django.contrib.auth.decorators import login_required
from django.http import HttpResponseRedirect
from django.shortcuts import redirect, render, get_object_or_404
from django.urls import reverse
from django.core.exceptions import ObjectDoesNotExist
from .models import Profile, UserAddress
from .forms import AddressForm

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