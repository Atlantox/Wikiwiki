from django.db import models

class Contact(models.Model):
    name = models.CharField(max_length=20, verbose_name='Name')
    icon = models.ImageField(upload_to='contact_icons', verbose_name='Icon')
    link = models.URLField(verbose_name='URL')
