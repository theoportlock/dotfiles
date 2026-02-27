#!/usr/bin/env python3
import matplotlib.pyplot as plt
import sys
import pandas as pd
from pytrends.request import TrendReq

def get_searches(key_word):
    trend = TrendReq(hl='en-US', tz=360)
    trend.build_payload([key_word],timeframe='today 5-y')    

    df = trend.interest_over_time()

    df['timestamp'] = pd.to_datetime(df.index)
    plt.plot(df['timestamp'], df[key_word]/100)
    
    plt.title("Normalized Searches for {}".format(key_word))
    plt.ylabel("Number of Searches")
    plt.xlabel("Date")
    plt.xticks(rotation=45)

if __name__ == "__main__":
    get_searches(str(sys.argv[1]))
    plt.show()
