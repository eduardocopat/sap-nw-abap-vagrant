#!/usr/bin/expect -f


spawn ./NW/install.sh -s -k
set PASSWORD "sapABAP75"
set timeout -1
expect "Do you agree to the above license terms? yes/no:"
send "yes\r"
expect "Please enter a password:"
send "$PASSWORD\r"
expect "Please re-enter password for verification:"
send  "$PASSWORD\r"
expect eof