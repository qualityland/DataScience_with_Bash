#! /usr/bin/env zsh

# source data 'facebookdata.csv' can be downloaded here:
# https://scientificprogramming.io/datasets/

#------------------------------------------------------------------------------
# How does the data look like?
#------------------------------------------------------------------------------

# how many rows? (that are not empty)
csvstat --count facebookdata.csv

# what columns?
csvstat -n facebookdata.csv

# preview some columns of first rows
head -n 50 facebookdata.csv | csvcut -c 1,4,7-11 | csvlook


#------------------------------------------------------------------------------
# How many reactions has a fb post?
#------------------------------------------------------------------------------

# copy ID and all reactions in a separate file
csvcut -c 1,8-15 facebookdata.csv > fb_reactions.csv

# sum up all reactions for the first 9 rows (using awk)
head fbreactons.csv | tail -n +2 | \
	awk -F "," '{total = $2 + $3 + $4 + $5 + $6 + $7 + $8 + $9; \
		print $1"," total}'

# sum up all reactions
awk -F "," '{total = $2 + $3 + $4 + $5 + $6 + $7 + $8 + $9; \
	print $1"," total}' fbreactons.csv

# ...sort by number of reactions
awk -F "," '{total = $2 + $3 + $4 + $5 + $6 + $7 + $8 + $9; \
	print $1"," total}' fbreactons.csv | \
	sort -n -r -t "," -k 2 | head -n 1
