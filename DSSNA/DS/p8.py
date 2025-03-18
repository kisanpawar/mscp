# 

import pandas as pd

chunk_size = 50000
chunks = pd.read_csv("./cleaned_data.csv", chunksize=chunk_size)
processed_chunks = []

for chunk in chunks:
    # Drop columns with less than 70% non-NA values
    chunk = chunk.dropna(thresh=0.7 * len(chunk), axis=1)
    
    # Convert 'date' column to datetime if it exists
    if 'date' in chunk.columns:
        chunk['date'] = pd.to_datetime(chunk['date'], errors='coerce')
    
    # Normalize numerical columns
    num_cols = chunk.select_dtypes(include=['number']).columns
    chunk[num_cols] = (chunk[num_cols] - chunk[num_cols].min()) / \
                      (chunk[num_cols].max() - chunk[num_cols].min())
    
    processed_chunks.append(chunk)

# Concatenate all processed chunks into a single DataFrame
final_df = pd.concat(processed_chunks, ignore_index=True)

# Save the final DataFrame to a CSV file
final_df.to_csv("cleaned_dataset.csv", index=False)