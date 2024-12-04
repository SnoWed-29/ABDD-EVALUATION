@echo off
set db_user=root
set db_pass=
set db_name=elearning_platform
set backup_dir=C:\Users\Haitham\Desktop\A\tp3
set timestamp=%DATE:~10,4%-%DATE:~7,2%-%DATE:~4,2%_%TIME:~0,2%-%TIME:~3,2%

mysqldump -u %db_user% -p%db_pass% --no-create-info --where="created_at > NOW() - INTERVAL 1 DAY" %db_name% > "%backup_dir%\diff_bak_%timestamp%.sql"
echo Differential backup completed.
