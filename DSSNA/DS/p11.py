# Aim: Histogram for Customer Age Distribution
# Dataset: customer_data.csv
# Columns: (Customer_ID, Age, Purchase_Amount, Gender)
# Task:
# ● Plot a histogram of age distribution.
# ● Overlay histograms for male and female customers.
# ● Add a Kernel Density Estimation (KDE) curve. 

import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
import seaborn as sns

# Generate sample customer data
np.random.seed(42)
num_samples = 500

data = {
    "CustomerID": np.arange(1, num_samples + 1),
    "Gender": np.random.choice(["Male", "Female"], size=num_samples),
    "Age": np.random.randint(18, 70, size=num_samples),
    "Income": np.random.randint(20000, 100000, size=num_samples),
}

df = pd.DataFrame(data)

print(df.head())

# Plot Age distribution by Gender
plt.figure(figsize=(8, 5))
sns.histplot(df[df["Gender"] == "Male"]["Age"], bins=20, kde=True,
             color="blue", label="Male", alpha=0.6)
sns.histplot(df[df["Gender"] == "Female"]["Age"], bins=20, kde=True,
             color="pink", label="Female", alpha=0.6)
plt.title("Age Distribution by Gender")
plt.xlabel("Age")
plt.ylabel("Frequency")
plt.legend()
plt.show()
