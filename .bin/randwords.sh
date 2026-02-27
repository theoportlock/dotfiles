#!/bin/bash
cat /usr/share/dict/words|sort -R|head -n 5|xargs -0 echo
