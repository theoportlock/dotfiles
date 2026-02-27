#!/usr/bin/env python3
from textblob import TextBlob
import pandas as pd
from GoogleNews import GoogleNews
import sys

class Analysis:
    def __init__(self, term):
        self.term = term
        self.sentiment = 0
        self.subjectivity = 0

    def run(self):
        googlenews = GoogleNews('en','d')
        googlenews.search(self.term)
        headline_results = googlenews.result()
        for i in headline_results:
            print(i["desc"])
            blob = TextBlob(i["desc"])    
            self.sentiment += blob.sentiment.polarity / len(headline_results)
            self.subjectivity += blob.sentiment.subjectivity / len(headline_results)

if __name__ == "__main__":
    a = Analysis(str(sys.argv[1]))
    a.run()
    print(a.term, 'Subjectivity: ',a.subjectivity, 'Sentiment: ', a.sentiment)
