#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

# Set the DJANGO_SETTINGS_MODULE environment variable
export DJANGO_SETTINGS_MODULE=nucleus.settings

# Ensure pip is available
/usr/bin/python3.9 -m ensurepip --upgrade || { echo "ensurepip failed"; exit 1; }

# Upgrade pip
/usr/bin/python3.9 -m pip install --upgrade pip || { echo "pip upgrade failed"; exit 1; }

# Install dependencies from requirements.txt
/usr/bin/python3.9 -m pip install -r requirements.txt || { echo "Failed to install dependencies"; exit 1; }

# Collect static files
/usr/bin/python3.9 manage.py collectstatic --noinput || { echo "collectstatic failed"; exit 1; }

# Apply database migrations
/usr/bin/python3.9 manage.py makemigrations || { echo "makemigrations failed"; exit 1; }
/usr/bin/python3.9 manage.py migrate || { echo "migrate failed"; exit 1; }

echo "Build completed successfully"
