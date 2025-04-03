#!/bin/bash

#Bash script for outputting the ten most CPU intensive processes on your machine into a file
#Designed to be used in a cronjob

date >> /home/tyler06/statistics/CPU_Usage.txt
top -b -o %CPU -n 20 | head -n 17 | tail -n 10 | tee -a /home/tyler06/statistics/CPU_Usage.txt