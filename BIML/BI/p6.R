# Write a program to explain links to establish higher-order relationships among entities in Link Analysis.

add_edge <- function(graph, node1, node2) { 
  graph[[node1]] <- c(graph[[node1]], node2)
  graph[[node2]] <- c(graph[[node2]], node1) 
  graph
}
graph <- list()
nodes <- c("A", "B", "C", "D")
graph <- add_edge(graph, "A", "B") 
graph <- add_edge(graph, "A", "C") 
graph <- add_edge(graph, "B", "C") 
graph <- add_edge(graph, "C", "D") 
graph
for (node in names(graph)) {
  cat(node, " --> ", paste(graph[[node]], collapse = ", "), "\n")
}
library(igraph)
nodes <- c("A", "B", "C", "D")
edges <- c("A", "B", "A", "C", "B", "C", "C", "D")
graph <- graph(edges, directed = TRUE)
V(graph)$label <- nodes
plot(graph, layout = layout_nicely(graph), edge.arrow.size = 0.5)

