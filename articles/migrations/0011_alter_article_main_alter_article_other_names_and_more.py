# Generated by Django 4.1.7 on 2023-03-16 19:31

import django.core.validators
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('articles', '0010_alter_article_main_alter_article_other_names_and_more'),
    ]

    operations = [
        migrations.AlterField(
            model_name='article',
            name='main',
            field=models.TextField(validators=[django.core.validators.RegexValidator('.[<->]', 'The field contains suspicous content', inverse_match=True)], verbose_name='Main content'),
        ),
        migrations.AlterField(
            model_name='article',
            name='other_names',
            field=models.TextField(blank=True, null=True, validators=[django.core.validators.RegexValidator('.[<->]', 'The field contains suspicous content', inverse_match=True)], verbose_name='Other names'),
        ),
        migrations.AlterField(
            model_name='section',
            name='content',
            field=models.TextField(blank=True, null=True, validators=[django.core.validators.RegexValidator('.[<->]', 'The field contains suspicous content', inverse_match=True)], verbose_name='Section text'),
        ),
        migrations.AlterField(
            model_name='summary',
            name='content',
            field=models.TextField(default=None, null=True, validators=[django.core.validators.RegexValidator('.[<->]', 'The field contains suspicous content', inverse_match=True)], verbose_name="Summary's content. Follow this format: name1:value1;name2:value2 \n\n Place #C before any name to set it as censored: #Cstatus:alive"),
        ),
    ]
