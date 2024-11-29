from django.shortcuts import render, redirect, get_object_or_404
from django.contrib import messages
from django.contrib.admin.views.decorators import staff_member_required
from django.http import HttpResponseForbidden
from .models import Carrier, Discount
from User.models import Feedback
from pages.models import Category, Product, Order, Historic
from .forms import ProductForm, CategoryForm, CarrierForm, DiscountForm

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
    categories = Category.objects.all()
    return render(request, 'superuser/add_product.html', {
        'form': form,
        'categories': categories
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
def view_categories(request):
    categories = Category.objects.all()
    return render (request, "superuser/categories.html", {
        'categories': categories
    })

@staff_member_required
def add_category(request):
    if request.method == 'POST':
        form = CategoryForm(request.POST, request.FILES)
        if form.is_valid():
            form.save()
            return redirect('categories')
    else:
        form = CategoryForm()
    return render(request, 'superuser/add_category.html', {
        'form': form
    })

@staff_member_required
def edit_category(request, category_id):
    category = get_object_or_404(Category, id=category_id)
    if request.method == 'POST':
        form = CategoryForm(request.POST, request.FILES, instance=category)
        if form.is_valid():
            form.save()
            return redirect('categories')
    else:
        form = CategoryForm(instance=category)
        return render(request, 'superuser/edit_category.html', {
            'form': form,
            'category': category
        })

@staff_member_required
def delete_category(request, category_id):
    category = get_object_or_404(Category, id=category_id)
    category.delete()
    messages.warning(request, "Categoria removida do sistema.")
    return redirect('categories')

@staff_member_required
def view_carries(request):
    carries = Carrier.objects.all()
    return render(request, "superuser/carries.html", {
        'carries': carries
    })

@staff_member_required
def add_carrier(request):
    if request.method == 'POST':
        form = CarrierForm(request.POST, request.FILES)
        if form.is_valid():
            form.save()
            messages.success(request, "Transportadora cadastrada com sucesso!")
            return redirect('carries')
    else:
        form = CarrierForm()
    return render(request, 'superuser/add_carrier.html', {
        'form': form
    })

@staff_member_required
def edit_carrier(request, carrier_id):
    carrier = get_object_or_404(Carrier, id=carrier_id)
    if request.method == 'POST':
        form = CarrierForm(request.POST, request.FILES, instance=carrier)
        if form.is_valid():
            form.save()
            return redirect('carries')
    else:
        form = CarrierForm(instance=carrier)
        messages.success(request, "Transportadora alterada com sucesso!")
        return render(request, 'superuser/edit_carrier.html', {
            'form': form,
            'carrier': carrier,
        })
    
@staff_member_required
def delete_carrier(request, carrier_id):
    carrier = get_object_or_404(Carrier, id=carrier_id)
    carrier.delete()
    messages.warning(request, "Transportadora remvoida do sistema.")
    return redirect('carries')

@staff_member_required
def view_discounts(request):
    discounts = Discount.objects.all()
    return render(request, "superuser/discounts.html", {
        'discounts': discounts
    })

@staff_member_required
def add_discount(request):
    if request.method == 'POST':
        form = DiscountForm(request.POST, request.FILES)
        if form.is_valid():
            form.save()
            messages.success(request, "Cupom cadastrado no sistema com sucesso!")
            return redirect ('discounts')
    else:
        form = DiscountForm()
    return render(request, 'superuser/add_discount.html', {
        'form': form
    })

@staff_member_required
def edit_discount(request, discount_id):
    discount = get_object_or_404(Discount, id=discount_id)
    if request.method == 'POST':
        form = DiscountForm(request.POST, request.FILES, instance=discount)
        if form.is_valid():
            form.save()
            return redirect('discounts')
    else:
        form = DiscountForm(instance=discount)
        messages.success(request, f"Cupom {discount.code} editado com sucesso!")
        return render(request, 'superuser/edit_discount.html', {
            'form': form,
            'discount': discount
        })
    
@staff_member_required
def delete_discount(request, discount_id):
    discount = get_object_or_404(Discount, id = discount_id)
    discount.delete()
    messages.warning(request, "Cupom de desconto removido do sistema.")
    return redirect('discounts')

@staff_member_required
def all_feedbacks(request):
    feedbacks = Feedback.objects.all().order_by('-created_at')
    return render(request, 'superuser/all_feedbacks.html', {
        'feedbacks': feedbacks
    })


@staff_member_required
def all_orders(request):
    orders = Order.objects.all().order_by('-created_at')
    return render(request, "superuser/all_orders.html", {
        'orders': orders
    })