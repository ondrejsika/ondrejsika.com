#!/usr/bin/python
from flask_server import FlaskServer, normpath
application = FlaskServer(__name__, normpath(__file__, ".."))