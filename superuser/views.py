from django.shortcuts import render, redirect, get_object_or_404
from django.contrib.admin.views.decorators import staff_member_required
from django.http import HttpResponseForbidden
from pages.models import Category, Product
from .forms import ProductForm

# Create your views here.

@staff_member_required
def admin_profile(request):
    return render(request, "superuser/adminprofile.html")

@staff_member_required
def admin_dashboard(request):
    products = Product.objects.all()
    return render(request, 'superuser/dashboard.html', {
        'products': products
    })

@staff_member_required
def add_product(request):
    if request.method == 'POST':
        form = ProductForm(request.POST, request.FILES)
        if form.is_valid():
            form.save()
            return redirect('admin_dashboard')
    else:
        form = ProductForm()
    return render(request, 'superuser/add_product.html', {
        'form': form
    })

@staff_member_required
def edit_product(request, product_id):
    product = get_object_or_404(Product, id=product_id)
    if request.method == 'POST':
        form = ProductForm(request.POST, request.FILES, instance=product)
        if form.is_valid():
            form.save()
            return redirect('admin_dashboard')
    else:
        form = ProductForm(instance=product)
    return render(request, 'superuser/edit_product.html', {
        'form': form,
        'product': product
    })

@staff_member_required
def delete_product(request, product_id):
    product = get_object_or_404(Product, id=product_id)
    product.delete()
    return redirect('admin_dashboard')

@staff_member_required
def view_categorys(request):
    categorys = Category.objects.all()
    return render (request, "superuser/categorys.html", {
        'categorys': categorys
    })