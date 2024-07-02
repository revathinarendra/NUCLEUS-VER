from django.urls import path
from django.urls import path, register_converter
from . import  converters
from .views import  SubTopicTutorListView, SubjectTutorView,TopicTutorListView,NoteView
register_converter(converters.CommaSlugConverter, 'commaslug')

urlpatterns = [
    path('subjects-tutor/',SubjectTutorView.as_view(),name='subject_tutor'),
    path('subjects-tutor/<str:subject_slug>/topics/', TopicTutorListView.as_view(), name='topic_tutor'),
    path('subjects-tutor/<commaslug:subject_slug>/<commaslug:topic_slug>/', SubTopicTutorListView.as_view(), name='subtopic_tutor'),

    #path('subjects-tutor/<slug:subject_slug>/<slug:topic_slug>/', SubTopicTutorListView.as_view(), name='subtopic_tutor'),
    path('subjects-tutor/<commaslug:subject_slug>/<commaslug:topic_slug>/<commaslug:sub_topic_slug>/', NoteView.as_view(), name='note'),
    
    
]
