#Aim: Convert a Nested List into a NumPy Array & Perform Operations
#Task:
#● Convert a nested list [[1, 2, 3], [4, 5, 6], [7, 8, 9]] into a 2D NumPy array.
#● Compute the sum of each column using np.sum().
# ● Compute the product of each row using np.p


import numpy as np
nested_list = [[1,2,3],[4,5,6],[7,8,9]]
convertarray = np.array(nested_list)
print(convertarray)
sumofArray =  np.sum(convertarray,axis=0)
print(sumofArray)

productofArray = np.prod(convertarray,axis=1)
print(productofArray)




