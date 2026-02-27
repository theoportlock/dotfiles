#!/bin/bash
cat /usr/share/dict/words|sort -R|head -n 1|xargs -0 echo
