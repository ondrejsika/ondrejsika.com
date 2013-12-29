---
layout: post
title:  "Business cards in LaTeX"
categories: blog

lang: EN
meta_keywords: businesscards, latex
---

My pretty business cards written in LaTeX.

* [Source](/static/content/businesscards_ondrejsika.tex)
* [PDF](/static/content/businesscards_ondrejsika.pdf)

### Preview

<img src="/static/content/businesscards_ondrejsika.png">

### Source

``` latex
% Business cards
%
% Ondrej Sika
%   www.ondrejsika.com
%   ondrej@ondrejsika.com


\documentclass[a4paper,11pt]{letter}
\usepackage[zw32010,crossmark]{ticket}

\renewcommand{\ticketdefault}{}
\newcommand{\vcard}[4]{\ticket{
    % size 85x54
    \put(10, 37){\tt \LARGE #1}
    \put(10, 22){\tt #2}
    \put(10, 17){\tt #3}
    \put(10, 12){\tt #4}
}}

\newcounter{numcards}
\begin{document}

\setcounter{numcards}{0}

\whiledo{\thenumcards<10}{
  \stepcounter{numcards}
  \vcard
  {Ondrej Sika}
  {www.ondrejsika.com}
  {ondrej@ondrejsika.com}
  {+ 420 773 452 376}
}

\end{document}
```
