## Automated File Backup System ##

# User guide

1- This system contains two main files, backupd.sh and Makefile
2- to run the system you must provide the fllowing parameters in the Makefile:

BASH_SCRIPT=./backupd.sh  # path to bash script provided
SRC_DIR= /path/to/source
BACKUP_DIR=/path/to/backupfile
INTERVAL= < number of seconds between backups >
MAX_BACKUPS= < max number of backups >

3- To begin the backup process, run "make backup"

-------------------------------------------------------

# System overview

- Makefile creates a backup folder if not already created
- then it runs backupd.sh and provides its parameters
- backupd.sh first creates a backup of current file and saves its info in a file "directory-info.last"
- in an infinite loop, the data of the source folder is saved in "directory-info.new" and compared to "directory-info.last"
- if there are changes, the system creates a new backup directory with the date "$(date +'%Y%m%d-%H%M%S')"
and saves the new info into "directory-info.last"
- To delete older backups, backups are sorted according to date
- then a for loop runs to delete all directories other than the latest $MAX_BACKUPS

-------------------------------------------------------
 
 # Directories after running system:
 
 backup      directory-info.last  Makefile   source
backupd.sh   directory-info.new   README.md

-------------------------------------------------------

