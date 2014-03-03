---
layout: post
title: Přepínání klávesnice v i3wm
categories: blog

lang: CZ
meta_keywords: i3wm, prepínání klávesnice v i3wm
---

Klávesnice se dají přepínat pomocí příkazu `xsetkbmap`, tento příkaz si namapuji na
klávesové zkratky v i3wm. Na konec konfiguračního souboru přidám:

```
bindsym $mod+F1 exec setxkbmap us         # pro anglickou klavesnici
bindsym $mod+F2 exec setxkbmap cz qwerty  # pro ceskou qwerty klavesnic
```

a stačí jen restartovat i3wm
