# Write a program to compute the following for a given a network: (i) number of edges, (ii) number of nodes; (iii) degree of node; (iv) node with lowest degree; (v)the adjacency list; (vi) matrix of the graph. (i) number of edges


library(igraph) 
edges <- c(1, 2, 1, 3, 2, 3, 2, 3, 4, 5, 1, 5) 
g <- graph(edges, directed = TRUE) 
plot(g) 

degree(g)
E(g)
V(g)


degree(g, mode = "in") 
degree(g, mode = "out") 
get.adjacency(g)
get.adjedgelist(g,mode=c("all"))

