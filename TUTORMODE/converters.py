# tutormode/converters.py
from django.urls import register_converter

class CommaSlugConverter:
    regex = '[-a-zA-Z0-9_,:;?]+'

    def to_python(self, value):
        return value

    def to_url(self, value):
        return value

register_converter(CommaSlugConverter, 'commaslug')
