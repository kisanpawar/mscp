# Find “factions” in the network using two-mode faction analysis. 

library(bipartite)  
library(igraph)  

adj_matrix <- matrix( 
  c(1, 1, 1, 0,  
    1, 1, 0, 1,  
    1, 0, 1, 1,  
    0, 1, 1, 1),  
  nrow = 4, ncol = 4, byrow = TRUE)  

rownames(adj_matrix) <- c("Person1", "Person2", "Person3", "Person4")  
colnames(adj_matrix) <- c("Event1", "Event2", "Event3", "Event4")  

print(adj_matrix)

bipartite_graph <- graph_from_incidence_matrix(adj_matrix) 
plot(bipartite_graph, main="Bipartite Network", vertex.size=30) 

bipartite_community <- cluster_spinglass(bipartite_graph) 
plot(bipartite_community, bipartite_graph, 
     main = "Two-Mode Network with Factions", 
     vertex.color = bipartite_community$membership + 1, vertex.size = 30)


factions <- bipartite_community$membership 
print(factions) 