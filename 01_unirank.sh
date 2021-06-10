#! /usr/bin/env zsh

# source data 'unirank.csv' can be downloaded here:
# http://educative.io/udata/4Wyl0VOx0b0/unirank.csv


# preview
cat unirank.csv
head unirank.csv
head -n 25 unirank.csv
tail unirank.csv


# csvkit
# info is available here:
# https://csvkit.readthedocs.io/en/latest/index.html


# table view
head -n 25 unirank.csv | csvlook


# lines including "college"
cat unirank.csv | grep -i "college" | wc -l


# cut fields
cat unirank.csv | cut -f 1,3 -d , | sort -k 2 -t "," | csvlook


# number of universities for each state
cat unirank.csv | cut -f 3 -d , | sort | uniq -c

# states with most universities first
cat unirank.csv | cut -f 3 -d , | sort | uniq -c | sort -rk 1
