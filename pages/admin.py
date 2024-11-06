from django.contrib import admin
from .models import Product

class ProductAdmin(admin.ModelAdmin):
    list_display = ("id", "name", "price", "stock_quantity", "created_at")

# Register your models here.
admin.site.register(Product, ProductAdmin)
