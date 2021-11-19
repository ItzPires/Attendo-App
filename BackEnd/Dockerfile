FROM python:3.9-alpine

ENV PYTHONUNBUFFERED=1

RUN apk update && apk add postgresql-dev gcc python3-dev musl-dev

RUN pip install django

RUN pip install psycopg2-binary

RUN pip install djangorestframework

COPY . /attendoBE

VOLUME ["/attendoBE"]

WORKDIR /attendoBE

CMD python manage.py makemigrations ; python manage.py migrate ; python manage.py runserver 0.0.0.0:8000



EXPOSE 8000