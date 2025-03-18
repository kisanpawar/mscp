# ● Create a Pandas Series of 1000 random numbers from -500 to 500.
# ● Replace all negative values with their absolute values.
# ● Compute mean, median, standard deviation, and skewness.
# ● Find the top 10 highest values and their indices.
# ● Convert the series into a cumulative sum series. 

import pandas as pd
import numpy as np

randomDta =  np.random.randint(-500,500,1000)
series = pd.Series(randomDta)
series.abs()
print(series)
print("Mean:",series.mean())
print("Median:",series.median())
print("Standard Deviation:",series.std())
print("Skewness:",series.skew())
print("top Ten",series.nlargest(10))