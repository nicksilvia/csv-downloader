#!/bin/sh
export PLAYWRIGHT_BROWSERS_PATH=0  # Ensures Playwright uses local cache
source /opt/render/project/src/.venv/bin/activate
exec gunicorn -b 0.0.0.0:8080 server:app
