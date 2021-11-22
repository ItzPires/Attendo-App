from rest_framework import serializers
from .models import Student
from .models import Professor

class StudentSerializer(serializers.ModelSerializer):

    class Meta:
        model = Student 
        fields = ['number', 'mail','password', 'name']
        extra_kwargs = {'password': {'write_only': True}}

class ProfessorSerializer(serializers.ModelSerializer):

    class Meta:
        model = Professor 
        fields = ['mail','password', 'name']
        extra_kwargs = {'password': {'write_only': True}}