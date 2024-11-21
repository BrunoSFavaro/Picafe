from django.contrib.auth.models import User as AuthUser  # Renomeie o modelo User para AuthUser
from django.contrib.auth import authenticate, login, logout
from django.http import HttpResponseRedirect
from django.shortcuts import redirect, render
from django.urls import reverse
from django.contrib.auth.models import User
from django.contrib.auth.decorators import login_required

import User

# Create your views here.
def index(request):
    if not request.user.is_authenticated:
        return HttpResponseRedirect(reverse("login"))
    return render(request, "User/user.html")

def login_view(request):
    if request.method == "POST":
        username = request.POST["username"]
        password = request.POST["password"]

        user = authenticate(request, username=username, password=password)

            # If user objet is returned, log in and route to index page:
        if user:
            login(request, user)
            return HttpResponseRedirect(reverse("index"))
            # Otherwise, return login page again with new context
        else:
            return render(request, "User/login.html", {
            "message": "Usuário ou senha inválido"
            })
        
    return render(request, "User/login.html")

def logout_view(request):
    logout(request)
    return render(request, "User/login.html", {
        "message": "Logged Out"
    })

def signup(request):
    if request.method == "POST":
        username = request.POST["username"]
        first_name = request.POST['first']
        last_name = request.POST['last']
        password = request.POST["password"]
        email = request.POST["email"]

        # Creating a new user
        user = AuthUser.objects.create_user(username=username, password=password, email=email)
        user.first_name = first_name
        user.last_name = last_name
        user.save()

        # Authenticate and login the user automatically after the sign up
        login(request, user)
        return redirect("index")  # Redirect to index 

    return render(request, "User/signup.html")

@login_required
def profile(request):
    return render(request, "User/profile.html")