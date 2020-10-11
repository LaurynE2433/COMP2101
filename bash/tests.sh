#!/bin/bash
# This is a script to practice doing testing in bash scripts

# This section demonstrates file testing

# Test for the existence of the /etc/resolv.conf file
# TASK 1: Add a test to see if the /etc/resolv.conf file is a regular file
test -f /etc/resolv.conf && echo "/etc/resolv.conf exists and is a regular file" || echo "/etc/resolv.conf does not exist and/or is not a regular file"
# TASK 2: Add a test to see if the /etc/resolv.conf file is a symbolic link
test -h /etc/resolv.conf && echo "/etc/resolv.conf exists and is a symbolic link" || echo "/etc/resolc.conf does not exist and/or is not a symbolic link"
# TASK 3: Add a test to see if the /etc/resolv.conf file is a directory
test -d /etc/resolv.conf && echo "/etc/resolv.conf exists and is a directory" || echo "/etc/resolv.conf does not exitst and/or is not a directory"
# TASK 4: Add a test to see if the /etc/resolv.conf file is readable
test -r /etc/resolv.conf && echo "/etc/resolv.conf exists and is readable" || echo "/etc/resolv.sh does not exist and/or is not readable"
# TASK 5: Add a test to see if the /etc/resolv.conf file is writable
test -w /etc/resolv.conf && echo "/etc/resolv.conf exists and is writable" || echo "/etc/resolv.conf does not exist and/or is not writable"
# TASK 6: Add a test to see if the /etc/resolv.conf file is executable
test -e /etc/resolv.conf && echo "/etc/resolv.conf exists and is executable" || echo "/etc/resolv.conf does not exist and/or is not executable"

# Tests if /tmp is a directory
# TASK 4: Add a test to see if the /tmp directory is readable
[ -d /tmp -a -r /tmp ] && echo "/tmp is a readable directory" || echo "/tmp is not a readable directory"
# TASK 5: Add a test to see if the /tmp directory is writable
[ -d /tmp -a -w /tmp ] && echo "/tmp is a writable directory" || echo "/tmp is not a writable directory"
# TASK 6: Add a test to see if the /tmp directory can be accessed
[ -d /tmp ] && echo "/tmp is a directory" || echo "/tmp is not a directory"

# Tests if one file is newer than another
# TASK 7: Add testing to print out which file newest, or if they are the same age
[ /etc/hosts -nt /etc/resolv.conf ] && echo "/etc/hosts is newer than /etc/resolv.conf"
[ /etc/hosts -ot /etc/resolv.conf ] && echo "/etc/resolv.conf is newer than /etc/hosts"
[ ! /etc/hosts -nt /etc/resolv.conf -a ! /etc/hosts -ot /etc/resolv.conf ] && echo "/etc/hosts is the same age as /etc/resolv.conf"

# this section demonstrates doing numeric tests in bash

# TASK 1: Improve it by getting the user to give us the numbers to use in our tests
read -p "Please inputa number" num
# TASK 2: Improve it by adding a test to tell the user if the numbers are even or odd
if [ $(($num%2)) -eq 1 ];then
  echo "$num is odd"
else
  echo "$num is even"
fi
# TASK 3: Improve it by adding a test to tell the user is the second number is a multiple of the first number

firstNumber=4
secondNumber=7

if [ $(($secondNumber % $firstNumber)) -eq 0 ];then
  echo "The second number is a multiple of the first"
else
  echo "The second number is NOT a multiple of the first"
fi

[ $firstNumber -eq $secondNumber ] && echo "The two numbers are the same"
[ $firstNumber -ne $secondNumber ] && echo "The two numbers are not the same"
[ $firstNumber -lt $secondNumber ] && echo "The first number is less than the second number"
[ $firstNumber -gt $secondNumber ] && echo "The first number is greater than the second number"

[ $firstNumber -le $secondNumber ] && echo "The first number is less than or equal to the second number"
[ $firstNumber -ge $secondNumber ] && echo "The first number is greater than or equal to the second number"

# This section demonstrates testing variables

# Test if the USER variable exists
# TASK 1: Add a command that prints out a labelled description of what is in the USER variable, but only if it is not empty
[ -s $USER ] && echo "what is in the USER : $USER"
# TASK 2: Add a command that tells the user if the USER variable exists, but is empty
[ -v USER ] && echo "The variable SHELL exists"

# Tests for string data
# TASK 3: Modify the command to use the != operator instead of the = operator, without breaking the logic of the command
# TASK 4: Use the read command to ask the user running the script to give us strings to use for the tests
a=1
b=01
[ $a = $b ] && echo "$a is alphanumerically equal to $b" || echo "$a is not alphanumerically equal to $b"
