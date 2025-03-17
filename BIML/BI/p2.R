# Write a program to implement step-by-step a Collaborative Filtering Recommender  System.

user_item_matrix <- matrix(c(5, 3, 0, 1,
                             4, 0, 0, 1,
                             1, 1, 0, 5,
                             0, 1, 5, 4,
                             0, 1, 4, 0),
                           nrow = 5, 
                           byrow = TRUE)


user_item_matrix

cosine_similarity <- function(vec1, vec2) { 
  dot_prod <- sum(vec1 * vec2)
  magnitude <- sqrt(sum(vec1^2) * sum(vec2^2))
  if (magnitude == 0) return(0) # to handle cases where denominator is zero 
  return(dot_prod / magnitude)
}

find_similar_users <- function(user_id, user_item_matrix) { 
  similarities <- numeric()
  for (i in 1:nrow(user_item_matrix)) { 
    if (i != user_id) {
      similarities <- c(similarities, cosine_similarity(user_item_matrix[user_id, ], user_item_matrix[i, ]))
    }
  }
  similar_users <- which(similarities == max(similarities)) 
  return(similar_users)
}

recommend_items <- function(user_id, user_item_matrix, similar_users, num_recommendations) {
  recommendations <- numeric()
  for (item_id in 1:ncol(user_item_matrix)) {
    if (user_item_matrix[user_id, item_id] == 0) { 
      item_score <- 0
      for (similar_user in similar_users) {
        item_score <- item_score + user_item_matrix[similar_user, item_id]
      }
      recommendations <- c(recommendations, item_score)
    } else {
      recommendations <- c(recommendations, -1) # to indicate already rated items
    }
  }
  recommended_items <- order(recommendations, decreasing = TRUE)[1:num_recommendations]
  return(recommended_items)
}

user_id <- 1
num_recommendations <- 2
similar_users <- find_similar_users(user_id, user_item_matrix)
similar_users
recommended_items <- recommend_items(user_id, user_item_matrix, similar_users, num_recommendations)
recommended_items
print(paste("Recommended items for user", user_id, ": ", recommended_items))

# print("Recommended items for user", user_id, ": ", recommended_items)
# print(recommended_items)




















# Step 1: Create a simulated user-item rating matrix
ratings <- matrix(c(5, NA, 4, 2, NA, 
                    3, 1, NA, 5, 4, 
                    1, NA, 5, 4, 3, 
                    NA, 4, 2, 3, 4), 
                  nrow=4, byrow=TRUE)
colnames(ratings) <- c("Item1", "Item2", "Item3", "Item4", "Item5")
rownames(ratings) <- c("User1", "User2", "User3", "User4")

# Print the ratings matrix
print(ratings)

# Step 2: Function to calculate cosine similarity between two users
cosine_similarity <- function(user1, user2) {
  # Remove NAs for calculation (we only compare ratings where both users have rated the item)
  common_ratings <- !is.na(user1) & !is.na(user2)
  
  if (sum(common_ratings) == 0) {
    return(0)  # No common ratings, similarity is 0
  }
  
  # Compute cosine similarity
  numerator <- sum(user1[common_ratings] * user2[common_ratings])
  denominator <- sqrt(sum(user1[common_ratings]^2) * sum(user2[common_ratings]^2))
  
  return(numerator / denominator)
}

# Step 3: Calculate similarity between all pairs of users
user_similarity <- matrix(NA, nrow = nrow(ratings), ncol = nrow(ratings))
for (i in 1:nrow(ratings)) {
  for (j in 1:nrow(ratings)) {
    if (i != j) {
      user_similarity[i, j] <- cosine_similarity(ratings[i,], ratings[j,])
    }
  }
}
rownames(user_similarity) <- colnames(user_similarity) <- rownames(ratings)

# Print the user similarity matrix
print(user_similarity)

# Step 4: Function to generate recommendations for a user
recommend_items <- function(user, ratings, user_similarity, top_n=3) {
  # Get the similarity scores for the target user
  user_similarities <- user_similarity[user, ]
  
  # We do not want to recommend items that the user has already rated
  rated_items <- !is.na(ratings[user, ])
  
  # Calculate weighted ratings from similar users
  weighted_ratings <- rep(0, ncol(ratings))
  for (i in 1:ncol(ratings)) {
    if (!rated_items[i]) {  # If the user has not rated this item
      # Compute the weighted sum of ratings from other users
      weighted_ratings[i] <- sum(user_similarities * ratings[, i], na.rm = TRUE) / sum(user_similarities)
    }
  }
  
  # Get the top N recommendations (highest weighted ratings)
  recommended_items <- order(weighted_ratings, decreasing = TRUE)[1:top_n]
  return(colnames(ratings)[recommended_items])
}

# Step 5: Generate recommendations for User1
recommended_items <- recommend_items(user = "User1", ratings = ratings, user_similarity = user_similarity, top_n = 3)

# Print recommended items for User1
print(recommended_items)
