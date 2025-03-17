#Diabetes dataset for linear regression practical
import pandas as pd 
import numpy as np
import matplotlib.pyplot as plt
from sklearn.model_selection import train_test_split
from sklearn.linear_model import LinearRegression
from sklearn.metrics import mean_squared_error,r2_score


# Load the diabetes dataset
url  =  "https://raw.githubusercontent.com/jbrownlee/Datasets/master/pima-indians-diabetes.data.csv"

# load dataset

column_names = ['Pregnancies', 'Glucose', 'BloodPressure', 'SkinThickness', 'Insulin', 'BMI', 'DiabetesPedigreeFunction', 'Age', 'Outcome']
df =  pd.read_csv(url,names=column_names)
# print(df.head())
# print(df.describe())
# print(df.info())
# print(df.isnull().sum())
# Visualize the distribution of BMI (target variable) using a histogram
df['BMI'].hist()
plt.title = 'BMI Distribution'
plt.xlabel = 'BMI'
plt.ylabel = 'Frequency'
plt.show()

# Visualize the relationship between Glucose and BMI using a scatter plot
# print(df.describe())
# Features (X) and target (y)
X = df[['Glucose']]
y = df['BMI']

X_train ,X_test,y_train ,y_test =train_test_split(X,y,test_size=0.2,random_state=42)
# Create a linear regression model

# Initialize the linear regression model
model = LinearRegression()

# Fit the model on the training data 
model.fit(X_train,y_train)

# Predict on the test set 
y_pred = model.predict(X_test)

# Mean Squared Error (MSE)
mse = mean_squared_error(y_test, y_pred)
print(f"Mean Squared Error (MSE): {mse}")

# R-squared score (R²)

r2 = r2_score(y_test, y_pred)
print(f"R-squared (R²): {r2}")

# Visualize actual vs predicted values

plt.scatter(y_test, y_pred)
plt.title("Actual vs Predicted BMI")
plt.xlabel("Actual BMI")
plt.ylabel("Predicted BMI")
plt.show()







