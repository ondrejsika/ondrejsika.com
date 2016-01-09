---
layout: post
title: Spusteni Django (wsgi) aplikace v twistedu

lang: CS
---

Kazda wsgi aplikace se da spoustet ryznymi servery jako je gunicorn, uwsgi, ... Da se spusti wsgi aplikace v twistedu a
daji se z wsgi aplikace volat twistedi funkce. Je k tomu potreba knihovna [crochet](https://github.com/itamarst/crochet).

Staci nam jednoduchy server, ktery pouziva wsgi apikaci z Djanga.

Je to jednoduche. Ukazka settings.py

    #!/usr/bin/python
    import sys

    from crochet import no_setup

    from twisted.internet import reactor
    from twisted.python import log
    from twisted.web.wsgi import WSGIResource
    from twisted.web.server import Site

    # django wsgi application
    from wsgi import application

    no_setup()


    def main():
        log.startLogging(sys.stdout)
        pool = reactor.getThreadPool()
        reactor.listenTCP(8000, Site(WSGIResource(reactor, pool, application)))
        # Allow Ctrl-C to get you out cleanly:
        reactor.addSystemEventTrigger('after', 'shutdown', pool.stop)
        reactor.run()

    if __name__ == '__main__':
        main()

Nebo muzeme tento server vylepsit a muzeme poustet server na portu a nebo do unixoveho socketu. Pokud chceme pouzivat
unix socket, musime patchnout request.

    def patch_socket():
        from twisted.web.server import Request

        def getHost(self):
            if not hasattr(self.host, 'port'):
                self.host.port = '0'
            return self.host
        Request.getHost = getHost
    patch_socket()

Potom server vypada takto:

    #!/usr/bin/python
    import sys

    from crochet import no_setup

    from twisted.internet import reactor
    from twisted.python import log
    from twisted.web.wsgi import WSGIResource
    from twisted.web.server import Site

    # django wsgi application
    from wsgi import application

    no_setup()

    def patch_socket():
        from twisted.web.server import Request

        def getHost(self):
            if not hasattr(self.host, 'port'):
                self.host.port = '0'
            return self.host
        Request.getHost = getHost
    patch_socket()

    def main():
        log.startLogging(sys.stdout)
        pool = reactor.getThreadPool()
        reactor.listenUNIX('/tmp/django.sock', Site(WSGIResource(reactor, pool, application)))
        # Allow Ctrl-C to get you out cleanly:
        reactor.addSystemEventTrigger('after', 'shutdown', pool.stop)
        reactor.run()


    if __name__ == '__main__':
        main()

