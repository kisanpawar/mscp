# Aim: Generate a Structured 2D Array with Specific Data Types
# Task:
# ● Create a structured array with names, ages, and weights.
# ● Assign dtype=[('name', 'U10'), ('age', 'i4'), ('weight', 'f4')].
# ● Add and print three records. 

import numpy as np

dtype = [('name', 'U10'), ('age', 'i4'), ('weight', 'f4')]

addNewArray = [('John', 25, 60.5), ('Jane', 30, 70.2), ('Alice', 35, 80)]

array = np.array(addNewArray, dtype=dtype)

print(array['name'])
print(array['age'])

print(array['weight'])




