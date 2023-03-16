# Generated by Django 4.1.7 on 2023-03-16 21:46

from django.conf import settings
import django.core.validators
from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
        ('comments', '0001_initial'),
    ]

    operations = [
        migrations.AlterField(
            model_name='comment',
            name='content',
            field=models.CharField(max_length=200, validators=[django.core.validators.RegexValidator('.[<->]', 'The field contains suspicous content', inverse_match=True), django.core.validators.MinLengthValidator(5)], verbose_name='Content'),
        ),
        migrations.CreateModel(
            name='Author',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('nickname', models.CharField(max_length=20, validators=[django.core.validators.RegexValidator('.[<->]', 'The field contains suspicous content', inverse_match=True), django.core.validators.MinLengthValidator(4)], verbose_name='User Nickname')),
                ('user', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to=settings.AUTH_USER_MODEL, verbose_name='User')),
            ],
        ),
        migrations.AddField(
            model_name='comment',
            name='author',
            field=models.ForeignKey(default=None, on_delete=django.db.models.deletion.CASCADE, to='comments.author', verbose_name='Registered author'),
        ),
    ]