---
layout: post
title: Pripojeni Wedos drive na Linuxu
categories: blog

lang: CS
---

Mame 2 moznosti jak pouzivat Wedos drive. Muzeme jej pripojit pomoci FTP takto:

    sudo curlftpfs ftp://username:password@3541.s41.wedos.net/ /mnt/ftp/wedos1 -o allow_other
    sudo curlftpfs ftp://username:password@3541.s41.wedos.net/drive/karolina /mnt/drive_karolina -o allow_other

Nebo muzeme pouzivat v rezimu zalohovani pomoci rsync:

    echo 'password' > passwd_file
    rsync -a --password-file=passwd_file rsync://username@3541.s41.wedos.net/s3541/ wedos1
    rsync -a --password-file=passwd_file rsync://username@3541.s41.wedos.net/s3541/drive/karolina drive_karolina

