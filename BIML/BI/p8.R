# Develop an application to implement the apriori algorithm
install.packages("arules") 
install.packages("arulesViz") 
library(arules) 
library(arulesViz) 
data("Groceries")
Groceries
rules <- apriori(Groceries,
                 parameter = list(supp = 0.01, conf = 0.5, minlen = 2)) 
inspect(rules[1:10])
plot(rules, method = "scatter", measure = "lift")









# Install and load the necessary packages
# install.packages("arules")
# install.packages("arulesViz")
library(arules)
library(arulesViz)

# Example transactional data
transactions <- list(
  c("Milk", "Bread", "Butter"),
  c("Milk", "Bread"),
  c("Milk", "Bread", "Butter", "Jam"),
  c("Bread", "Butter"),
  c("Milk", "Bread", "Butter"),
  c("Milk", "Bread", "Jam")
)

# Convert the list to transactions object
transaction_data <- as(transactions, "transactions")

# View summary of the transactions
summary(transaction_data)

# Apply the Apriori algorithm
rules <- apriori(transaction_data, 
                 parameter = list(supp = 0.4, conf = 0.7, target = "rules"))

# View the association rules
inspect(rules)

# Sort the rules by lift in decreasing order
sorted_rules <- sort(rules, by = "lift", decreasing = TRUE)

# Inspect the top 5 rules based on lift
inspect(sorted_rules[1:5])

# Plot the rules
plot(sorted_rules[1:5], method = "graph", control = list(type = "items"))

plot(sorted_rules[1:5], method = "scatter", control = list(type = "items"))

