# For a given network find the following: (i) Length of the shortest path from a given node to another node; (ii) the density of the graph; (iii) Draw egocentric network of node G with chosen configuration parameters. 

library(igraph) 
edges <- c(1, 2, 2, 3, 1, 3, 2, 4, 3, 5, 4, 5, 4, 6, 4, 7, 5, 7, 5, 1) 
g <- graph(edges, directed = FALSE) 
plot(g)


# Length of the shortest path from a given node to another node
s <- shortest_paths(g, from = 3, to = 6) 
cat("Shortest path from node 3 to 6: ", length(s$v[[1]]) - 1, "\n")

s <- shortest_paths(g, from = 2, to = 7) 
cat("Shortest path from node 2 to 7: ", length(s$v[[1]]) - 1, "\n")



#  The density of the graph 
density <-edge_density(g) 
cat ("density of a graph:",density)



# Draw egocentric network of node G with chosen configuration parameters
ego_graph <- make_ego_graph(g,order = 1,nodes = 2)[[1]] 
plot (ego_graph,main = "ego centric network of node 2") 








