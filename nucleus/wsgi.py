"""
WSGI config for nucleus project.

It exposes the WSGI callable as a module-level variable named ``application``.

For more information on this file, see
https://docs.djangoproject.com/en/5.0/howto/deployment/wsgi/
"""

import os

from django.core.wsgi import get_wsgi_application

os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'nucleus.settings')

# Create a WSGI application
application = get_wsgi_application()

# Vercel requires a `handler` function to be exported
def handler(event, context):
    return application(event, context)
