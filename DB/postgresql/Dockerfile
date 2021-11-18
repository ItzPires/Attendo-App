FROM library/postgres


ENV POSTGRES_USER attendo
ENV POSTGRES_PASSWORD attendo
ENV POSTGRES_DB attendo

COPY 1-tables.sql /docker-entrypoint-initdb.d/
COPY somedata.sql /docker-entrypoint-initdb.d/


EXPOSE 5432