#!/bin/bash
ssh -p 8022 192.168.0.11 "termux-notification --content \"$(echo $@)\""
