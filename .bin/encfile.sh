#/bin/bash
read -s -p "Enter Password: " pswd
openssl enc -aes-256-cbc -md sha256 -k $pswd -pbkdf2 -iter 100000 -salt -in $1 -out $1.enc
