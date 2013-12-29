---
layout: post
title:  "X app on Android"
date:   2013-11-08 12:56:53
categories: blog

lang: EN
meta_description: Tutorial how to display X output on Andoroid device.
meta_keywords: X, android, remote display
---

Tutorial how to display X output on Andoroid device.

When you connect your app with phone, you must intsall only [X server](https://play.google.com/store/apps/details?id=au.com.darkside.XServer) from Google Play to your Andoroid device. On linxu no requirements needed. The X server app not need root your Andoroid device.


After launch must set allowed ip for connect to this device loctad **menu -> access control**. Set here ip of your PC/Server.


Now set bash variable display to `<ip of android device>:0`

```
export DISPLAY="192.168.1.2:0"
xclock # and run some X application
```

That's all. Easy.