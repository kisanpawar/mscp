# Write a map-reduce program to count the number of occurrences of each word in the given 
# dataset. (A word is defined as any string of alphabetic characters appearing between nonalphabetic characters like nature's is two words. The count should be case-insensitive. If a word 
# occurs multiple times in a line, all should be counted)

import re
from functools import reduce
from collections import defaultdict 
# Sample dataset
# dataset = [
# "Nature's beauty is unmatched in Nature's own way.", 
# "The quick brown fox jumps over the lazy dog.", 
# "Hello world! This is a test, hello world."
# ]
dataset = [
    "Hello, world! Welcome to the world of MapReduce.",
    "MapReduce is a programming model for processing large datasets.",
    "Word counting is a common example of MapReduce usage.",
    "This is a simple MapReduce example to count word occurrences.",
    "MapReduce can handle a large number of words efficiently!"
]

# Mapper function 
def mapper(line):
    # Use regular expression to split words, considering alphabetic characters only. 
    words = re.findall(r'[a-zA-Z]+', line.lower())
    return words

# Reducer function
def reducer(accumulated_counts, word_list): 
    for word in word_list:
        accumulated_counts[word] += 1 
    return accumulated_counts

# Map function
mapped_data = map(mapper, dataset)
# Reduce function: Accumulate word counts
word_counts = reduce(reducer, mapped_data, defaultdict(int)) 

# Print result
for word, count in word_counts.items(): 
    print(f'{word}: {count}')














'''
import re
from collections import defaultdict

# Mapper function
def mapper(text):
    intermediate = defaultdict(int)  # To hold the intermediate results (key-value pairs)
    
    # Tokenize the text into words using regex to match alphabetic characters only
    words = re.findall(r'[a-zA-Z]+', text.lower())  # Convert to lowercase and find words
    
    # For each word in the list, increment its count
    for word in words:
        intermediate[word] += 1
    
    return intermediate

# Reducer function
def reducer(intermediate_results):
    final_count = defaultdict(int)
    
    # Combine counts from each mapper result
    for result in intermediate_results:
        for word, count in result.items():
            final_count[word] += count
    
    return final_count

# MapReduce Function
def map_reduce(text_lines):
    # Apply the mapper function to each line in the dataset
    mapper_results = [mapper(line) for line in text_lines]
    
    # Apply the reducer function to combine the results
    return reducer(mapper_results)

# Example dataset (list of text lines)
dataset = [
    "Hello, world! Welcome to the world of MapReduce.",
    "MapReduce is a programming model for processing large datasets.",
    "Word counting is a common example of MapReduce usage.",
    "This is a simple MapReduce example to count word occurrences.",
    "MapReduce can handle a large number of words efficiently!"
]

# Running the map-reduce program
result = map_reduce(dataset)

# Printing the final word counts
for word, count in sorted(result.items()):
    print(f"{word}: {count}")

'''