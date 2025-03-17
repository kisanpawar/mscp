# Write a map-reduce program to count the number of occurrences of each alphabetic 
# character in the given dataset. The count for each letter should be case-insensitive (i.e., include 
# both upper-case and lower-case versions of the letter; Ignore non-alphabetic characters).

from collections import Counter 
import re
# Function to map: Convert text to lowercase and return list of characters 
def map_function(text):
    # Remove non-alphabetic characters and convert text to lowercase 
    cleaned_text = re.sub(r'[^a-zA-Z]', '', text.lower())
    # Return list of characters 
    return list(cleaned_text)
# Function to reduce: Count occurrences of each character 
def reduce_function(mapped_data):
    # Use Counter to count occurrences of each character 
    return dict(Counter(mapped_data))


# # Path to your text file 
# file_path = r"/map.txt"
# # Read the content of the file 
# with open(file_path, 'r') as file:
#     dataset = file.read()

dataset = """
Hello World! This is a test dataset to count the number of occurrences 
of each alphabetic character, both uppercase and lowercase. Ignore the 
non-alphabetic characters.
"""


# Simulating the MapReduce process:
# Step 1: Apply the map function 
mapped_data = map_function(dataset)
# Step 2: Apply the reduce function to count occurrences of each character 
reduced_data = reduce_function(mapped_data)
# Display the result 
print("Character Occurrences:")
for char, count in reduced_data.items(): 
    print(f"{char}: {count}")











'''
from collections import defaultdict
import string

# Mapper function
def mapper(text):
    intermediate = defaultdict(int)  # to hold the intermediate results (key-value pairs)
    
    # Convert the input text to lowercase and iterate over each character
    for char in text.lower():
        # Only count alphabetic characters
        if char in string.ascii_lowercase:
            intermediate[char] += 1
    
    return intermediate

# Reducer function
def reducer(intermediate_results):
    final_count = defaultdict(int)
    
    # Combine counts from each mapper result
    for result in intermediate_results:
        for char, count in result.items():
            final_count[char] += count
    
    return final_count

# MapReduce Function
def map_reduce(text):
    # Split the text into chunks (for simplicity, assuming one chunk here)
    mapper_results = [mapper(text)]
    
    # Reducer step
    return reducer(mapper_results)

# Example input text (dataset)
dataset = """
Hello World! This is a test dataset to count the number of occurrences 
of each alphabetic character, both uppercase and lowercase. Ignore the 
non-alphabetic characters.
"""

# Running the map-reduce program
result = map_reduce(dataset)

# Printing the final result (the frequency count of each letter)
for letter, count in sorted(result.items()):
    print(f"{letter}: {count}")


'''    
