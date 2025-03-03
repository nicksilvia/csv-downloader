#!/bin/sh
export PLAYWRIGHT_BROWSERS_PATH=/opt/render/project/.cache/ms-playwright
export PIP_NO_BINARY=:all:  # Ensures proper package installation
export PIP_NO_CACHE_DIR=off  # Avoids permission issues with cache

pip install --upgrade pip
pip install -r requirements.txt

# Force a clean Playwright installation
python -m playwright install --with-deps --force
