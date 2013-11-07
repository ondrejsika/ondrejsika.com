---
layout: post
title:  "Install NodeJS"
date:   2013-08-24 00:00:00
categories: blog

lang: EN
---

Download Node .tar.gz package from official website <http://nodejs.org> and copy the extract dir to node instance directory (mostly /opt/).

```
cd Downloads
wget http://nodejs.org/dist/v0.10.17/node-v0.10.17.tar.gz
tar -zxvf node-v0.10.17.tar.gz
sudo cp node-v0.10.17 /opt/node-v0.10.17 -r
```

Compile source via `make`

```
cd /opt/node-v0.10.17
make
```

and link node binary to system path

```
ln -sf /opt/node-v0.10.17/node /usr/local/bin/node
```

Now node works :)