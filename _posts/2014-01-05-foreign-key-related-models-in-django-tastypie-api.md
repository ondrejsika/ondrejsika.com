---
layout: post
title: Foreign key related models in django-tastypie API
categories: blog

lang: EN
meta_keywords: api, rest, tastypie, django-tastypie, fk, foreignkey, foreign key
---

Example models structure in file `example/models.py`

``` python
from django.db import models

class Gallery(models.Model):
    name = models.CharField(max_length=64)

class Image(models.Model):
    gallery = models.ForeignKey(Gallery)
    name = models.CharField(max_length=64)
    file = models.ImageField(upload_to="files")
```

Basic resource class look like this. file `example/api/resources.py`

``` python
from tastypie.resources import ModelResource
from ..models import Image, Gallery

class ImageResource(ModelResource):
    class Meta:
        queryset = Image.objects.all()
        allowed_methods = ['get']

class GalleryResource(ModelResource):
    class Meta:
        queryset = Gallery.objects.all()
        allowed_methods = ['get']
```

Apis response for `GET /api/v1/gallery/1/?format=json`

``` json
{
    "id": 1,
    "name": "My family",
    "resource_uri": "/api/v1/gallery/1/"
}
```

You must add `ToManyField` field to `GalleryResource` class. Firest argument is related resource, second related name.

in file `example/api/resource.py`

``` python
from tastypie.resources import ModelResource
from tastypie import fields
from ..models import Image, Gallery

class ImageResource(ModelResource):
    class Meta:
        queryset = Image.objects.all()
        allowed_methods = ['get']

class GalleryResource(ModelResource):
    images = fields.ToManyField(ImageResource, 'image_set')
    class Meta:
        queryset = Gallery.objects.all()
        allowed_methods = ['get']
```

Now return list of image api urls.

``` json
{
    "id": 1,
    "name": "My family",
    "images": [
        "/api/v1/image/1/",
        "/api/v1/image/2/",
    ],
    "resource_uri": "/api/v1/gallery/1/"
}
```

If you want list of related object must set third parameter `full=True`.

``` python
images = fields.ToManyField(ImageResource, 'image_set', full=True)
```

Now response include full related objects

``` json
{
    "id": 1,
    "name": "My family",
    "images": [
        {
            "name": "My parrents",
            "file": "/static/uploads/files/myparrents.jpg",
            "/api/v1/image/1/"
        },
        {
            "name": "My with dog",
            "file": "/static/uploads/files/mewithdog.jpg",
            "/api/v1/image/2/"
        }
    ],
    "resource_uri": "/api/v1/gallery/1/"
}
```