from django.shortcuts import render, redirect
from .models import Product, CartItem

# Create your views here.
def index(request):
    featured_products = Product.objects.all()[:3] # Pega os 3 primeiros itens da lista
    return render(request, "pages/index.html", {
        'products': featured_products
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
    cart_items = CartItem.objects.filter(user=request.user)
    total_price = sum(item.product.price * item.quantity for item in cart_items)
    return render(request, "pages/cart.html", {
        'cart_items': cart_items,
        'total_price': total_price
    })

def add_to_cart(request, product_id):
    product = Product.objects.get(id=product_id)
    cart_item, created = CartItem.objects.get_or_create(product=product, user=request.user)
    cart_item.quantity += 1
    cart_item.save()
    return redirect('pages:view_cart')

def remove_from_cart(request, item_id):
    cart_item = CartItem.objects.get(id=item_id)
    cart_item.delete()
    return redirect('pages:cart_view')