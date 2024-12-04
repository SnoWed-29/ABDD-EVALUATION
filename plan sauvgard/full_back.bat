@echo off
set db_user=root
set db_pass=
set db_name= e_commerce_sout_final
set backup_dir=C:\Users\Haitham\Desktop\A\tp3
set timestamp=%DATE:~10,4%-%DATE:~7,2%-%DATE:~4,2%_%TIME:~0,2%-%TIME:~3,2%

mysqldump -u %db_user% -p%db_pass% %db_name% > "%backup_dir%\full_bak_%timestamp%.sql"
echo Full backup completed.
