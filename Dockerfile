FROM container-registry.oracle.com/database/express:latest

COPY init.sql /docker-entrypoint-initdb.d/startup/
#RUN  chown oracle /docker-entrypoint-initdb.d/setup/init.sql

ENV  ORACLE_PWD manager

# ORACLE_CHARACTERSET: The character set to use when creating the database (default: AL32UTF8)
# UTF8(old), AL32UTF8(new, not support under 8i)