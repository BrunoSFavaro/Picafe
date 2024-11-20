from django import forms
from pages.models import Product  # Importando a model Product da app pages

class ProductForm(forms.ModelForm):
    class Meta:
        model = Product
        fields = ['name', 'description', 'price', 'image', 'stock_quantity']
       
