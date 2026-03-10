#!/usr/bin/env bash

nums=$(i3-msg -t get_workspaces \
  | grep -o '"num":[0-9]*' \
  | cut -d: -f2 \
  | sort -n)

expected=1

for n in $nums; do
    if [ "$n" -ne "$expected" ]; then
        break
    fi
    expected=$((expected + 1))
done

i3-msg workspace "$expected"
