#!/usr/bin/env python3
import pandas as pd
import os
top = os.path.expanduser("~/system/computers")
files = os.listdir(top)
df = []
for file in files:
    df.append(pd.read_csv(os.path.join(top,file,"stats"),sep=":"))
df1 = pd.concat([i.T for i in df])
print(df1)
df1.to_csv("test.csv")
