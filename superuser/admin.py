from django.contrib import admin
from .models import Category, Carrier, Discount

# Register your models here.
admin.site.register(Category)
admin.site.register(Carrier)
admin.site.register(Discount)