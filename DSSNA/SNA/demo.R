# Define edges of the network (pairs of connected nodes)
library(igraph)

edges <- c("Alice", "Bob", "Bob", "Charlie", "Alice", "Charlie", "Charlie", "David", "Bob", "David")

# Create a graph object from the edge list (undirected)
network <- graph(edges, directed = FALSE)

# Plot the network
plot(network)


edges < c(1,2,2,3,3,4,4,5,2,5)
network <- graph((edges, directed = FALSE))
plot(network)