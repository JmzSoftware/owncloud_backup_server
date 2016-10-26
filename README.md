Backup server to OwnCloud
===================
This script tars up a directory, dumps a mySQL database and then uploads it to a OwnCloud instance.  
There is no error checking.  It just does it.  

Must create a ~/.my.cnf with the mySQL credentials.

Example:

[mysqldump]
user=root
password=some_password
