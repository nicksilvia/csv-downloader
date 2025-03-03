#!/bin/sh
export PLAYWRIGHT_BROWSERS_PATH=/opt/render/project/.cache/ms-playwright
pip install --upgrade pip
pip install -r requirements.txt
python -m playwright install --with-deps
