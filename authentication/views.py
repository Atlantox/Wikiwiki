from django.shortcuts import render, redirect
from django.contrib.auth import login, logout, authenticate
from django import forms
from comments.models import Author, FavouriteArticles
from django.contrib.auth.forms import AuthenticationForm
from django.contrib.auth.forms import UserCreationForm
from django.contrib import messages
from django.views import View

class register(View):
    def get(self, request):
        ''' Return the register view '''

        return render(request, 'authentication/register.html', {'form': myUserCreationForm()})

    def post(self, request):
        ''' Check if the registration is available, then redirect the user to set_nickname and log in '''

        form = myUserCreationForm(request.POST)

        if form.is_valid():
            user = form.save()
            new_author = Author(user=user, nickname=user.username)
            new_author.save()
            FavouriteArticles.objects.create(user=new_author)
            login(request, user)
            return redirect('set_nickname')
        else:
            for msg in form.error_messages:
                messages.error(request, form.error_messages[msg])

            return render(request, 'authentication/register.html', {'form': form})
            

class log_in(View):
    def get(self, request):
        ''' Display the log in view '''

        if request.user.is_authenticated:
            return redirect('Home')
        else:
            return render(request, 'authentication/login.html', {'form': MyUserAuthenticationForm()})

    def post(self, request):
        ''' Check if the login info is avaiable, then log the user and redirect to home '''

        if not request.user.is_authenticated:
            username = request.POST['username']
            password = request.POST['password']
            form = MyUserAuthenticationForm(request, {'username': username, 'password': password})

            if form.is_valid():
                user = authenticate(username=username, password=password)
                if user is not None:
                    login(request, user)
                    return redirect('Home')
                else:
                    messages.error(request, 'Username or password wrong')
            else:
                for msg in form.error_messages:
                    messages.error(request, form.error_messages[msg])

            return render(request, 'authentication/login.html', {'form': form})
        else:
            redirect('Home')


def log_out(request):
    ''' Logout the user '''

    logout(request)
    return redirect('Home')


class set_nickname(View):
    def get(self, request):
        ''' Diplay a form to set the user's nickname '''

        if request.user.is_authenticated:
            return render(request, 'authentication/set_nickname.html', {'form': SetNicknameForm()})
        else:
            redirect('Home')

    def post(self, request):
        ''' Check if the form of nickname is available, then set the nickname and redirect to home '''

        if request.user.is_authenticated:
            form = SetNicknameForm(request.POST)
            if form.is_valid():
                author = Author.objects.get(user=request.user)
                author.nickname = form.cleaned_data['nickname']
                author.save()
                favourites = FavouriteArticles(user=author)
                favourites.save()
                return redirect('Home')
            else:
                for msg in form.error_messages:
                    messages.error(request, form.error_messages[msg])
                return render(request, 'authentication/set_nickname.html', {'form': form})
        else:
            redirect('Home')
        
        
#######    F O R M S    #######

class SetNicknameForm(forms.Form):
    ''' The set nickname form '''

    nickname = forms.CharField(
        max_length=20,
        label='Nickname',
        help_text='Max 20 characters',
        widget=forms.TextInput(
            attrs= {
                'class': 'fs-5 bg-primary-light mb-5'
            }
        )
    )

class myUserCreationForm(UserCreationForm):
    ''' The user creation form '''

    error_messages = {
        'password_mismatch': "Password or username invalid (can't have blank spaces)"
    }

    def __init__(self, *args, **kwargs):
        super(myUserCreationForm, self).__init__(*args, **kwargs)

        self.fields['username'].widget.attrs['class'] = 'fs-5 bg-primary-light mb-5'
        self.fields['password1'].widget.attrs['class'] = 'fs-5 bg-primary-light mb-5'
        self.fields['password2'].widget.attrs['class'] = 'fs-5 bg-primary-light mb-5'


class MyUserAuthenticationForm(AuthenticationForm):
     ''' The user login form '''

     def __init__(self, *args, **kwargs):
        super(MyUserAuthenticationForm, self).__init__(*args, **kwargs)

        self.fields['username'].widget.attrs['class'] = 'fs-5 bg-primary-light mb-5'
        self.fields['password'].widget.attrs['class'] = 'fs-5 bg-primary-light mb-5'