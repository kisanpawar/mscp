#Aim: Handling JSON Files
# Task:
# ● Load a nested JSON file into a DataFrame.
# ● Flatten nested columns into separate columns.
# ● Convert Unix timestamps into readable datetime format.
# ● Extract specific fields into a subset DataFrame. 


# ● Create  a nested JSON file into a DataFrame
# ● Flatten nested columns into separate columns.
# ● Convert Unix timestamps into readable datetime format.
# ● Extract specific fields into a subset DataFrame.


import json
import pandas as pd
with open('mscp/DSSNA/DS/nested.json', 'r') as f:
 data = json.load(f)
 print(data)
df = pd.json_normalize(data['records'])
if 'timestamp' in df.columns:
 df['timestamp'] = pd.to_datetime(df['timestamp'], unit='s')
subset_df = df[['id', 'user.name', 'timestamp', 'location.city']]
subset_df.rename(columns={'user.name': 'name', 'location.city': 'city'},
inplace=True)
print(subset_df.head())

