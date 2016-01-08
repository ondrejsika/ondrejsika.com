#!/bin/sh

if [ $# -eq 2 ]
then
    file=`./edit.py post new -l "$1" -t "$2"`;
elif [ $# -eq 3 ]
then
    file=`./edit.py post new -l "$1" -t "$2" -d "$3"`;
else
    echo 'usage:'
    echo './new-post.sh <lang CS or EN> <title>'
    echo './new-post.sh <lang CS or EN> <title> <date yyyy-mm-dd>'
    exit 1;
fi

echo vim $file
vim $file

