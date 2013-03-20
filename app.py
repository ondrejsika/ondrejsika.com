#!/usr/bin/python
from flask_server import FlaskServer, normpath
application = FlaskServer(__name__, normpath(__file__, ".."))
app = application
if __name__ == "__main__":
    application.run()