from django.test import TestCase, Client
from django.urls import reverse
from django.contrib.auth.models import User
from comments.models import Author

class AuthenticationTest(TestCase):
    def setUp(self):
        self.username = 'original_username'
        self.password = 'original_password'
        self.nickname = 'default nickname'
        self.defaultUser = User.objects.create_user(self.username, password=self.password)
        Author.objects.create(user=self.defaultUser, nickname=self.nickname)

    def test_user_try_register_with_valid_data(self):
        '''
        Users can register in the register view only needs an username and password
        If the register is successfull the users log in and is redirected to another form to set him nickname
        The user nickname 
        '''
        username = 'example_username'
        password = 'ex4mPl3_pAssvvOrd.'

        c = Client()
        response = c.post(reverse('register'),{
            'username': username,
            'password1': password,
            'password2': password
            },
            follow=True)
        
        self.assertEqual(response.status_code, 200)
        self.assertContains(response, 'Set your nickname')
        users = User.objects.filter(username = username)
        self.assertEqual(users.first().username, username)

    def test_user_try_register_with_invalid_data(self):
        ''' 
        Users can't register if the form has invalid data
        Invalid data consists in wrong username or password format and passwords not match
        The errors are displayed in the form
        '''
        username = 'example_username'
        password = 'ex4mPl3_pAssvvOrd.'

        data = {
            'username': username,
            'password1': password,
            'password2': 'other_password'
            }

        c = Client()
        # passwords not match
        response = c.post(reverse('register'), data)        
        self.assertEqual(response.status_code, 200)
        self.assertContains(response, 'Password or username invalid')

        # invalid username (blank spaces)
        data['password2'] = password
        data['username'] = 'invalid username'
        response = c.post(reverse('register'), data)        
        self.assertEqual(response.status_code, 200)
        self.assertContains(response, 'Password or username invalid')

        # invalid password (too common)
        data['password1'] = 'password'
        data['password2'] = 'password'
        data['username'] = username
        response = c.post(reverse('register'), data)        
        self.assertEqual(response.status_code, 200)
        self.assertContains(response, 'Password or username invalid')

    def test_not_logged_users_cant_visit_set_nickname_view(self):
        '''
        The set nickname view it's only for logged users
        If an user not logged in tries to get this view, the user are redirected to Home
        '''
        response = self.client.get(reverse('set_nickname'), follow=True)

        self.assertEqual(response.status_code, 200)
        self.assertContains(response, 'Welcome to WikiWiki')

    def test_logged_users_can_visit_set_nickname_view(self):
        '''
        The set nickname view it's only for logged users
        '''
        c = Client()

        response = c.post(reverse('log_in'),{
            'username': self.username,
            'password': self.password,
            },
            follow=True)
        
        self.assertEqual(response.status_code, 200)

        response = c.get(reverse('set_nickname'))

        self.assertEqual(response.status_code, 200)
        self.assertContains(response, 'Set your nickname')

    def test_users_sets_him_nickname(self):
        '''
        After an user sets him nickname, is redirected to home
        The nickname is displayed in the navbar
        '''
        c = Client()
        response = c.post(reverse('log_in'),{
            'username': self.username,
            'password': self.password,
            },
            follow=True)
        
        self.assertEqual(response.status_code, 200)

        nickname = 'my_nickname'
        response = c.post(reverse('set_nickname'), {'nickname':nickname}, follow=True)

        self.assertEqual(response.status_code, 200)
        self.assertContains(response, nickname)
        author = Author.objects.get(user=self.defaultUser)
        self.assertEqual(author.nickname, nickname)

    def test_user_try_login_with_valid_data(self):
        '''
        A registered user can login with correct username and password
        The user is redirected to Home and shows the nickname in the navbar
        '''
        c = Client()

        response = c.post(reverse('log_in'),{
            'username': self.username,
            'password': self.password,
            },
            follow=True)
        
        self.assertEqual(response.status_code, 200)
        self.assertContains(response, self.nickname)

    def test_user_try_login_with_invalid_data(self):
        '''
        A registered user can login with correct username and password
        '''
        c = Client()
        response = c.post(reverse('log_in'),{
            'username': self.username,
            'password': 'wrong password',
            },
            follow=True)
        
        self.assertEqual(response.status_code, 200)
        self.assertContains(response, 'Please enter a correct %(username)s and password. Note that both fields may be case-sensitive.')

        
