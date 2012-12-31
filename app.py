# STWW (Static Templated WSGI Web)
# version 1.0
# Author: Ondrej Sika
#         http://ondrejsika.com

import os
import sys

normpath = lambda *args: os.path.normpath(os.path.abspath(os.path.join(*args)))
PROJECT_ROOT = normpath(__file__, "..")

sys.path.append(normpath(PROJECT_ROOT, "lib"))

from flask import Flask, render_template
from flask.views import View

app = Flask(__name__)

class BaseView(View):
    def __init__(self, template_name):
        self.template_name = template_name
    def dispatch_request(self):
        return render_template(self.template_name)

def add_view(file_path):
    path = file_path.replace(normpath(PROJECT_ROOT, "templates/"), "")[1:]
    if path[-5:] == ".html":
        url = path.replace(".html", "")
        if "index" in url or "home" in url:
            url = url.replace("home", "").replace("index", "")
    else:
        url = path
    app.add_url_rule('/'+url, view_func=BaseView.as_view(path, template_name=path))

def get_file_tree(*args):
    for path, dirs, files in os.walk(normpath(*args)):
        for filename in files:
            yield os.path.join(path, filename)

for path in get_file_tree(PROJECT_ROOT, "templates"):
    add_view(path)


appilcation=app
if __name__ == '__main__':
    app.run()
