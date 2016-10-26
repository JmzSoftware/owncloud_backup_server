#!/bin/bash
script_path="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
backupname=backup-$(date +%Y-%m-%d)

# OwnCloud credentials
oc_username=''
oc_password=''
oc_server='' # include https:// or http://

# mySQL host.  Local or remote
mysql_host=localhost

dir_to_backup='' # Absolute path
backup_to_oc_dir='' # This is the folder name on OwnCloud

mysqldump -h$mysql_host -uroot --all-databases > $backupname.sql

tar cvfz $script_path/$backupname.tar.gz $dir_to_backup
curl -X PUT -u $oc_username:$oc_password --data-binary @"$backupname.tar.gz" "$oc_server/remote.php/webdav/$backup_to_oc_dir/$backupname.tar.gz"
curl -X PUT -u $oc_username:$oc_password --data-binary @"$backupname.sql" "$oc_server/remote.php/webdav/$backup_to_oc_dir/$backupname.sql"
rm $script_path/$backupname.sql
rm $script_path/$backupname.tar.gz
