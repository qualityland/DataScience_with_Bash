#! /usr/bin/env zsh


# preview
head data/unirank.csv
head -n 25 data/unirank.csv
tail data/unirank.csv

# table view with csvkit
head -n 25 unirank.csv | csvlook


# appearance of "college"
grep -i "college" | wc -l


# cut fields
cat data/unirank.csv | cut -f 1,3 -d , | sort -k 2 -t "," | csvlook