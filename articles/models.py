from django.core.validators import RegexValidator
from django.db import models

ARTICLE_TITLE_LENGTH = 40
XSS_VALIDATOR = RegexValidator('.[<->]','The field contains suspicous content',inverse_match=True)

class Image(models.Model):
    title = models.CharField(max_length=30, verbose_name='Image title')
    img = models.ImageField(upload_to='article_imgs', verbose_name='Image')
    description = models.TextField(verbose_name='Description', blank=True, null=True)

    class Meta():
        verbose_name= 'Article image'
        verbose_name_plural= 'Article images'

    def __str__(self):
        return self.title


class SectionType(models.Model):
    name = models.CharField(max_length=30, unique=True, verbose_name='Name')

    class Meta():
        verbose_name= 'Section type'
        verbose_name_plural= 'Section types'

    def __str__(self):
        return self.name


class Category(models.Model):
    name = models.CharField(max_length=30, unique=True, verbose_name='Name')
    img = models.ForeignKey(Image, verbose_name='Category image', null=True, default=None, on_delete=models.SET_NULL)

    class Meta():
        verbose_name= 'Article category'
        verbose_name_plural= 'Article categories'

    def __str__(self):
        return self.name

class Summary(models.Model):
    title = models.CharField(max_length=ARTICLE_TITLE_LENGTH, verbose_name='Title', default='')
    content = models.TextField(verbose_name="Summary's content. Follow this format: name1:value1;name2:value2 \n\n Place #C before any name to set it as censored: #Cstatus:alive", 
                               default=None, null=True, validators=[XSS_VALIDATOR])

    class Meta():
        verbose_name= 'Article summary'
        verbose_name_plural= 'Articles summaries'

    def __str__(self):
        return self.title

class Article(models.Model):
    title = models.CharField(max_length=ARTICLE_TITLE_LENGTH, verbose_name='Title')
    other_names = models.TextField(verbose_name='Other names', blank=True, null=True, validators=[XSS_VALIDATOR])
    images = models.ManyToManyField(Image, verbose_name="Article main image(s)")
    summary = models.OneToOneField(Summary, verbose_name='Summary', default=None, null=True, on_delete=models.SET_NULL)
    category = models.ManyToManyField(Category, verbose_name='Categories')
    main = models.TextField(verbose_name='Main content', validators=[XSS_VALIDATOR]) # This are the firsts paragraphs of content   
    views = models.PositiveBigIntegerField(verbose_name='Views number', null=True, default=0)
    created = models.DateTimeField(verbose_name='Created at', auto_now=True)

    class Meta():
        verbose_name= 'Article'
        verbose_name_plural= 'Articles'

    def __str__(self):
        return self.title
    

class Section(models.Model):
    title = models.CharField(max_length=ARTICLE_TITLE_LENGTH, verbose_name='Title')
    content = models.TextField(verbose_name='Section text. To create a list use #; as separator', blank=True, null=True, validators=[XSS_VALIDATOR])
    targetArticle = models.ForeignKey(Article, verbose_name='Target article', on_delete=models.CASCADE)
    images = models.ManyToManyField(Image, verbose_name='Section images', blank=True)
    sectionType = models.ForeignKey(SectionType, verbose_name='Section type', on_delete=models.SET_NULL, null=True)
    order = models.PositiveIntegerField(default=0, verbose_name='Show order')
    visible = models.BooleanField(default=True, verbose_name='Is visible')
    collapse = models.BooleanField(default=False, verbose_name='Is collapse')

    class Meta():
        verbose_name= 'Article section'
        verbose_name_plural= 'Article sections'

    def __str__(self):
        return f'{self.title}: {self.targetArticle.title}'


class RelatedArticles(models.Model):
    article_title = models.CharField(max_length=ARTICLE_TITLE_LENGTH, verbose_name="Title of target article")
    related = models.ManyToManyField(Article, verbose_name='Related articles')

    class Meta():
        verbose_name= 'Related articles'
        verbose_name_plural= 'Related articles'

    def __str__(self):
        return self.article_title