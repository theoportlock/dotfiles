#!/usr/bin/env python
import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
import matplotlib.dates as mdates
from datetime import datetime

# Read data - only up to 2020
url_csv = 'https://opendata.ecdc.europa.eu/covid19/casedistribution/csv'
df_covid_2019 = pd.read_csv(url_csv)

# Convert to datetime
df_covid_2019.loc[:, 'dateRep'] = pd.to_datetime(df_covid_2019.dateRep, format='%d/%m/%Y')
#df_covid_2019 = df_covid_2019.dropna()

# Select UK
country = 'United_Kingdom'
country_df = df_covid_2019.loc[df_covid_2019.countriesAndTerritories == country][::-1]
#country_df.dateRep = pd.to_datetime(country_df.dateRep, format='%Y-%m-%d', errors='ignore')
x1, y1 = country_df.dateRep, country_df.deaths
plt.plot_date(x1, y1)

popt, pcov = np.polyfit(pd.to_numeric(x1), y1, 5, cov=True)
poly_function = np.poly1d(popt)
x2 = pd.date_range(min(x1), max(x1), periods=500)
y2 = poly_function(pd.to_numeric(x2))
plt.plot(x2, y2)

plt.show()
