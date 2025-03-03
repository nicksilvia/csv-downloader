#!/bin/sh
export PLAYWRIGHT_BROWSERS_PATH=/opt/render/project/.cache/ms-playwright
source /opt/render/project/src/.venv/bin/activate
exec gunicorn -b 0.0.0.0:8080 server:app
