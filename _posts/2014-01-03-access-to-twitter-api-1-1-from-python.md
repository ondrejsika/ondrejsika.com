---
layout: post
title:  "Access to Twitter API v1.1 from Python"
categories: blog

lang: EN
meta_keywords: Python, API, Twitter, oauth, oauth2
---

Twitter api v1.1 require authentification everywhere. You must create account at <http://dev.twitter.com> and create app for consumer and access keys.

In Python, you may use `oauth2` library.

``` python
import oauth2

CONSUMER_KEY = "your app's consumer key"
CONSUMER_SECRET = "your app's consumer secret"
ACCESS_KEY = "your access token"
ACCESS_SECRET = "your access token secret"

consumer = oauth2.Consumer(key=CONSUMER_KEY, secret=CONSUMER_SECRET)
access_token = oauth2.Token(key=ACCESS_KEY, secret=ACCESS_SECRET)

client = oauth2.Client(consumer, access_token)

endpoint = "http://api.twitter.com/1.1/statuses/home_timeline.json"
response, data = client.request(endpoint)

print data
```