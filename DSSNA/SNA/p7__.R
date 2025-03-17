# Create sociograms for the persons-by-persons network and the committee-by committee network for a given relevant problem. Create one-mode network and two-node network for the same

# Load the necessary package
library(igraph)

# Create a bipartite network (Example Data)
edges <- data.frame(from = c("Alice", "Bob", "Charlie", "David", "Emma", "Frank"),
                    to = c("Finance", "HR", "Tech", "Marketing", "Finance", "Tech"))
edges

# Create the bipartite graph
g <- graph_from_data_frame(edges, directed = FALSE)
plot(g)

# Assign bipartite types (0 = person, 1 = committee)
V(g)$type <- V(g)$name %in% edges$to

# Create one-mode projections
projections <- bipartite_projection(g)

# Extract committee and persons network
committees_network <- projections$proj2  # Committees-by-Committees
persons_network <- projections$proj1     # Persons-by-Persons

# Plot the one-mode Committee Network
plot(committees_network,  
     vertex.color = "pink",  
     vertex.size = 50,  
     main = "One Mode Committee by Committee Network")

# Plot the one-mode Persons Network
plot(persons_network,  
     vertex.color = "lightblue",  
     vertex.size = 50,  
     main = "One Mode Persons by Persons Network")

# Print the summary of the committee network
print(committees_network)

# Plot the original bipartite graph
plot(g, vertex.color = ifelse(V(g)$type, "red", "blue"), vertex.size = 40, main = "Bipartite Network")
