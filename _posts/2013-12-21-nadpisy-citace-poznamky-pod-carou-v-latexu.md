---
layout: post
title:  "Nadpisy, citace, poznámky pod čarou v LaTeXu"
categories: blog

lang: CZ
meta_description: Základní příkazy na práci s Latextem
meta_keywords: Latex, nadpis, citace, literatura, poznámka pod čarou, příklady
---

### Nadpisy

Úrovně nadpisů

``` latex
\section{Header 1}
\subsection{Header 2}
\subsubsection{Header 3}
\paragraph{Header 4}
\subparagraph{Header 5}
```

Základní číslovaní nadpisů je do úrovně 3 (sections), pokud je potřeba nastait číslování jinak, na začátek souboru vložte `\setcounter{secnumdepth}{5}`, kde `5` je úroveň do které se má číslovat.

V obsahu se základně generuje pro nadpisy do úrovně 3 (sections). Pokud chcete generovat obsah z nadpisů jiného řádu, nastavte `\setcounter{tocdepth}{5}` kde `5` je úroveň do které se obsah generuje.


### Citace literatury

V textu stačí vložit `\cite{bookId}` kde `bookId` je identifikátor knihy. Ten se pak používá v seznamu literatury. Ten vypadá takto:

``` latex
\begin{thebibliography}{00}
  \bibitem{bookId} Autor: Kniha, Nakladatelství, Praha, 1994. ISBN 80-85867-35-4
\end{thebibliography}
```

Počet nul v `\begin{thebibliography}{00}` znamená počet na míst na zarovnávání v seznamu literatury.

### Citace textu

Pro citování textu stačí:

``` latex
\begin{quote}
``Education is the most powerful weapon which you can use to change the world.'' Nelson Mandela
\end{quote}
```

### Poznámky pod čarou.

Do textu stačí vložit `\footnote{Text poznámky}`

### Příklady

nejdříve si musíme nadefinovat 2 příkazy (`\et` a `\el`), čítače, které budou pro zjednodučení v jednom příkazu vypisovat hodnotu a zároveň inkrementovat.

``` latex
\newcounter{et} % example in text
\newcounter{el} % example in list

\newcommand{\et}{\stepcounter{et}(\theet)}
\newcommand{\el}{\stepcounter{el}(\theel)}
```

A použijeme je takto:

``` latex
Lorem Ipsum is simply dummy text of the printing and typesetting industry \et.
It has survived not only five centuries, but also the leap into
electronic typesetting \et, remaining essentially unchanged \et.


\el Example ...

\el Example ...

\el Example ...


Lorem Ipsum is simply dummy text of the printing and typesetting industry \et.
It has survived not only five centuries, but also the leap into
electronic typesetting \et, remaining essentially unchanged \et.


\el Example ...

\el Example ...

\el Example ...
```

Výsledkem je:

```
Lorem Ipsum is simply dummy text of the printing and typesetting industry (1).
It has survived not only five centuries, but also the leap into electronic
typesetting (2), remaining essentially unchanged (3).

(1) Example ...
(2) Example ...
(3) Example ...

Lorem Ipsum is simply dummy text of the printing and typesetting industry (4).
It has survived not only five centuries, but also the leap into electronic
typesetting (5), remaining essentially unchanged (6).

(4) Example ...
(5) Example ...
(6) Example ...
```
