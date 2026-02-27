#!/bin/bash
systemctl --failed
journalctl -p 3 -xb
