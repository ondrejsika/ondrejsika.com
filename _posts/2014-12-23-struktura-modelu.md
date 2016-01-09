---
layout: post
title: Struktura modelu

lang: CS
---

Vzdy jsme mel modely bez jakekoliv struktury. To pri vetsich projektech zclo prerustat prez hlavu tak
jsem si vytvoril strukturu se kterou se mi v kodu orientuje mnohem lepe.

Komentare v modelech nepisu, jen dodrzuji sekce. Tady je napisu pro prehlednost.

    class Person(models.Model):
        # vztahy s ostatnimi modely
        user = models.ForeignKey(User)

        # vsechny normalni fieldy
        first_name = models.CharField(max_length=32)
        last_name = models.CharField(max_length=32)
        email = models.EmailField()

        # derived, to jsou pole ktera jsou automaticky dopocitavana (save, cron, ...)
        drv_votes = models.IntegerFields(default=0)

        # to jsou take dopocitavane pole ale jen v pythonu
        @property
        def full_name(self):
            return u'%s %s' % (self.first_name, self.last_name)

        # meta informace o modelu
        class Meta:
            ordering = ('last_name', 'first_name', )

        # definice zakladnich metod a pretezovani
        def __unicode__(self):
            return u'%s #%s' % (self.name, self.id, )

        def save(self, *args, **kwargs):
            if self.id:
                self.drv_votes = Vote.objects.filter(person=self).count()
            return super(Person, self).save(*args, **kwargs)

        # definice statickych metod
        @staticmethod
        def create(name, email):
            first, last = name.split()
            Person(first_name=first, last_name=last, email=email).save()

        # ostatni metody
        def get_email_to(self):
            return u'%s <%s>' % (self.name, self.email)

