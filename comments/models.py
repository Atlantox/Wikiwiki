from django.db import models
from django.contrib.auth.models import User
from articles.models import Article, XSS_VALIDATOR
from django.core.validators import MinLengthValidator


class Author(models.Model):
    user = models.ForeignKey(User, verbose_name='User', on_delete=models.CASCADE, default=None, null=True)
    nickname = models.CharField(max_length=20, verbose_name='User Nickname',
                                validators=[XSS_VALIDATOR, MinLengthValidator(4)])
    
    def __str__(self):
        return self.nickname

    class Meta:
        verbose_name = 'Author'
        verbose_name_plural = 'Authors'

class Comment(models.Model):
    author = models.ForeignKey(Author, verbose_name='Registered author', on_delete=models.CASCADE, default=None, null=True)
    content = models.CharField(max_length=200, verbose_name='Content', validators=[XSS_VALIDATOR, MinLengthValidator(5)])
    article = models.ForeignKey(Article, verbose_name='Target article', on_delete=models.CASCADE)
    created = models.DateTimeField(verbose_name='Created at', auto_now=True)

    def __str__(self):
        return self.content[:50]
    
    class Meta:
        verbose_name = 'Comment'
        verbose_name_plural = 'Comments'