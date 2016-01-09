---
layout: post
title: Session messages aneb Django sessions bezbolestne

lang: CS
---

Urcite kazdy resil jak predat uzivateli nejakou zpravu o tom jak probehla jeho akce a zobrazit ji pouze jednou. Da se to resit ruznymi, ale podle mne je nejlepsi zpravu ulozit do session.

S tim se pracuje jednoduse, ale je okolo toho hodne opakujiciho se kodu, proto jsem si vytvoril tyto 2 funkce ktere s __requesrt.session__ pracuji velmi jednoduse.

Funkce __message_write__ prida objekt zpravy a pri zavolani __message_get_all__ se vrati vsechny.

    def message_write(request, message):
        if 'messages' in request.session:
            request.session['messages'].append(message)
        else:
            request.session['messages'] = [message]
        request.session.save()


    def message_get_all(request):
        messages = request.session.get('messages', [])
        request.session['messages'] = []
        return messages

Pouziti je jednoduche

    def view(request):
        messages = message_get_all(request)

        if do_stuff():
            message_write('Success')
        else:
            message_write('Something wrong')

        return render(render, 'template.html', {
            'messages': messages,
        })

