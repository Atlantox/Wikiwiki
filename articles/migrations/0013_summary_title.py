# Generated by Django 4.1.7 on 2023-03-22 14:42

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('articles', '0012_remove_summary_article_article_summary'),
    ]

    operations = [
        migrations.AddField(
            model_name='summary',
            name='title',
            field=models.CharField(default='', max_length=40, verbose_name='Title'),
        ),
    ]
