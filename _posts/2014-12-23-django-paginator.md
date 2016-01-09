---
layout: post
title: Django Paginator

lang: CS
---

Django ma v jadru pekny system na strankovani, viz [dokumentace](https://docs.djangoproject.com/en/1.7/topics/pagination/).

Pripravil jsem si 2 funkce ktere mi zjednodusi praci s timto objektem, jednu generickou a jedu pro jednoduche pouziti a DRY (dont repeat yourself).

Prvni funkce vrati stranku, pokud stranka neexistuje pouzije nejlepsi moznou variantu.

    def get_page(object_list, per_page, page_no):
        paginator = Paginator(object_list, per_page)
        if page_no < 1:
            page_no = 1
        if page_no > paginator.num_pages:
            page_no = paginator.num_pages
        return paginator.page(page_no)

Priklad pouziti je

    def view(request):
        try:
            page_no = int(request.GET.get('page', 1))
        except (ValueError, TypeError):
            page_no = 1

        return render(request, 'template.html', {
            'page': get_page(Model.object.all(), 20, page_no),
        }

Nebo muzeme zobecnit funkci get_page a predavat ji jen request. Budete mit hezci view :)

    def get_page_from_request(object_list, request):
        try:
            page_no = int(request.GET.get('page', 1))
        except (ValueError, TypeError):
            page_no = 1

        return get_page(object_list, 20, page_no)

pak bude view vypadat takto

    def view(request):
        return render(request, 'template.html', {
            'page': get_page_from_request(Model.object.all(), request),
        }

Dale jsem si pripravil strankovaci sablonu v Bootstrapu, ktera pro mene nez 10 stranek ukaze vsechny cisla stranek a
pro vic nez 10 ukaze aktualni, prvni, posledni, predchozi a nasledujici. Ukazka zde:

    {% raw %}
    {% if page.paginator.num_pages > 1 %}
        <nav>
            <ul class="pagination">
                {% if page.paginator.num_pages < 10 %}
                    {% for n in page.paginator.page_range %}
                        <li class="{% if page.number == n %}active{% endif %}"><a href="?page={{ n }}">{{ n }}</a></li>
                    {% endfor %}
                {% else %}
                    {% if page.number != 1 %}
                        <li><a href="?page=1">1</a></li>
                        <li><a href="?page={{ page.previous_page_number }}">&laquo;</a></li>
                    {% endif %}
                    <li class="active"><a href="#">{{ page.number }} <span class="sr-only">(current)</span></a></li>
                    {% if page.number != page.paginator.num_pages %}
                        <li><a href="?page={{ page.next_page_number }}">&raquo;</a></li>
                        <li><a href="?page={{ page.paginator.num_page }}">{{ page.paginator.num_pages }}</a></li>
                    {% endif %}
                {% endif %}
            </ul>
        </nav>
    {% endif %}
    {% endraw %}


