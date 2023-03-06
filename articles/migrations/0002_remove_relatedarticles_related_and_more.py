# Generated by Django 4.1.7 on 2023-02-27 16:32

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('articles', '0001_initial'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='relatedarticles',
            name='related',
        ),
        migrations.RemoveField(
            model_name='section',
            name='articleType',
        ),
        migrations.RemoveField(
            model_name='section',
            name='images',
        ),
        migrations.RemoveField(
            model_name='section',
            name='targetArticle',
        ),
        migrations.RemoveField(
            model_name='summary',
            name='article',
        ),
        migrations.DeleteModel(
            name='Article',
        ),
        migrations.DeleteModel(
            name='Category',
        ),
        migrations.DeleteModel(
            name='Image',
        ),
        migrations.DeleteModel(
            name='RelatedArticles',
        ),
        migrations.DeleteModel(
            name='Section',
        ),
        migrations.DeleteModel(
            name='SectionType',
        ),
        migrations.DeleteModel(
            name='Summary',
        ),
    ]