#!/usr/bin/bash

## get arguments from user

dir=$1
backupdir=$2
interval_secs=$3
max_backups=$4

ls -lR $dir > directory-info.last 
current_date=$(date +'%Y%m%d-%H%M%S')
mkdir -p "$backupdir"/"$current_date"
cp -a $dir $backupdir/$current_date


## inf loop

while true
do

# see if there are changes
	ls -lR $dir > directory-info.new
	changed=$(diff directory-info.new directory-info.last | wc -l)
        if [ $changed -eq 0 ]; then
                echo "not changed" 
        else
		echo "changed"
		current_date=$(date +'%Y%m%d-%H%M%S')
		mkdir -p $backupdir/$current_date
		cp -r $dir $backupdir/$current_date
		cat directory-info.new > directory-info.last
	fi

# sort backups according to date and delete all other than last $max_backups backups
	
	cd "$backupdir" || exit
	sorted_backups=($(ls | sort -r))

	for((i="$max_backups"; i<${#sorted_backups[@]}; i++)); do
		rm -r "${sorted_backups[i]}"
        done
        cd ..

	
	sleep "$interval_secs"


done
