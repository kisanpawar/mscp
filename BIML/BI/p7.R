# Demonstrate page ranking with an appropriate application

library(igraph)
pages<- c("Page1", "Page2", "Page3", "Page4", "Page5")
links<- c("Page1", "Page2", "Page1", "Page3", "Page2", "Page3", "Page4", 
          "Page3", "Page5")
links
graph <-graph(edges = links, directed=TRUE) 
graph
# pagerank<-(graph)$vector
pagerank <- page.rank(graph)$vector
pagerank
plot(graph, layout = layout_nicely(graph), edge.arrow.size = 0.5) 
pagerank_df <- data.frame(Page = names(pagerank), PageRank = pagerank) 
pagerank_df
pagerank_df <- pagerank_df[order(pagerank_df$PageRank, decreasing = TRUE), ] 
print(pagerank_df)





# Create a simple directed graph with edges representing hyperlinks
edges <- c("A", "B", "B", "C", "C", "A", "C", "D", "D", "E", "E", "C")

# Create the graph object
g <- graph(edges, directed = TRUE)
g

# Plot the graph to visualize the structure
plot(g, vertex.size = 30, vertex.label.cex = 1.5, main = "Simple Directed Webpage Graph")
# plot(g)

# Compute PageRank for the graph
pagerank_result <- page.rank(g)
pagerank_result

# Display the PageRank values
cat("PageRank values for each node (webpage):\n")
print(pagerank_result$vector)

