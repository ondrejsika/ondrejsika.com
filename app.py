import os
import sys

normpath = lambda *args: os.path.normpath(os.path.abspath(os.path.join(*args)))
PROJECT_ROOT = normpath(__file__, "..")

activate_this = normpath(PROJECT_ROOT, 'env/bin/activate_this.py')
execfile(activate_this, dict(__file__=activate_this))

from flask import Flask, render_template
app = Flask(__name__)

@app.route("/")
def home():
    return render_template("home.html")

if __name__ == '__main__':
    app.run()