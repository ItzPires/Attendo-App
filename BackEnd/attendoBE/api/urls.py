from django.urls import path
from . import views
from . import Calls

urlpatterns = [
    path('', views.index),
    path('Student/', Calls.student.StudentViews.students_manage),
    path('Student/<int:number>', Calls.student.StudentViews.student_search),
    path('Teacher/', Calls.teacher.ProfessorViews.professor_manage),
    path('Teacher/<int:id>', Calls.teacher.ProfessorViews.teacher_search),
    path('Subject/', Calls.subject.SubjectViews.subject_manage),
    path('Subject/', Calls.subject.SubjectViews.subject_manage),
    path('Subject/<slug:emailStudent>', Calls.subject.SubjectViews.lecture_from_student),
    path('Subject/<slug:emailTeacher>', Calls.subject.SubjectViews.lecture_from_teacher),
    path('login/', Calls.authentication.Authentication.user_login)
    #path('Subject/<>'Calls.subject.SUbjectViews.subject_search)
]