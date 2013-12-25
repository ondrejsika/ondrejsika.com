---
layout: post
title:  "Latex editor Texmaker"
categories: blog

lang: CZ
---

Na linuxu jsem vždy psal LaTeX dokumnety ve vimu/sublimu a kompiloval z konzole, ale na windows to tak jednoducé není. Dále jsem potřeboval naučit v LaTeXu i neprogramátory a tak je konzone nepřípustná.

Proto jsem se koukal po nějakém editoru, který budu opensource, multiplatformní a bude mít vestavěný náhled. Bylo jich hodně, viz <http://en.wikipedia.org/wiki/Comparison_of_TeX_editors>.

Rozhodl jsem se pro [Texmaker](http://www.xm1math.net/texmaker/), fungoval hned napopré na Windows i na Linuxu. Hlavní jeho výhodou je, že má prohlížeč pdf v jednom okně a dobrý našeprávač. Na Debianu se instaluje z balíčků: `apt-get install texmaker`.

Ve výchozím nastavení má Texmaker pdf viewer v druhém okně. Nastavení kde přepnete do embeded módu.

`Options -> Configure Texmaker -> Commands -> PdfViewer: embeded (checkbox)`

viz.

![Texmaker embeded viewer](/static/content/texmaker_embeded_pdf_viewer.png)