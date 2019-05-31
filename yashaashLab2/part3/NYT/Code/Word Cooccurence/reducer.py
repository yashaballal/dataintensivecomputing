#!/usr/bin/env python

from operator import itemgetter
import sys

current_word = None
current_count = 0
word = None
dict_red = {}

for line in sys.stdin:
    line = line.strip()
    wordpair, count = line.split('\t', 1)
    try:
        count = int(count)
    except ValueError:
        continue

    if current_word == wordpair:
        current_count += count
    else:
        if current_word and current_count>100:
            # write result to STDOUT
            print '%s\t%s\n' % (current_word, current_count)
            dict_red[current_word] = current_count
        current_count = count
        current_word = wordpair

if current_word == wordpair:
    if current_count > 100:
        print '%s\t%s\n' % (current_word, current_count)
    for i in range(0,10):
        if dict_red:
            maximum = max(dict_red, key=dict_red.get)
            str = 'MAXIMUM'
            print '%s|%s|%s|%s\n' % (str,i,maximum,dict_red[maximum])
            del dict_red[maximum]