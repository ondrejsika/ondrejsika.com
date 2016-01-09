---
layout: post
title: 'Prevod mezi timestamp a datetime'

lang: CS
---

To je pomrne casta zalezitost, proto jsem si pripravil tyto 2 funkce, ktere nam to ulehci:


    import time
    import datetime

    def time2datetime(t):
        return datetime.datetime.fromtimestamp(t)

    def datetime2time(dt):
        return time.mktime(dt.timetuple())


Tyto funkce obsahuje take moje knihovan utilit [sikautils](https://github.com/ondrejsika/python-sikautils), konkretne zde <https://github.com/ondrejsika/python-sikautils/blob/master/python/timeutils.py>
