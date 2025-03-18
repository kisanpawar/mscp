# Aim: Compare Memory Allocation Between List & NumPy Array
# Task:
# ● Create a list and a NumPy array with 1 million random integers.
# ● Compare their memory usage using sys.getsizeof(

# import sys
# import numpy as np
# list_data = list(range(1_000_000))
# array_data = np.arange(1_000_000)
# list_memory = sys.getsizeof(list_data) + sum(sys.getsizeof(x) for x in
# list_data)
# array_memory = array_data.nbytes
# print("Memory Usage (List):", list_memory, "bytes")
# print("Memory Usage (NumPy Array):", array_memory, "bytes")

import sys
import numpy as np
list_data  = list(range(1_000_000))
array_data = np.arange(1_000_000)

list_memory = sys.getsizeof(list_data) + sum(sys.getsizeof(x) for x in list_data)
array_memory = array_data.nbytes
print("Memory Usage (List):", list_memory, "bytes")
print("Memory Usage (NumPy Array):", array_memory, "bytes")
# Compare this snippet from mscp/DSSNA/DS/p4.py:
