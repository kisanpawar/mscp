library(igraph)

# Example: One-mode edge list
edge <- graph(c(1, 2, 1, 3, 2, 3, 2, 3, 4, 5, 1, 5), directed = FALSE)
#edge_list <- data.frame(from = c(1, 1, 2, 3), to = c(2, 3, 3, 4))

plot(graph_from_data_frame(edge_list, directed = FALSE))