#!/bin/sh
playwright install
gunicorn -b 0.0.0.0:8080 server:app
