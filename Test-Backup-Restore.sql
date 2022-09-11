
CREATE DATABASE TESTDB1;


CREATE CREDENTIAL [s3://s3.example.com:9000/sqlbackups] WITH IDENTITY = 'S3 Access Key', SECRET = 'anthony:nocentino';


BACKUP DATABASE TestDB1 TO URL = 's3://s3.example.com:9000/sqlbackups/TestDB1.bak' WITH COMPRESSION, STATS = 10, FORMAT, INIT;



CREATE DATABASE TESTDB1_CLONED;


RESTORE DATABASE TESTDB1_CLONED FROM URL =  's3://s3.example.com:9000/sqlbackups/TestDB1.bak' WITH  
MOVE 'TESTDB1' TO '/var/opt/mssql/data/TESTDB1_CLONED.mdf',
MOVE 'TESTDB1_log' TO '/var/opt/mssql/data/TESTDB1_CLONED_log.ldf',
REPLACE, STATS = 10;