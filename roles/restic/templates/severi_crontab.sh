#!/bin/ksh

readonly restic_bin=/usr/local/bin/restic
readonly restic_repo="/backup/severi"

# Purge old entries
$restic_bin forget \
	--keep-daily 7 \
	--keep-weekly 4 \
	--keep-monthly 3 \
	--prune \
	--password-file=/root/.backuppass

# Do backup
$restic_bin $restic_repo -r  \
	backup -x \
	--exclude-file=/root/excludes_severi.txt \
	--password-file=/root/.backuppass \
	/etc \
	/home \
	/var

