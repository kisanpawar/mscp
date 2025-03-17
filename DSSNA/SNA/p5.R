# Write a program to distinguish between a network as a matrix, a network as an edge list, and the network as a sociogram (or “network graph”) using 3 distinct network representatives of each.

library(igraph)
adj_matrix1 <- matrix(c(0, 1, 1, 0, 
                        1, 0, 1, 1, 
                        1, 1, 0, 1, 
                        0, 1, 1, 0),  
                      nrow = 4, byrow = TRUE)
colnames(adj_matrix1) <- rownames(adj_matrix1) <- c("A", "B", "C", "D") 
print("Adjacency Matrix Representation (Network 1):") 
print(adj_matrix1) 

graph_matrix1 <- graph_from_adjacency_matrix(adj_matrix1, mode = "undirected") 
plot(graph_matrix1, main = "Network 1 as Adjacency Matrix")



# 2. Network as an Edge List 
edge_list2 <- data.frame(from = c("E", "E", "F", "F", "G", "G", "H"), 
                         to = c("F", "G", "G", "H", "H", "F", "G")) 
print("Edge List Representation (Network 2):") 
print(edge_list2) 

graph_edge_list2 <- graph_from_data_frame(edge_list2, directed = FALSE) 
plot(graph_edge_list2, main = "Network 2 as Edge List")



# 3. Network as a Sociogram (Graph Representation) 
nodes3 <- data.frame(name = c("I", "J", "K", "L")) 
relations3 <- data.frame(from = c("I", "I", "J", "J", "K", "L"), 
                         to = c("J", "K", "K", "L", "L", "I")) 
graph_sociogram3 <- graph_from_data_frame(relations3, vertices = nodes3, directed=FALSE) 
plot(graph_sociogram3, main = "Network 3 as Sociogram") 
