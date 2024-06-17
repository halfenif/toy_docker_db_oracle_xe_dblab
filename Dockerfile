FROM container-registry.oracle.com/database/express:latest

USER root

# Timezone
RUN rm /etc/localtime
RUN ln -snf /usr/share/zoneinfo/Asia/Seoul /etc/localtime 
RUN echo Asia/Seoul > /etc/timezone

# Install Util
RUN yum install wget tar vi nano dnf curl -y

# Install langpacks 
# RUN wget https://repo.almalinux.org/almalinux/8/AppStream/x86_64/os/Packages/langpacks-ko-1.0-12.el8.noarch.rpm -O /tmp/langpacks-ko-1.0-12.el8.noarch.rpm
# RUN yum localinstall /tmp/langpacks-ko-1.0-12.el8.noarch.rpm -y
# RUN rm /tmp/langpacks-ko-1.0-12.el8.noarch.rpm


# Install dblab
RUN curl https://raw.githubusercontent.com/danvergara/dblab/master/scripts/install_update_linux.sh | bash

# Harlequin Script
RUN mkdir /app
COPY dblab.sh /app


# init SQL
COPY init.sql /docker-entrypoint-initdb.d/

# Set Oracle
USER oracle
ENV  ORACLE_PWD manager

