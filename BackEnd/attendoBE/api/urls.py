from django.urls import path
from . import views
urlpatterns = [
    path('', views.index),
    path('Student/', views.StudentViews.students_manage),
    path('Student/<int:number>', views.StudentViews.student_search),
]