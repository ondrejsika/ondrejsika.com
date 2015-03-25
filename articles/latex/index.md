---
layout: default
title: LaTeX
---

[articles](..)

## {{ page.title }}

### Books

* Wikibooks/LaTeX - velmi podrobny web/pdf navod - <https://en.wikibooks.org/wiki/LaTeX>


Moje postrehy ohledne LaTeXu.


#### Zdrojove kody

Misto tradicniho vermatimu pouzivam balik listing, hlavne protoze umi zalomovani radku ve zdrojovych kodech.

Musime jej nejdrive naimportovat a trosku nastavit:

```
\usepackage{listings}
\lstset{
    breaklines=true,
    numbers=left,
    numberstyle=\scriptsize,
    frame=leftline,
    basicstyle=\ttfamily}
```

potom muzeme pouzivat inline funkci lstinline:

```
... klicove slovo \lstinline|lambda| deklaruje inline ...
```

a take blokovy zapis

```
\begin{lstlisting}
def hello():
    print('Hello world')
\end{lstlisting}
```

* Vice o baliku listings - <https://en.wikibooks.org/wiki/LaTeX/Source_Code_Listings>

#### Citace

Ukazka citace knihy a z internetu

```
\begin{thebibliography}{10}
  % Citace knihy
  \bibitem{python-kniha}Ondrej Sika:
    {\em Python kniha}.\\
    Sika Press, Praha, 2015.\\
    ISBN 80-85867-35-4.\\
    \lstinline|https://ondrejsika.com/books/python-kniha|
  % Citace z internetu
  \bibitem{homesim}Ondrej Sika:
    {\em Latex paper examples}. (brezen 2015).\\
    \lstinline|https://ondrejsika.com/others/latex/|
\end{thebibliography}
```

### Sablony

* Paper one column: [TEX](/static/content/latex/templates/paper1.tex) [PDF](/static/content/latex/templates/paper1.pdf)
* Paper two column: [TEX](/static/content/latex/templates/paper2.tex) [PDF](/static/content/latex/templates/paper2.pdf)


