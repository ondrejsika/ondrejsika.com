---
layout: post
title: Screenshot in i3wm with scrot
categories: blog

lang: EN
meta_keywords: screenshot, scrot, i3wm
---

### Simple via import

```
import screenshot.png
```

### Or via scrot

```
apt-get install scrot
```

### Basic usage

```
scrot  # simple printscreen
scrot -d 5  # with 5 sec delay
scrot -s  # select rectange or window
scrot screenshot.png  # into specific file
scrot -h  # help
```

### Bind in i3wm

append i3wm config

```
bindsym $mod+F11 exec scrot
bindsym $mod+F12 exec scrot -s

bindsym Print exec scrot
bindsym $mod+Print exec scrot -s
```
