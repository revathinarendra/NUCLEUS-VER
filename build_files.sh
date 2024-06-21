#!/bin/bash
 #Set the DJANGO_SETTINGS_MODULE environment variable
export DJANGO_SETTINGS_MODULE=NUCLEUS_VERCEL.nucleus.settings
# Ensure pip is available
/usr/bin/python3.9 -m ensurepip --upgrade

# Upgrade pip
/usr/bin/python3.9 -m pip install --upgrade pip

# Install dependencies from requirements.txt
/usr/bin/python3.9 -m pip install -r requirements.txt

# Collect static files
python3.9 manage.py collectstatic --noinput

# Ensure the public/static directory exists
mkdir -p public/static

# Move the collected static files to the public/static directory
cp -r static/* public/static/

# Apply database migrations
python3.9 manage.py makemigrations
python3.9 manage.py migrate
