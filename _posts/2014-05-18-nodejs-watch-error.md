---
layout: post
title: NodeJS watch error
categories: blog

lang: EN
meta_keywords: node, nodejs, js, watch, watch error
---

### Problem

```
/usr/local/lib/node_modules/coffee-script/lib/coffee-script/command.js:334
throw e;
^
Error: watch ENOSPC
at errnoException (fs.js:1019:11)
at FSWatcher.start (fs.js:1051:11)
at Object.fs.watch (fs.js:1076:11)
at watchDir (/usr/local/lib/node_modules/coffee-script/lib/coffee-script/command.js:299:27)
at /usr/local/lib/node_modules/coffee-script/lib/coffee-script/command.js:102:11
at Object.oncomplete (fs.js:107:15)
```

### Solution

``` bash
echo fs.inotify.max_user_watches=524288 | sudo tee -a /etc/sysctl.conf && sudo sysctl -p
```

