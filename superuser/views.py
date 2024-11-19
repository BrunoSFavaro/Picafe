from django.shortcuts import render
from django.contrib.admin.views.decorators import staff_member_required
from ..pages.models import Product

# Create your views here.

@staff_member_required
def admin_dashboard(request):
    products = Product.objects.all()
    return render(request, 'superuser/dashboard.html', {
        'products': products
    })
