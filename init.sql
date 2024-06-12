-- https://www.oracle.com/za/database/free/get-started/
-- To connect to the first Pluggable Database (PDB) use:
-- sqlplus sys@localhost:1521/FREEPDB1 as sysdba
-- To connect to the Container Database (CDB) use:
-- sqlplus sys@localhost:1521/FREE as sysdba
alter session set container=FREEPDB1;

create user myuser no authentication;
grant connect, resource to myuser;
grant unlimited tablespace to myuser; -- fine-tune this later

CREATE TABLE myuser.INVOICE (
   EXTERNAL_ID NUMBER(10) NOT NULL,
   DUEDATE DATE,
   PRIMARY KEY (EXTERNAL_ID)
);