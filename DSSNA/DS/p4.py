# : Create a 3D NumPy Array & Extract a Subarray
# Task:
# ● Create a 3D array of shape (3, 3, 3) filled with random integers from 1 to 50. ● Extract
# the first two matrices and all columns of index 1 and 2.

import numpy as np
# Create a 3D array of shape (3, 3, 3) filled with
# random integers from 1 to 50.
array = np.random.randint(1,50,size=(3,3,3))
print(array)
print("Shape:",array.shape)
subarray = array[:1, :, 1:3] 


print(subarray)