from django.db import models
from django.contrib.auth.models import User

# Create your models here.
class Profile(models.Model):
    user = models.OneToOneField(User, on_delete=models.CASCADE)
    profile_image = models.ImageField(upload_to='profile_images/', blank=True, null=True)

    def __str__(self):
        return self.user.username

class UserAddress(models.Model):
    user = models.ForeignKey(User, on_delete=models.CASCADE, related_name="addresses")
    country = models.CharField(max_length=50)
    state = models.CharField(max_length=50)
    city = models.CharField(max_length=50)
    cep = models.CharField(max_length=20)
    street = models.CharField(max_length=255)
    is_default = models.BooleanField(default=False)

    def save(self, *args, **kwargs):
        if self.is_default:
            UserAddress.objects.filter(user=self.user, is_default=True).update(is_default=False)
        super().save(*args, **kwargs)

    def __str__(self):
        return f"{self.user.username} - {self.street}, {self.city}"
    
