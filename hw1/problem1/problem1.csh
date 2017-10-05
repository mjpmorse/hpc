#!/bin/BASH


#1a)
echo 'What user has the most pending jobs and how many are there? '
cat queue.txt| grep 'PD'  | tr -s ' ' | cut -d ' ' -f 5 | sort |uniq -c | tr -s ' ' | cut -d ' ' -f 2,3 | sort -g | tail -n 1

#665 yudhajit
echo 'How many total nodes is this user using?'
#1b)
cat queue.txt | tr -s ' '| grep 'yudhajit PD' |cut -d ' ' -f 8 | awk '{sum += $1}; END {print sum}'
#665
echo 'Which user, that has a running job, has the longest username?'
#3)
cat queue.txt| grep 'R'  | tr -s ' ' | cut -d ' ' -f 5 | sort |uniq -c | tr -s ' ' | cut -d ' ' -f 3 |awk '{ print length, $0 }' |sort -n | tail -n 1

#4)
echo 'What is the largest number of nodes being utitlized and by what user?'
cat queue.txt| tr -s ' ' | cut -d ' ' -f 5,8 | sort -t ' ' -n -k2 | tail -n 1
#mohsenda 40
echo 'How many unique users have pending jobs because of priority?'
#5)
cat queue.txt| grep '(Priority)' | grep PD | tr -s ' ' | cut -d ' ' -f 5 | sort | uniq | wc -l

#7
