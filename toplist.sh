#!/bin/bash

#Bash script for listing out either the top ten most CPU intensive processes running or the top 10 most memory intensive processes running

read -p "Would you like to list CPU intensive processes or RAM intensive processes? " input

if [ "$input" == CPU ]; then
    echo "Please wait..."
    date >> /home/tyler06/statistics/CPU_Usage.txt
    top -b -o %CPU -n 20 | head -n 17 | tail -n 10 | tee -a /home/tyler06/statistics/CPU_Usage.txt
elif [ "$input" == MEM ]; then
    echo "Please wait..."
    date >> /home/tyler06/statistics/MEM_Usage.txt
    top -b -o %MEM -n 20 | head -n 17 | tail -n 10 | tee -a /home/tyler06/statistics/MEM_Usage.txt
else
    echo "ERROR: Please enter either "CPU" or "MEM""
fi