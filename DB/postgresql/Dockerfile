FROM library/postgres

ENV POSTGRES_DB attendo
ENV POSTGRES_USER attendo
ENV POSTGRES_PASSWORD XauCao123


COPY 1-tables.sql /docker-entrypoint-initdb.d/
COPY somedata.sql /docker-entrypoint-initdb.d/


EXPOSE 5432