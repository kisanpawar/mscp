# Demonstrate an application of Locality sensitive hashing technique for large datasets

import numpy as np 
import pandas as pd
from sklearn.feature_extraction.text import TfidfVectorizer 
from sklearn.random_projection import SparseRandomProjection 
from sklearn.neighbors import NearestNeighbors
from sklearn.metrics.pairwise import cosine_similarity 
import matplotlib.pyplot as plt


# Sample dataset: Text documents 
documents = [
"Data science is an inter-disciplinary field.", 
"Machine learning is a subset of data science.", 
"Deep learning is a part of machine learning.",
"Artificial intelligence includes machine learning and deep learning.",
"Data mining is a technique used in data science.", 
"Machine learning and data mining are related fields.", 
"Artificial intelligence is transforming industries."
]


# 1. Convert text data to TF-IDF feature vectors 
vectorizer = TfidfVectorizer(stop_words='english') 
tfidf_matrix = vectorizer.fit_transform(documents)


# 2. Apply LSH using Random Projection 
def apply_lsh(features, n_components=2):
  lsh = SparseRandomProjection(n_components=n_components) 
  transformed_features = lsh.fit_transform(features) 
  return transformed_features


# 3. Apply LSH to reduce dimensionality of TF-IDF features 
lsh_features = apply_lsh(tfidf_matrix.toarray())


# 4. Find similar documents using Nearest Neighbors (LSH based)
def find_similar_documents(lsh_features, query_index, n_neighbors=3): 
  nn = NearestNeighbors(n_neighbors=n_neighbors, metric='cosine') 
  nn.fit(lsh_features)
  distances, indices = nn.kneighbors([lsh_features[query_index]]) 
  return indices



# 5. Find similar documents (e.g., for the first document) 
query_index = 0
similar_documents_indices = find_similar_documents(lsh_features, query_index)
similar_documents_indices


# 6. Display the results
print(f"Query Document: {documents[query_index]}") 
print("\nSimilar Documents:")
for idx in similar_documents_indices[0]:
  print(f"- {documents[idx]}")



  