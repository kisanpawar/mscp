# Perform SVD analysis of a network.

library(igraph) 
g <- graph(c(1, 2, 2, 3, 3, 4, 4, 1)) 
adj_matrix <- as_adjacency_matrix(g, sparse = FALSE) 
print(adj_matrix) 

svd_result <- svd(adj_matrix) 
print(svd_result)

U <- svd_result$u
D <- diag(svd_result$d)  # D is a diagonal matrix, created with diag() function 
V <- svd_result$v 

print("U Matrix:") 
print(U) 
print("D Matrix:") 
print(D) 
print("V Matrix:") 
print(V) 

plot(svd_result$d, type = "b", main = "Singular Values", xlab = "Index", ylab = "Singular Value")
