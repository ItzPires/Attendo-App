FROM python:3.9-alpine

ENV PYTHONUNBUFFERED=1

RUN apk update && apk add postgresql-dev gcc python3-dev musl-dev

RUN pip install django

RUN pip install psycopg2-binary

RUN pip install gunicorn

RUN pip install djangorestframework

RUN pip install django-cors-headers

RUN pip install pyjwt


COPY . /attendoBE

VOLUME ["/attendoBE"]

WORKDIR /attendoBE

#CMD python manage.py makemigrations ; python manage.py migrate ; python manage.py runserver 0.0.0.0:8000
CMD python manage.py runserver 0.0.0.0:80


EXPOSE 80