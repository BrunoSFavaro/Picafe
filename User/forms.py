from django import forms
from User.models import UserAddress, UserPayments

class AddressForm(forms.ModelForm):
    class Meta:
        model = UserAddress
        fields = ['street', 'city', 'state', 'cep', 'country', 'is_default']

class PaymentForm(forms.ModelForm):
    class Meta:
        model = UserPayments
        fields = ['payment_type', 'card_holder_name', 'card_number', 'expiration_date', 'is_default']
       