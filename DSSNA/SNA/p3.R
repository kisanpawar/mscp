#  Compute the following node level measures: (i) Density; (ii) Degree;(iii) Reciprocity; (iv) Transitivity; (v) Centralization; (vi) Clustering

library(igraph)

g<-graph.formula(1-2,1-3,2-4,2-3,4-2,2-4,3-4,4-5,5-3,5-6,6-1,3-6,6-4,6-2) 
plot(g)

# Density 
ecount(g)/(vcount(g)*vcount(g)-1) 

# Compute density of the graph
density <- edge_density(graph)
print(density)


#Degree
degree(g) 
ecount(g) 
vcount(g)


# Reciprocity
library(igraph) 
g<-graph.formula(1-+2,1-+3,2++3) 
plot(g) 
reciprocity(g) 
dyad.census(g) 


# transitivity
kite<-graph.famous("krackhardt_kite") 
net<-adjacent.triangles(kite) 
plot (kite,vertex.lable=net) 
transitivity(kite,type="local")


# Centrality
library(igraph) 
edges <- c(1, 2, 1, 3, 2, 3, 2, 3, 4, 5, 1, 5) 
g <- graph(edges, directed = TRUE) 
plot(g) 
centralization.degree(g, mode="out", normalized = T) 
centralization.degree(g, mode="in", normalized = T) 
centralization.degree(g, mode="all", normalized = T)


# Closeness
closeness(g, mode="all") 
centralization.closeness(g, mode="all", normalized = T) 


# Betweenness
betweenness(g, directed = T, weights=NA) 
edge.betweenness(g, directed = T, weights=NA) 
centralization.betweenness(g, directed = T, normalized = NA)


# Clustering
library(igraph) 
g2 <- barabasi.game(50, p = 2, directed = FALSE) 
g1 <- watts.strogatz.game(1, size = 100, nei = 5, p = 0.05) 
g <- graph.union(g1, g2) 
g <- simplify(g) 
summary(g) 
plot(g) 

























# Load the igraph package
library(igraph)

# Create a sample directed graph
edges <- c("A", "B", "B", "C", "C", "A", "D", "C", "E", "D", "E", "C")
graph <- graph(edges = edges, directed = TRUE)

# Plot the graph
plot(graph)

# (i) Density
# Use edge_density function to calculate density
density_value <- edge_density(graph)
print(paste("Density: ", density_value))

# (ii) Degree (in-degree and out-degree)
degree_info <- degree(graph)
print("Degree for each node:")
print(degree_info)

# In-degree and out-degree
in_degree <- degree(graph, mode = "in")
out_degree <- degree(graph, mode = "out")
print("In-degree for each node:")
print(in_degree)
print("Out-degree for each node:")
print(out_degree)

# (iii) Reciprocity
reciprocity_value <- reciprocity(graph)
print(paste("Reciprocity: ", reciprocity_value))

# (iv) Transitivity
transitivity_value <- transitivity(graph, type = "global")
print(paste("Transitivity: ", transitivity_value))

# (v) Centralization (Degree centralization)
centralization_value <- centralization.degree(graph, mode="all")
print(paste("Degree Centralization: ", centralization_value$centralization))

# (vi) Clustering Coefficient (Local clustering)
clustering_coef <- transitivity(graph, type = "local")
print("Clustering coefficient for each node:")
print(clustering_coef)


