# Write a program to exhibit structural equivalence, automorphic equivalence, and regular equivalence from a network.

library(igraph) 
eq_matrix <- matrix(c(0, 1, 1, 0, 0, 
                      1, 0, 1, 1, 0, 
                      1, 1, 0, 1, 1, 
                      0, 1, 1, 0, 1, 
                      0, 0, 1, 1, 0),  
                    nrow = 5, byrow = TRUE) 

colnames(eq_matrix) <- rownames(eq_matrix) <- c("A", "B", "C", "D", "E") 

graph_eq <- graph_from_adjacency_matrix(eq_matrix, mode = "undirected") 

plot(graph_eq, main = "Network for Equivalence Analysis") 
structural_eq <- similarity(graph_eq, method = "jaccard") 

print("Structural Equivalence:") 
print(structural_eq) 

automorphic_eq <- distances(graph_eq) 
print("Automorphic Equivalence:") 
print(automorphic_eq) 


# Regular Equivalence: Approximated using community detection (Louvain method)
community <- cluster_louvain(graph_eq)

print("Regular Equivalence:")
print(membership(community))
# Plot the graph with communities (Regular Equivalence)
plot(graph_eq, vertex.color = membership(community), main = "Network with Communities (Regular Equivalence)")







library(igraph)

# Define the adjacency matrix
eq_matrix <- matrix(c(0, 1, 1, 0, 0, 
                      1, 0, 1, 1, 0, 
                      1, 1, 0, 1, 1, 
                      0, 1, 1, 0, 1, 
                      0, 0, 1, 1, 0),  
                    nrow = 5, byrow = TRUE) 

# Set row and column names for clarity
colnames(eq_matrix) <- rownames(eq_matrix) <- c("A", "B", "C", "D", "E") 

# Create an undirected graph from the adjacency matrix
graph_eq <- graph_from_adjacency_matrix(eq_matrix, mode = "undirected") 

# Plot the graph to visualize the network
plot(graph_eq, main = "Network for Equivalence Analysis")

# Structural Equivalence: Similarity based on shared neighbors (Jaccard)
structural_eq <- similarity(graph_eq, method = "jaccard")

# Display Structural Equivalence matrix
print("Structural Equivalence (Jaccard Similarity):")
print(structural_eq)

# Automorphic Equivalence: Distances (shortest paths) between all nodes
automorphic_eq <- distances(graph_eq)

# Display Automorphic Equivalence matrix
print("Automorphic Equivalence (Shortest Path Distances):")
print(automorphic_eq)

# Regular Equivalence: Approximated using community detection (Louvain method)
community <- cluster_louvain(graph_eq)

# Print out the community memberships for each node
print("Regular Equivalence (Community Detection):")
print(membership(community))

# Plot the graph with communities (Regular Equivalence)
plot(graph_eq, vertex.color = membership(community), main = "Network with Communities (Regular Equivalence)")


















# Load the igraph library
library(igraph)

# Create a sample undirected graph for demonstration
edges <- c(1, 2, 2, 3, 3, 4, 4, 1, 4, 5, 5, 6, 6, 1, 2, 6, 5, 3)
g <- graph(edges, directed = FALSE)

# Plot the graph to visualize
plot(g, main = "Original Network")

# Structural Equivalence
# Structural equivalence means the nodes should have exactly the same neighbors.
# Use the function 'similarity' with a type that checks structural equivalence.
structural_equivalence <- similarity(g, method = "jaccard")
print("Structural Equivalence (Jaccard Similarity):")
print(structural_equivalence)

# Regular Equivalence
# Regular equivalence groups nodes based on similar roles in the network.
# Here we use 'clustering coefficient' to demonstrate regular equivalence.
clustering_coeffs <- transitivity(g, type = "local")
print("Clustering Coefficients (Regular Equivalence Approximation):")
print(clustering_coeffs)

# Automatic Equivalence
# Automatic equivalence is based on a more generalized approach like "blockmodeling".
# The `community_blockmodel()` function can be used for blockmodeling, which is similar to automatic equivalence.
community <- cluster_louvain(g)  # Use community detection to find clusters
print("Automatic Equivalence using Community Detection:")
print(community)

# Plot the network with communities detected (Automatic Equivalence)
plot(g, vertex.color = membership(community), main = "Network with Communities (Automatic Equivalence)")
