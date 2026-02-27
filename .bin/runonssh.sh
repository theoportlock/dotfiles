#!/bin/bash -xv
remote_dir='dir'
remote_addr='ADDR'
script=$1
input=$2
scp -r $input $remote_addr:$remote_dir &&
scp -r $script $remote_addr:$remote_dir &&
ssh $remote_addr "${remote_dir}$script $input" &
