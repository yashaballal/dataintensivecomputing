#!/usr/bin/env python

import sys
import re

stop_words = ['in','always','good','bad','great','so','on', 'at', 'of','its', 'it','is', 'as', 'have', 'has', 'was', 'were','but','be','and', 'an', 'at', 'out', 'the', 'can', 'not', 'no', 'yes', 'a', 'an', 'he', 'she', 'him', 'her','his', 'they', 'them', 'am', 'was', 'were', 'i', 'this', 'that', 'here', 'there', 'when', 'what', 'how', 'who', 'which', 'where', 'why', 'sometimes', 'instead', 'there', 'with', 'had', 'to', 'need', 'will', 'you', 'your', 'yours', 'would', 'yet', 'wouldnt', 'for','from','title', 'targetblank', 'supported', 'played', 'other', 'times', 'advertisement', 'since','these', 'version', 'while', 'another', 'including','though', 'could','their','after','later','itempropname','whose','according','ahead','because','before','began','brings','called','noreferrer','itemid','coming','evysbk','about','asked','cannot','too','still','more','back','week']
top_ten = ['avengersendgame','avengers','comic','marvel','movie','thanos','about','think','endgame','still','people']

for line in sys.stdin:
    for char in '-+.,:;_#!?$%&*/=<>()[]{}0123456789\n\"\'':
        line=line.replace(char,'')
        line = line.lower()
        line = re.sub('<[^>]+>', '', line)

    # remove leading and trailing whitespace
    line = line.strip()
    # split the line into words
    words = line.split()

    for i in xrange(len(words)-1):
        for j in range(i+1,len(words)):
            if ((words[i] in top_ten) and (words[j] not in stop_words) and (words[i]!=words[j])):
                print "%s|%s\t%s" % (words[i],words[j], 1)