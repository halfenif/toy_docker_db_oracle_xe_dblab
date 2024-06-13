FROM container-registry.oracle.com/database/express:latest

USER root

# Timezone
RUN rm /etc/localtime
RUN ln -snf /usr/share/zoneinfo/Asia/Seoul /etc/localtime 
RUN echo Asia/Seoul > /etc/timezone

# Install Python 3.9
RUN yum install gcc openssl-devel bzip2-devel libffi-devel gzip make unixODBC.x86_64 -y
RUN yum install wget tar -y
WORKDIR /opt
RUN wget https://www.python.org/ftp/python/3.9.6/Python-3.9.6.tgz
RUN tar xzf Python-3.9.6.tgz
WORKDIR /opt/Python-3.9.6
RUN ./configure --enable-optimizations
RUN make altinstall
RUN rm -f /opt/Python-3.9.6.tgz
RUN rm /usr/bin/python
RUN ln -s /opt/Python-3.9.6/python /usr/bin/python

# Install unixODBC, harlequin
# RUN yum install unixODBC.x86_64 -y
RUN python -m pip install harlequin-odbc

# Harlequin Script
RUN mkdir /app
COPY harlequin.sh /app


# init SQL
COPY init.sql /docker-entrypoint-initdb.d/

# Set Oracle
USER oracle
ENV  ORACLE_PWD manager
# ENV  ORACLE_CHARACTERSET AL32UTF8
# The character set to use when creating the database (default: AL32UTF8)
# UTF8(old), AL32UTF8(new, not support under 8i)
