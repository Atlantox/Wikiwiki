# Generated by Django 4.1.7 on 2023-03-16 19:31

import django.core.validators
from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        ('articles', '0011_alter_article_main_alter_article_other_names_and_more'),
    ]

    operations = [
        migrations.CreateModel(
            name='Comment',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('content', models.CharField(max_length=200, validators=[django.core.validators.RegexValidator('.[<->]', 'The field contains suspicous content', inverse_match=True)], verbose_name='Content')),
                ('created', models.DateTimeField(auto_now=True, verbose_name='Created at')),
                ('article', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='articles.article', verbose_name='Target article')),
            ],
            options={
                'verbose_name': 'Comment',
                'verbose_name_plural': 'Comments',
            },
        ),
    ]
