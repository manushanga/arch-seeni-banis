#!/bin/bash
# full system backup

# Backup destination
backdest=/media/ENT/Backups

# Labels for backup name
#PC=${HOSTNAME}
pc=toshiba
distro=arch
type=full
date=$(date "+%F")
backupfile="$backdest/$distro-$type-$date.tar.gz"

# Exclude file location
exclude_file="./sysback_exc.txt"

# Check if exclude file exists
if [ ! -f $exclude_file ]; then
  echo -n "No exclude file exists, continue? (y/n): "
  read continue
  if [ $continue == "n" ]; then exit; fi
fi

tar --exclude-from=$exclude_file -czpf $backupfile /
