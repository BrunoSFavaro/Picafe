from django.contrib import admin
from .models import Profile, UserAddress, UserPayments, Feedback, Message

# Register your models here.
admin.site.register(Profile)
admin.site.register(UserAddress)
admin.site.register(UserPayments)
admin.site.register(Feedback)
admin.site.register(Message)