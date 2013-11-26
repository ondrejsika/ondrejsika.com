---
layout: post
title:  "Different Forms in Django Admin"
categories: blog

lang: EN
---

Django admin class has method `get_form` where selet form for admin page. In default, get form from attribute `form` in ModelAdmin class or use `form_factory`.

If you have more forms for different users, you must rewrite method `get_form` like that.

```
def get_form(self, request, obj=None, **kwargs):
    if request.user.is_superuser:
        return super(PlaceAdmin, self).get_form(request, obj, form=MySuperuserForm, **kwargs)    
    return super(MyAdmin, self).get_form(request, obj, **kwargs)
```

### Example

#### models.py

```
from django.db import models

class Account(models.Model):
    name = models.CharField(max_length=128)
    ballance = models.ItegerField(default=0)
```

#### forms.py

```
from django import forms
from .models import Account

class AccountForm(forms.ModelForm):
    cladd Meta:
        model = Account

    def __init__(self, *args, **kwargs):
        super(AccountForm, self).__init__(*args, **kwargs)
        self.fields["ballance"].widget = forms.widgets.TextInut(attr={"disabled":"disabled"})

class AccountSuperuserForm(AccountForm):
    def __init__(self, *args, **kwargs):
        super(AccountSuperuserForm, self).__init__(*args, **kwargs)
        self.fields["ballance"].widget = forms.widgets.TextInut()
```

#### admin.py

```
from django.contrib import Admin

from .models import Account
from .forms import AccountForm, AccountSuperuserForm

class AccountAdmin(admin.ModelAdmin):
    form = AccountForm

    def get_form(self, request, obj=None, **kwargs):
        if request.user.is_superuser:
            return super(AccountAdmin, self).get_form(request, obj, form=AccountSuperuserForm, **kwargs)    
        return super(AccountAdmin, self).get_form(request, obj, **kwargs)

admin.site.register(Account, AccountAdmin)
```