# Generated by Django 4.1.7 on 2023-02-27 17:05

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('articles', '0005_alter_article_other_names'),
    ]

    operations = [
        migrations.AlterField(
            model_name='article',
            name='views',
            field=models.PositiveBigIntegerField(default=0, null=True, verbose_name='Views number'),
        ),
    ]
