# Generated by Django 4.1.7 on 2023-03-05 21:19

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('articles', '0006_alter_article_views'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='summary',
            name='summary',
        ),
        migrations.AddField(
            model_name='summary',
            name='content',
            field=models.TextField(default=None, null=True, verbose_name="Article's summary content"),
        ),
    ]
