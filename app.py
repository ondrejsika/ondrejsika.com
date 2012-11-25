import os
import sys

normpath = lambda *args: os.path.normpath(os.path.abspath(os.path.join(*args)))
PROJECT_ROOT = normpath(__file__, "..")

activate_this = normpath(PROJECT_ROOT, 'env/bin/activate_this.py')
execfile(activate_this, dict(__file__=activate_this))

from flask import Flask, render_template
app = Flask(__name__)



##########

@app.route("/")
def home():
    return render_template("home.html")

@app.route("/news")
def news():
    return render_template("news.html")

@app.route("/projects")
def projects():
    return render_template("projects.html")

@app.route("/contact")
def contact():
    return render_template("contact.html")

@app.route("/sitemap")
def sitemap():
    return render_template("sitemap.html")

@app.route("/projects/save-form")
def projects__save_form():
    return render_template("projects__save_form.html")

@app.route("/projects/sitron")
def projects__sitron():
    return render_template("projects__sitron.html")

@app.route("/projects/djangovoid")
def projects__save_form():
    return render_template("projects__djangovoid.html")

@app.route("/hosting")
def projects__save_form():
    return render_template("hosting.html")


##########

if __name__ == '__main__':
    app.run()