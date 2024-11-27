from django import forms
from .models import Category, Carrier, Discount
from pages.models import Product  # Importando a model Product da app pages

class ProductForm(forms.ModelForm):
    class Meta:
        model = Product
        fields = ['name', 'description', 'price', 'image', 'stock_quantity']
       
class CategoryForm(forms.ModelForm):
    class Meta:
        model = Category
        fields = ['name', 'description', 'is_active']

class CarrierForm(forms.ModelForm):
    class Meta:
        model = Carrier
        fields = ['name', 'cnpj', 'phone', 'email']

class DiscountForm(forms.ModelForm):
    class Meta:
        model = Discount
        fields = ['code', 'description', 'discount_type', 'value', 'start_date', 'end_date', 'active']