#!/bin/bash

main=''
backupdrive=''

rsync \
	--archive\
	--update\
	--recursive\
	--verbose\
	--progress\
	--omit-dir-times\
	--delete-after\
	--no-perms\
	--no-group\
	--no-owner\
	--copy-links\
	--human-readable\
	--stats\
	--dry-run\
	$main $backupdrive
