---
layout: post
title:  "Objekty v C (ne v C++)"
categories: blog

lang: CZ
meta_description: Psaní objektového kódu v ANSI C
meta_keywords: C, ANSI C, oop, objektové programování
---

### Vytvoření struktury objektu

Vytvoříme nový datový typ pro náš objekt. v našem případě se jmenuje Rectangle. Tento datový typ je struktura s proměnnými a, b a area.

``` c
typedef struct {
  int a;
  int b;
  int area;
} Rectangle ;
```

### Inicializační metoda (konstruktor)

Další důležitá část našeho objektu je inicializační metoda. Tou vytvoříme objekt a můžeme rovnou nastavit některé proměnné. K funkci RectangleArea se dostaneme později.

``` c
Rectangle *RectangleInit(int a, int b){
  Rectangle r;
  r.a = a;
  r.b = b;
  Rectangle *pr = &r;
  RectangleArea(&pr);
  return pr;
}
```

Tato metoda vrací pointer na objekt. Inicializace objektu vypadá takto.

``` c
Rectangle *r = RectangleInit(10, 15);
```

### Ukázka metody sahající na proměnné objektu

Metoda RectangleArea spočte hodnotu plohy z parametů self.a, self.b a uloží ji do self.area.

``` c
void RectangleArea(Rectangle **pr) {
  Rectangle r = **pr; // vytvori si lokalni objekt z pointeru
  r.area = r.a * r.b;
  *pr = &r; // nahradi adresu v globalnim pointeru lokalni adresou
}
```

Volání metody objektu se provádí takto

``` c
Rectangle *r = RectangleInit(10, 15);
RectangleArea(&r); // spocte plochu
```

Ukázka práce s proměnnými objektu bez metod
Pro práci s proměnnými objektu je nutné vytvořit si objekt z daného pointeru.

``` c
Rectangle *r = RectangleInit(10, 15);
Rectangle r_ = *r; // vytvori instanci z pintru na nas objekt
r_.a = 5; // zmeni lokalni instanci
RectangleArea(&r); // spocte plochu
printf("a = %d, b = %d, area = %d", r_.a, r_.b, r_.area);
// vypise: a = 5, b = 15, area = 150
*r = &r_; // nahraje lokalni instanci jako objekt
RectangleArea(&r); // spocte plochu
printf("a = %d\nb = %d\n, area = %d", r_.a, r_.b, r_.area);
// vypise: a = 5, b = 15, area = 75
```

Ukázka metody vracející určitou proměnnou

``` c
int RectangleGetArea(Rectangle **pr){
  Rectangle r = **pr;
  return r.area;
}
```

volání

``` c
Rectangle *r = RectangleInit(10, 15);
int area = RectangleGetArea(&r);
```

### Ukázka celého kódu

``` c
#include <stdio.h>

// struktura promennych objektu
typedef struct {
  int a;
  int b;
  int area;
} Rectangle ;

// spocte a ulozi hodnotu area
void RectangleArea(Rectangle **pr) {
  Rectangle r = **pr;
  r.area = r.a * r.b;
  *pr = &r;
}

// vrati hodnotu v promenne area
int RectangleGetArea(Rectangle **pr){
  Rectangle r = **pr;
  return r.area;
}

// inicialzacni metoda objektu
Rectangle *RectangleInit(int a, int b){
  Rectangle r;
  r.a = a;
  r.b = b;
  Rectangle *pr = &r;
  RectangleArea(&pr); // aktualizuje hodnotu v area
  return pr;
}

int main() {
  Rectangle *a = RectangleInit(3, 2); // inicializace objektu
  printf("%d\n", RectangleGetArea(&a)); // ukazka pouziti metody vracici promennou objektu
  return 0;
}
```
