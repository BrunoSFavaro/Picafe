from django import forms
from .models import Category
from pages.models import Product  # Importando a model Product da app pages

class ProductForm(forms.ModelForm):
    class Meta:
        model = Product
        fields = ['name', 'description', 'price', 'image', 'stock_quantity']
       
class CategoryForm(forms.ModelForm):
    class Meta:
        model = Category
        fields = ['name', 'description', 'is_active']