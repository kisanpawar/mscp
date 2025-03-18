# : Convert a Tuple to an Array & Compute Logarithms
# Task:
# ● Convert a tuple (1, 10, 100, 1000, 10000) into a NumPy array.
# ● Compute the natural logarithm (np.log()).
# ● Compute the base-10 logarithm (np.log10()). 


import numpy as np

tupal = (1,10,100,1000,10000)
convertArray = np.array(tupal)

log_natural = np.log(convertArray)
log_base10 = np.log10(convertArray)
  


print("Original Array:", arr)
print("Natural Log:", log_natural)
print("Log Base 10:", log_base10)