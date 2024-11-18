from django.contrib import admin
from .models import Product, Cart, CartItem, Historic, Order

class ProductAdmin(admin.ModelAdmin):
    list_display = ("id", "name", "price", "stock_quantity", "created_at")

# Register your models here.
admin.site.register(Product, ProductAdmin)
admin.site.register(CartItem)
admin.site.register(Cart)
admin.site.register(Historic)
admin.site.register(Order)
