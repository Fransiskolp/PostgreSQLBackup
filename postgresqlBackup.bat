  @echo off
   ::Change this values
   set HOST=<HOST>
   set PORT=<PORT>
   set DBNAME=<DBNAME>
   set USER=<USER>
   set PSSWD=<PASSWORD>
   set PATH=<PATH>
   
   for /f "tokens=1-3 delims=/ " %%A in ("%date%") do (
     set day=%%A
     set month=%%B
     set year=%%C
     
   )
   set datestr=%year%%month%%day%
   echo datestr is %datestr%
    
   set BACKUP_FILE=%PATH%_%datestr%.backup
   echo backup file name is %BACKUP_FILE%
   SET PGPASSWORD=%PSSWD%
   echo on
   bin\pg_dump -h %HOST% -p %PORT% -U %USER% -F c -b -v -f %BACKUP_FILE% %DBNAME%