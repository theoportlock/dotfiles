#!/bin/bash
sudo printf "[Service}\nExecStart=ExecStart=-/usr/bin/agetty --autologin theo --noclear \%I \$TERM" > /etc/systemd/system/getty@tty1.service.d/override.conf
