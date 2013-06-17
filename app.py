#!/usr/bin/python
from wsgi import application
if __name__ == "__main__":
    application.debug = True
    application.run()