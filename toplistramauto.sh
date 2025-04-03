#!/bin/bash

#Bash script for outputting the ten most RAM intensive processes on your machine into a file
#Designed to be used in a cronjob

date >> /home/tyler06/statistics/MEM_Usage.txt
top -b -o %MEM -n 20 | head -n 17 | tail -n 10 | tee -a /home/tyler06/statistics/MEM_Usage.txt