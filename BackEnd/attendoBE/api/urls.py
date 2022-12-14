from django.urls import path

from . import views
from . import Calls

urlpatterns = [
    path('', views.index),
    path('Student/', Calls.student.StudentViews.students_manage),
    path('Student/<int:number>', Calls.student.StudentViews.student_search),
    path('Teacher/', Calls.teacher.ProfessorViews.professor_manage),
    path('Teacher/<int:id>', Calls.teacher.ProfessorViews.teacher_search),
    #path('Subject/', Calls.subject.SubjectViews.subject_manage),

    path('Subject/<int:id>', Calls.lecture.LectureViews.lecture_from_student),
    path('SubjectTeacher/', Calls.lecture.LectureViews.lecture_from_teacher),

    #path('Subject/<>'Calls.subject.SUbjectViews.subject_search)

    path('login/', Calls.authentication.Authentication.user_login),
    path('QrCode/<int:class_id>', Calls.qrcode.QrCodeViews.get_QrCode)
    
]