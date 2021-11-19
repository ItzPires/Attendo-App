from rest_framework import serializers
from .models import Student

class StudentSerializer(serializers.ModelSerializer):

    class Meta:
        model = Student 
        fields = ['student_number', 'mail','password', 'name']
        extra_kwargs = {'password': {'write_only': True}}

