# Perform following tasks: (i) View data collection forms and/or import onemode/ two-mode datasets; (ii) Basic Networks matrices transformations 


# Load necessary libraries
library(igraph)

# Import the one-mode adjacency matrix
friendship_matrix <- read.csv("C:/Hemant/my/rnd/msc/sem2/code/SNA/p2_1.csv", row.names = 1)

# Convert it into a graph
graph_one_mode <- graph_from_adjacency_matrix(as.matrix(friendship_matrix), mode = "undirected")

# Plot the graph
plot(graph_one_mode, main = "One-mode Network")


# Load necessary libraries
library(igraph)

# Import the two-mode adjacency matrix
events_matrix <- read.csv("C:/Hemant/my/rnd/msc/sem2/code/SNA/p2_2.csv", row.names = 1)

# Convert it into a bipartite graph
bipartite_graph <- graph_from_incidence_matrix(as.matrix(events_matrix))

# Plot the bipartite graph
plot(bipartite_graph, main = "Two-mode Bipartite Network", vertex.size = 30)


# Basic Network Matrix Transformations in R

# For a One-mode Graph (Adjacency Matrix):
adjacency_matrix <- matrix(c(0, 1, 1, 0, 1, 0, 1, 1, 0), nrow = 3)
rownames(adjacency_matrix) <- colnames(adjacency_matrix) <- c("A", "B", "C")
graph_one_mode <- graph_from_adjacency_matrix(adjacency_matrix, mode = "undirected")
plot(graph_one_mode, main = "One-mode Network")

# For a Two-mode Graph (Incidence Matrix):
incidence_matrix <- matrix(c(1, 1, 0, 0, 1, 0, 1, 0, 0), nrow = 3)
rownames(incidence_matrix) <- c("A", "B", "C")
colnames(incidence_matrix) <- c("X", "Y", "Z")
bipartite_graph <- graph_from_incidence_matrix(incidence_matrix)
plot(bipartite_graph, main = "Two-mode Bipartite Network")

adjacency_matrix_from_graph <- as_adjacency_matrix(graph_one_mode)
print(adjacency_matrix_from_graph)


# node_degrees <- degree(graph_one_mode)
# print(node_degrees)

bipartite_adj_matrix <- as_adjacency_matrix(bipartite_graph)
print(bipartite_adj_matrix)



