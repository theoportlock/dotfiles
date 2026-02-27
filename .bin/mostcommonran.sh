#!/bin/bash
history | awk '{print $4}' | sort | uniq -c | sort -nr | head -n 10
