---
layout: post
title: Encrypt, Decrypt AES in JavaScript
categories: blog

lang: EN
meta_keywords: cryptography, encrypt, decrypt, aes, javascript
---

We may use light library [Gibberish-AES](https://github.com/mdp/gibberish-aes). It is easy to use :)

### Encrypt

``` javascript
> enc = GibberishAES.enc('hello world!', 'passwd')
'U2FsdGVkX1+zHyrZCL4jXxUCqx2Gg5ZcG25riRA/UVg=
'
```

### Decrypt

``` javascript
> GibberishAES.dec(enc, 'passwd')
'hello world!'
```

### My usage

I use this GibberishAES to encrypt my phone numbers in [contact](/contact.html) page.

``` html
<td>phone</td>
<td><b><span id='data_encrypted_phone'>
    U2FsdGVkX196HptyZBuEVRlm0gXl4/Me67lfNS3y02Z/lo1nXYqm3RRDeHkn30O9
</span></b>
<br>
<a href="#" onclick="decrypt('phone')">decrypt</a> (AES)</td>
```

``` html
<script src="/static/src/gibberish-aes-1.0.0.min.js"></script>
<script>
function decrypt(name){
    var element = document.getElementById('data_encrypted_'+name);
    var passwd = prompt('Password');
    var encrypted = element.innerText;
    var decrypted = GibberishAES.dec(encrypted, passwd);
    element.innerText = decrypted;
}
</script>
```
