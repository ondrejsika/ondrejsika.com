---
layout: post
title:  "Dialog Box in Tkinter, Python"
categories: blog

lang: EN
meta_keywords: Python, Tkinter, alert, input, dialog
---

``` python
import tkMessageBox
```

### Alert

##### Info
``` python
tkMessageBox.showinfo("Window title", "info msg content")
```

##### Warning
``` python
tkMessageBox.showwarning("Window title", "warning msg content")
```

##### Error
``` python
tkMessageBox.showwarning("Window title", "error msg content")
```


### Ask

##### Yes, No
``` python
if tkMessageBox.askyesno("Window title", "msg content"):
    print "yes"
else:
    print "no"
```

##### Yes, No, Cancel
``` python
status = tkMessageBox.askyesnocancel("Window title", "msg content")
if status == True:
    print "yes"
elif == False:
    print "no"
else:
    print "cancel"
```
##### Ok, Cancel
``` python
if tkMessageBox.askokcancel("Window title", "msg content"):
    print "ok"
else:
    print "cancel"
```

##### Retry, Cancel
``` python
if tkMessageBox.askretrycancel("Window title", "msg content"):
    print "retry"
else:
    print "cancel"
```

### Input

``` python
import tkSimpleDialog
```

##### Int
``` python
i = tkSimpleDialog.askinteger("Window title", "msg content")
```

##### Float
``` python
f = tkSimpleDialog.askfloat("Window title", "msg content")
```

##### String
``` python
s = tkSimpleDialog.askstring("Window title", "msg content")
```


Source: <http://effbot.org/tkinterbook/tkinter-standard-dialogs.htm>
