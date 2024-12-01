from django.http import HttpResponse
from django.contrib import messages
from django.shortcuts import render, redirect, get_object_or_404
from .models import Product, Cart, CartItem, Historic, Order, Wishlist
from User.models import UserAddress, UserPayments
from superuser.models import Carrier, Discount
from django.contrib.auth.decorators import login_required

# Create your views here.
def index(request):
    featured_products = Product.objects.all()[:3] # Pega os 3 primeiros itens da lista
    return render(request, "pages/index.html", {
        'products': featured_products
    })

@login_required
def historic(request):
    order_list = Order.objects.filter(user=request.user).order_by('-created_at')
    return render(request, "pages/historic.html", {
        'orders': order_list
    })

def order_details(request, order_id):
    order = Order.objects.get(id=order_id)
    products = Historic.objects.filter(order=order)
    return render(request, "pages/order.html", {
        "order": order,
        "products": products,
    })

def product(request, product_id):
    product = Product.objects.get(id=product_id)
    return render(request, "pages/product.html", {
        "product": product,
    })

def products(request):
    list_products = Product.objects.filter(stock_quantity__gt=0)
    context = {
        'products': list_products,
        'empty_message': "Nenhum produto disponível no momento." if not list_products else None,
    }
    return render(request, "pages/products.html", context)

def view_cart(request):
    total_price = 0
    if not request.user.is_authenticated:
        cart_items = request.session.get('cart', {})
        detailed_cart = []

        for product_id, quantity in cart_items.items():
            product = Product.objects.get(id=product_id)
            total_price += product.price * quantity
            detailed_cart.append({
                'id': product_id,
                'product': product,
                'quantity': quantity,
            })
    else:
        cart_items = CartItem.objects.filter(user=request.user)
        total_price = sum(item.product.price * item.quantity for item in cart_items)
        detailed_cart = cart_items
    return render(request, "pages/cart.html", {
        'cart_items': detailed_cart,
        'total_price': total_price
    })

def add_to_cart(request, product_id):
    if not request.user.is_authenticated:
        cart = request.session.get('cart', {})
        product_id_str = str(product_id)
        product = Product.objects.get(id=product_id)

        if product.stock_quantity > cart.get(product_id_str, 0):
            if product_id_str in cart:
                cart[product_id_str] += 1
            else:
                cart[product_id_str] = 1
            request.session['cart'] = cart
            request.session.modified = True
        else:
            messages.error(request, f"Quantidade solicitada excede o estoque disponível para o produto {product.name}. Estoque disponível: {product.stock_quantity}")
            
        return redirect('view_cart')

    else:
        product = Product.objects.get(id=product_id)
        cart_item, created = CartItem.objects.get_or_create(product=product, user=request.user)

        total_quantity_in_cart = cart_item.quantity + 1

        if product.stock_quantity >= total_quantity_in_cart:
            cart_item.quantity += 1
            cart_item.save()
        else:
            messages.error(request, f"Quantidade solicitada excede o estoque disponível para o produto {product.name}. Estoque disponível: {product.stock_quantity}")
        
        return redirect('view_cart')
    
def subtract_from_cart(request, product_id):
    if request.user.is_authenticated:
        cart_item = CartItem.objects.filter(product_id=product_id, user=request.user).first()
        if cart_item.quantity > 1:
            cart_item.quantity -= 1
            cart_item.save()
        else:
            cart_item.delete()
    else:
        cart = request.session.get('cart', {})
        product_id_str = str(product_id)
        if product_id_str in cart:
            if cart[product_id_str] > 1:
                cart[product_id_str] -= 1
            else:
                del cart[product_id_str]
            request.session['cart'] = cart
            request.session.modified = True
    return redirect('view_cart')

def remove_from_cart(request, item_id):
    if request.user.is_authenticated:
        cart_item = CartItem.objects.get(id=item_id, user=request.user)
        cart_item.delete()
    else:
        cart = request.session.get('cart', {})
        if str(item_id) in cart:
            del cart[str(item_id)]
            request.session['cart'] = cart
    return redirect('view_cart')

def checkout(request):
    # Recuperar itens do carrinho do usuário logado
    cart_items = CartItem.objects.filter(user=request.user)
    
    # Calcular o total
    total_price = sum(item.product.price * item.quantity for item in cart_items)
    
    # Obter endereços e transportadoras
    user_addresses = UserAddress.objects.filter(user=request.user)
    carriers = Carrier.objects.all()
    
    context = {
        'cart_items': cart_items,
        'total_price': total_price,
        'user_addresses': user_addresses,
        'carriers': carriers,
    }
    return render(request, 'pages/checkout.html', context)

def apply_discount(request):
    if request.method == "POST":
        coupon_code = request.POST.get('coupon', '').strip()
        user_cart = CartItem.objects.filter(user=request.user)

    # Verifica se o cupom existe e está ativo
    try:
        coupon = Discount.objects.get(code=coupon_code, is_active=True)
    except Discount.DoesNotExist:
        messages.error(request, "Cupom inválido ou expirado.")
        return redirect('checkout')

    # Associa o cupom aos itens do carrinho
    for item in user_cart:
        item.discount = coupon
        item.save()

    messages.success(request, f"Cupom '{coupon_code}' aplicado com sucesso!")
    return redirect('checkout')


def checkout_payment(request):
    cart_items = CartItem.objects.filter(user=request.user)

    total_price = sum(item.product.price * item.quantity for item in cart_items)

    payment_methods = UserPayments.objects.filter(user=request.user)

    # Recuperar os valores do endereço e transportadora enviados na etapa anterior
    address_id = request.POST.get('address')
    carrier_id = request.POST.get('carrier')

    # Verificar se os valores foram passados; caso contrário, mostrar erro ou redirecionar
    if not address_id or not carrier_id:
        messages.error(request, "Por favor, selecione um endereço e uma transportadora antes de continuar.")
        return redirect('checkout')

    # Buscar os objetos para exibição no template
    address = get_object_or_404(UserAddress, id=address_id, user=request.user)
    carrier = get_object_or_404(Carrier, id=carrier_id)

    # Adicionar ao contexto
    context = {
        'cart_items': cart_items,
        'total_price': total_price,
        'payment_methods': payment_methods,
        'address': address,
        'carrier': carrier,
    }

    # Renderizar o template
    return render(request, 'pages/checkout_payment.html', context)


def finalize_cart(request):
    if not request.user.is_authenticated:
        return redirect('login')

    # Buscar itens do carrinho para o usuário
    cart_items = CartItem.objects.filter(user=request.user)

    # Verificar se o carrinho está vazio
    if not cart_items.exists():
        return redirect('view_cart')  # Caso o carrinho esteja vazio, redireciona para a página do carrinho

    if request.method == 'POST':
        # Obter os dados do formulário
        address_id = request.POST.get('address')
        carrier_id = request.POST.get('carrier')
        payment_id = request.POST.get('payment')

        # Verificar se o endereço e transportadora foram selecionados
        if not address_id or not carrier_id or not payment_id:
            return render(request, 'pages/checkout_payment.html', {
            'error': 'Por favor, selecione um endereço, um método de entrega e um método de pagamento.',
            'cart_items': cart_items,
            'user_addresses': UserAddress.objects.filter(user=request.user),
            'carriers': Carrier.objects.all(),
            'payment_methods': UserPayments.objects.filter(user=request.user),
            'total_price': sum(item.product.price * item.quantity for item in cart_items),
        })

        # Validar o endereço e a transportadora
        address = get_object_or_404(UserAddress, id=address_id, user=request.user)
        carrier = get_object_or_404(Carrier, id=carrier_id)
        payment = get_object_or_404(UserPayments, id=payment_id, user=request.user)

        # Calcular o preço total
        total_price = sum(item.product.price * item.quantity for item in cart_items)

        # Criar o pedido
        order = Order.objects.create(
            user=request.user,
            total_price=total_price,
            address=address,
            carrier=carrier,
            payment=payment
        )

        # Processar os itens do carrinho
        for item in cart_items:
            product = item.product
            quantity = item.quantity

            # Verificar e atualizar o estoque do produto
            if product.stock_quantity >= quantity:
                product.stock_quantity -= quantity
                product.save()
            else:
                return render(request, 'pages/cart.html', {
                    'error': f"Estoque insuficiente para o produto {product.name}.",
                    'cart_items': cart_items
                })

            # Mover os itens para o histórico
            Historic.objects.create(
                order=order,
                product=product,
                quantity=quantity,
                date_added=item.date_added
            )

            # Remover o item do carrinho
            item.delete()

        # Após finalizar o pedido, redireciona para uma página de confirmação ou exibe a página de sucesso
        return render(request, 'pages/finalize.html', {
            'order': order
        })

    # Se for um GET, renderiza o checkout normalmente
    user_addresses = UserAddress.objects.filter(user=request.user)
    carriers = Carrier.objects.all()
    user_payment = UserPayments.objects.filter(user=request.user)

    return render(request, 'pages/checkout.html', {
        'cart_items': cart_items,
        'user_addresses': user_addresses,
        'carriers': carriers,
        'user_payment': user_payment,
        'total_price': sum(item.product.price * item.quantity for item in cart_items)
    })

@login_required
def view_wishlist(request):
    wishlist_items = Wishlist.objects.filter(user=request.user).select_related('product')
    context = {
        'wishlist_items': wishlist_items
    }
    return render(request, 'pages/wishlist.html', context)

@login_required
def add_wishlist(request, product_id):
    product = get_object_or_404(Product, id=product_id)
    wishlist_item, created = Wishlist.objects.get_or_create(product=product, user=request.user)
    if created:
        messages.success(request, f"'{product.name}' foi adicionado à sua lista de desejos!")
    else:
        messages.info(request, f"'{product.name}' já está na sua lista de desejos.")

    return redirect('wishlist')
    
@login_required
def remove_from_wishlist(request, product_id):
    wishlist_item = Wishlist.objects.get(product_id=product_id, user=request.user)
    wishlist_item.delete()
    return redirect('wishlist')
