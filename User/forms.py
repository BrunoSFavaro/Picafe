from django import forms
from User.models import UserAddress  # Importando a model Product da app pages

class AddressForm(forms.ModelForm):
    class Meta:
        model = UserAddress
        fields = ['street', 'city', 'state', 'cep', 'country', 'is_default']
       