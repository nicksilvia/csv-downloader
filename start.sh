#!/bin/sh
source /opt/render/project/src/.venv/bin/activate
exec gunicorn -b 0.0.0.0:8080 server:app
