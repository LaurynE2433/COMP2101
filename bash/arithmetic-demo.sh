#!/bin/bash
#
# this script demonstrates doing arithmetic

# Task 1: Remove the assignments of numbers to the first and second number variables. Use one or more read commands to get 3 numbers from the user.
# Task 2: Change the output to only show:
#    the sum of the 3 numbers with a label
#    the product of the 3 numbers with a label

read -p "please enter your first number:" firstnum
read -p "please enter your second number:" secondnum
read -p "please enter your third number:" thirdnum
sum=$(($firstnum + $secondnum + $thirdnum))
product=$(($firstnum * $secondnum * $thirdnum))
cat <<EOF
The sum of $firstnum plus $secondnum plus $thirdnum is $sum
Product of $firstnum, $secondnum, $thirdnum is $product
EOF
