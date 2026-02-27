#!/usr/bin/env python3
import sys
import numpy as np
import seaborn as sns
import pandas as pd
import matplotlib.pyplot as plt
from sklearn.feature_extraction.text import TfidfVectorizer

documents = [open(f).read() for f in sys.argv[1:]]
tfidf = TfidfVectorizer().fit_transform(documents)
hm = tfidf * tfidf.T
df = pd.DataFrame(hm.toarray(), columns=[sys.argv[1:]], index=[sys.argv[1:]])
sns.heatmap(df, xticklabels=1, yticklabels=1)
plt.show()
