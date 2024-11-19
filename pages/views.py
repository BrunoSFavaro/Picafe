from django.shortcuts import render, redirect
from .models import Product, Cart, CartItem, Historic, Order
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
    list_products = Product.objects.all()
    return render(request, "pages/products.html", {
        'products': list_products
    })

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
        if product_id_str in cart:
            cart[product_id_str] += 1
        else:
            cart[product_id_str] = 1

        request.session['cart'] = cart
        request.session.modified = True
        return redirect('view_cart')
    else:
        product = Product.objects.get(id=product_id)
        cart_item, created = CartItem.objects.get_or_create(product=product, user=request.user)
        cart_item.quantity += 1
        cart_item.save()
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

def finalize_cart(request):
    if not request.user.is_authenticated:
        return redirect('login')

    cart_items = CartItem.objects.filter(user=request.user, cart__isnull=True)    
    
    if not cart_items.exists():
        return redirect('view_cart')
    
    total_price = sum(item.product.price * item.quantity for item in cart_items)
    order = Order.objects.create(user=request.user, total_price=total_price)

    for item in cart_items:
        product = item.product
        quantity = item.quantity

        # Atualizar o estoque do produto
        if product.stock_quantity >= quantity:
            product.stock_quantity -= quantity
            product.save()
        else:
            return render(request, 'pages/cart.html', {
                'product': product
            })

        # Criar o histórico
        Historic.objects.create(
            order=order,
            product=product,
            quantity=quantity,
            date_added=item.date_added
        )
        item.delete()
    return render(request, 'pages/finalize.html', {
        'order': order
    })