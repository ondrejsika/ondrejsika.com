---
layout: post
title:  "Objekty v C (ne v C++)"
categories: blog

lang: CZ
---

### Vytvoření struktury objektu

Vytvoříme nový datový typ pro náš objekt. v našem případě se jmenuje Rectangle. Tento datový typ je struktura s proměnnými a, b a area.

```
typedef struct {
  int a;
  int b;
  int area;
} Rectangle ;
```

### Inicializační metoda (konstruktor)

Další důležitá část našeho objektu je inicializační metoda. Tou vytvoříme objekt a můžeme rovnou nastavit některé proměnné. K funkci RectangleArea se dostaneme později.

```
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

```
Rectangle *r = RectangleInit(10, 15);
```

### Ukázka metody sahající na proměnné objektu

Metoda RectangleArea spočte hodnotu plohy z parametů self.a, self.b a uloží ji do self.area.

```
void RectangleArea(Rectangle **pr) {
  Rectangle r = **pr; // vytvori si lokalni objekt z pointeru
  r.area = r.a * r.b;
  *pr = &r; // nahradi adresu v globalnim pointeru lokalni adresou
}
```

Volání metody objektu se provádí takto

```
Rectangle *r = RectangleInit(10, 15);
RectangleArea(&r); // spocte plochu
```

Ukázka práce s proměnnými objektu bez metod
Pro práci s proměnnými objektu je nutné vytvořit si objekt z daného pointeru.

```
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

```
int RectangleGetArea(Rectangle **pr){
  Rectangle r = **pr;
  return r.area;
}
```

volání

```
Rectangle *r = RectangleInit(10, 15);
int area = RectangleGetArea(&r);
```

### Ukázka celého kódu

```
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