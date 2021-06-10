#! /usr/bin/env zsh

# source data 'unirank.csv' can be downloaded here:
# https://scientificprogramming.io/datasets/
# or here:
# http://educative.io/udata/4Wyl0VOx0b0/unirank.csv


#------------------------------------------------------------------------------
# Preview data
#------------------------------------------------------------------------------

cat unirank.csv
head unirank.csv
head -n 25 unirank.csv
tail unirank.csv
# start from line number 2
tail -n +2 unirank.csv

# csvkit
# info is available here:
# https://csvkit.readthedocs.io/en/latest/index.html

# table view
head -n 25 unirank.csv | csvlook



#------------------------------------------------------------------------------
# Which ones are Colleges?
#------------------------------------------------------------------------------

# lines including "college"
grep -i "college" unirank.csv | csvlook -H

# remove universities
grep -i "college" unirank.csv | grep -v -i 'university' | csvlook -H

# percentage of colleges
tail -n +2 unirank.csv | wc -l
tail -n +2 unirank.csv | grep -i "college" | grep -v -i "university" | wc -l
bc -l <<< "6 / 231 * 100"


#------------------------------------------------------------------------------
# Which States have the most Universities?
#------------------------------------------------------------------------------

# get name,state and sort by state
tail -n +2 unirank.csv | cut -f 1,3 -d , | sort -k 2 -t "," | csvlook -H

# number of universities for each state
tail -n +2 unirank.csv | cut -f 3 -d , | sort | uniq -c

# states with most universities first
tail -n +2 unirank.csv | cut -f 3 -d , | sort | uniq -c | sort -rk 1


#------------------------------------------------------------------------------
# Tuition & Fees vs. Ranking
#------------------------------------------------------------------------------

tail -n +2 unirank.csv | cut -f 4,6 -d , | csvlook -H
