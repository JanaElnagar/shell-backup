## Makefile for creating backup files

# defining variables

BASH_SCRIPT=./backupd.sh
SRC_DIR=source
BACKUP_DIR=backup
INTERVAL=10
MAX_BACKUPS=5

.PHONY = backup make_backup_dir

backup: make_backup_dir
	bash $(BASH_SCRIPT) $(SRC_DIR) $(BACKUP_DIR) $(INTERVAL) $(MAX_BACKUPS)


make_backup_dir:
	mkdir -p $(BACKUP_DIR)
	#if [ -d $(BACKUP_DIR) ]; then \
	#	mkdir -p $(BACKUP_DIR); fi
	
