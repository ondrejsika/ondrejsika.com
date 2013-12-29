---
layout: post
title:  "Cross origin requests in Flask"
categories: blog

lang: EN
meta_keywords: python, flask, access controll, cross site
---

I was simplify [Decorator for the HTTP Access Control](http://flask.pocoo.org/snippets/56/) to

``` python
from functools import update_wrapper
from flask import  make_response

def access_controll_allow_all(f):
    def wrapper(*args, **kwargs):
        response = make_response(f(*args, **kwargs))
        response.headers['Access-Control-Allow-Origin'] = "*"
        response.headers['Access-Control-Allow-Methods'] = "*"
        response.headers['Access-Control-Allow-Headers'] = "*"
        return response
    f.provide_automatic_options = False
    return update_wrapper(wrapper, f)
```

#### Example of usage

``` python
from functools import update_wrapper
from flask import  make_response

def access_controll_allow_all(f):
    def wrapper(*args, **kwargs):
        response = make_response(f(*args, **kwargs))
        response.headers['Access-Control-Allow-Origin'] = "*"
        response.headers['Access-Control-Allow-Methods'] = "*"
        response.headers['Access-Control-Allow-Headers'] = "*"
        return response
    f.provide_automatic_options = False
    return update_wrapper(wrapper, f)


from flask import Flask

app = Flask(__name__)

@app.route("/")
@access_controll_allow_all
def hello():
    return "Hello World!"

if __name__ == "__main__":
    app.debug = True
    app.run()
```