schtasks /create /SC DAILY /TN "DB" /TR "C:\dcm4chee\db-backups\PostgresqlBack.bat" /ST 10:00
schtasks /create /SC DAILY /TN "AUDITING DB" /TR "C:\dcm4chee\db-backups\Postgresql-auditing.bat" /ST 10:30
schtasks /create /SC DAILY /TN "DB2" /TR "C:\dcm4chee\db-backups\PostgresqlBack.bat" /ST 16:00
schtasks /create /SC DAILY /TN "AUDITING DB2" /TR "C:\dcm4chee\db-backups\Postgresql-auditing.bat" /ST 16:30
