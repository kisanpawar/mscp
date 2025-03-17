# Identify ties within the network using two-mode core periphery analysis. 

# install.packages("bipartite")

library(bipartite) 
library(igraph) 
#Example of bipartite adjacency matrix (1 indicates a tie between the two actors) 
adj_matrix <- matrix(c(
  1, 1, 1, 0, 
  1, 1, 0, 1,  
  1, 0, 1, 1,
  0, 1, 1, 1), 
  nrow = 4, ncol = 4, byrow = TRUE)

rownames(adj_matrix) <- c("Person1", "Person2", "Person3", "Person4") 
colnames(adj_matrix) <- c("Event1", "Event2", "Event3", "Event4") 
print(adj_matrix) 

#Create a bipartite graph from the adjacency matrix
bipartite_graph <- graph_from_incidence_matrix(adj_matrix)

# Plot the bipartite graph
plot(bipartite_graph, 
     main = "Bipartite Network",  # Fixed syntax: added '=' in main argument
     vertex.size = 30)

node_degrees <- degree(adj_matrix)
core_nodes <- which(node_degrees > 2)
periphery_nodes <- setdiff(V(bipartite_graph)$name, V(bipartite_graph)$name[core_nodes])

core_periphery <- list(core = core_nodes, periphery = periphery_nodes)

# Print the core-periphery structure
print(core_periphery)
