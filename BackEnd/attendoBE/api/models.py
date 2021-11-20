from django.core.exceptions import ValidationError
from django.db.models.expressions import F
from django.utils.translation import gettext_lazy as _
from django.db import models


# Criação de tabelas
class Student(models.Model):
    # STUDENT PARAMETERS
    student_number = models.IntegerField(unique= True,blank= False, null= False, primary_key= True)
    mail = models.EmailField(blank= False,unique= True )
    password = models.CharField(max_length= 32, null= False, blank= False)
    name = models.CharField(max_length= 32, null= False, blank= False)





