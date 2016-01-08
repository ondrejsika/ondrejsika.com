#!/usr/bin/python

import os
import datetime
import argparse

ROOT = os.path.abspath(os.path.dirname(__file__))


parser = argparse.ArgumentParser()
subparsers = parser.add_subparsers(dest='command')

parser_post = subparsers.add_parser('post')
subparsers_post = parser_post.add_subparsers(dest='command2')

parser_post_new = subparsers_post.add_parser('new', help='create new post from template')
parser_post_new.add_argument('-d', '--date', type=str, help='post date',
                             default=datetime.datetime.now().strftime('%Y-%m-%d'))
parser_post_new.add_argument('-t', '--title', type=str, help='post title', required=True)
parser_post_new.add_argument('-l', '--language', type=str, help='post language ("CS" or "EN")', required=True)


args = parser.parse_args()


def _post_new(args):
    with open(os.path.join(ROOT, 'edit', 'post-template.md')) as f:
        template = f.read()
    file_name = '%s-%s.md' % (args.date, args.title.lower().replace(' ', '-'))
    file_path = os.path.join(ROOT, '_posts', file_name)
    with open(file_path, 'w') as f:
        f.write(template.format(title=args.title,
                                language=args.language))
    print file_path

{
    ('post', 'new'): _post_new,
}[(args.command, args.command2)](args)

