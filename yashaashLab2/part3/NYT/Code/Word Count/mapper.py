#!/usr/bin/env python
"""mapper.py"""

import sys
import re

# input comes from STDIN (standard input)
stop_words = ['in','always','good','bad','great','so','on', 'at', 'of','its', 'it','is', 'as', 'have', 'has', 'was', 'were','but','be','and', 'an', 'at', 'out', 'the', 'can', 'not', 'no', 'yes', 'a', 'an', 'he', 'she', 'him', 'her','his', 'they', 'them', 'am', 'was', 'were', 'i', 'this', 'that', 'here', 'there', 'when', 'what', 'how', 'who', 'which', 'where', 'why', 'sometimes', 'instead', 'there', 'with', 'had', 'to', 'need', 'will', 'you', 'your', 'yours', 'would', 'yet', 'wouldnt', 'for','from','title', 'targetblank', 'supported', 'played', 'other', 'times', 'advertisement', 'since','these', 'version', 'while', 'another', 'including','though', 'could','their','after','later','itempropname','whose','according','ahead','because','before','began','brings','called','noreferrer','itemid','coming','evysbk','about','asked','cannot','too','still','more','back','week']
for line in sys.stdin:
    for char in '-+.,:;_#!?$%&*/=<>()[]{}0123456789\n\"\'':
        line=line.replace(char,'')
        line = line.lower()
        line = re.sub('<[^>]+>', '', line)
    
    line = line.strip()
    # split the line into words
    words = line.split()
    # increase counters
    
    for word in words:
        if not word in stop_words and (len(word)<18 and len(word)>3):
            if not ('www' in word or 'href' in word or 'http' in word or 'class' in word or 'css' in word):
	     # write the results to STDOUT (standard output);
	     # what we output here will be the input for the
	     # Reduce step, i.e. the input for reducer.py
	     #
	     # tab-delimited; the trivial word count is 1
                print '%s\t%s' % (word, 1)
        