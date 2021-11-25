from django.shortcuts import render
from django.http.response import JsonResponse
from rest_framework.response import Response
from rest_framework.decorators import api_view
from django.db import connection, DatabaseError
import json, os, jwt
import datetime


class Authentication:
    @api_view(http_method_names=["GET"])
    def user_login(request):
        login_user = json.loads(request.body)

        
        with connection.cursor() as cursor:
            try:
                ###SELECT BY MAIL/ENCRYPTED PASSWORD
                statement = """"""
                values = """"""
                cursor.execute(statement, values)
                id = cursor.fetchone()[0]
                if(id is not None):
                    id = {'user_id': id, "exp": datetime.datetime.utcnow() + datetime.timedelta(minutes=30)}
                    result = jwt.encode(id,os.getenv(JWT_KEY), algorithm="HS256")
                    result = {'authToken': result}
                else:
                    result = {'erro:':"User was not found, invalid username or password"}

            except (Exception, DatabaseError) as error:
                result = {'erro:': str(error)}

        return JsonResponse(result)
    
    def authenticate(token):


        try:
            id = jwt.decode(token, os.getenv(), algorithms=["HS256"])
            return True
        except jwt.ExpiredSignatureError:
            msg = 'Signature has expired.'
            return False, msg
        except jwt.DecodeError:
            msg = 'Invalid Login Token Signature'
            return False,  msg
        except jwt.InvalidTokenError:
            msg = 'Invalid token.'
            return False,  msg

    
