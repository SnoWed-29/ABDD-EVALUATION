@echo off
set db_user=root
set db_pass=
set db_name=elearning_platform
set backup_dir=C:\Users\Haitham\Desktop\A\tp3
set timestamp=%DATE:~10,4%-%DATE:~7,2%-%DATE:~4,2%_%TIME:~0,2%-%TIME:~3,2%

mysqlbinlog --read-from-remote-server --host=localhost -u %db_user% -p%db_pass% mysql-bin.000001 > "%backup_dir%\incr_bak_%timestamp%.sql"
echo Incremental backup completed.