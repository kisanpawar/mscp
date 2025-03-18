
# Aim: Pandas Series Operations
# Aim: Pandas DataFrame Operations
# Task:
# ● Generate a DataFrame (1000 rows × 5 columns) with random numbers (1–1000).
# ● Rename columns as ‘A’, ‘B’, ‘C’, ‘D’, ‘E’.
# ● Add a new column ‘F’ as the product of ‘A’ and ‘B’.
# ● Compute row-wise sum, mean, and variance.
# ● Select only rows where ‘C’ is greater than 700 and ‘D’ is even. 

import pandas as pd
import numpy as np
# Generate a DataFrame with random numbers (1–1000)
data = np.random.randint(1,1000,size=(1000,5))
df = pd.DataFrame(data, columns=['A','B','C','D','E'])
print(df)
# Rename columns as ‘A’, ‘B’, ‘C’, ‘D’, ‘E’.
df.columns = ['A','B','C','D','E']
print(df)
# Add a new column ‘F’ as the product of ‘A’ and ‘B’.
df['F'] = df['A'] * df['B']
print(df)
# Compute row-wise sum, mean, and variance.
print("Row-wise Sum:")
print(df.sum(axis=1))
print("Row-wise Mean:")
print(df.mean(axis=1))
print("Row-wise Variance:")
print(df.var(axis=1))
# Select only rows where ‘C’ is greater than 700 and ‘D’ is even.
print("Rows where ‘C’ is greater than 700 and ‘D’ is even:")
print(df[(df['C'] > 700) & (df['D'] % 2 == 0)])


                            
