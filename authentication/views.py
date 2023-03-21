from django.shortcuts import render, redirect
from django.contrib.auth.models import User
from django.contrib.auth import login, logout
from django.contrib.auth.forms import AuthenticationForm
from django.contrib.auth.forms import UserCreationForm
from django.contrib import messages
from django.views import View

class register(View):
    def get(self, request):
        return render(request, 'authentication/register.html', {'form': UserCreationForm()})

    def post(self, request):
        pass

class log_in(View):
    def get(self, request):
        if request.user.is_authenticated:
            return redirect('Home')
        else:
            return render(request, 'authentication/login.html', {'form': AuthenticationForm()})

    def post(self, request):
        pass


def log_out(request):
    logout(request)
    return redirect('Home')