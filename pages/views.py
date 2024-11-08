from django.shortcuts import render
from .models import Product

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