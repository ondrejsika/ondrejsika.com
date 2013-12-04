---
layout: post
title:  "IRC Log Bot on Debian"
categories: blog

lang: EN
---

### Install

`pip install irclogbot`

### Supervisor configuration

Create config file `/etc/supervisor/conf.d/irclogbot.conf`

```
[program:irclogbot-chanel1]
command=irclogbot irc.ondrejsika.com chanel1 /var/irclog/channel1.log

[program:irclogbot-chanel2]
command=irclogbot irc.ondrejsika.com chanel2 /var/irclog/channel2.log
```

And reload supervisor.

```
supervisorctl reload
service supervisor restart
```

Now, every IRC communication is saved to logs.