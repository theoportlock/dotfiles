#!/bin/bash
NAME=$(basename $1 | sed 's/\(.*\)\..*/\1/')
SCRIPT=$(realpath $1)
PROGRAM=$(sed -n '1s/^#!//p' $1)
printf "[Service]\nExecStart=$PROGRAM $SCRIPT\n[Install]\nWantedBy=multi-user.target" > /tmp/${NAME}.service
sudo mv /tmp/${NAME}.service /etc/systemd/system/
