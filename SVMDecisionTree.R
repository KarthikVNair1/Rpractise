# Load required libraries
library(e1071) # For SVM
library(rpart) # For Decision Tree
library(caret) # For data splitting and evaluation
# Load the iris dataset
data(iris)
# Split dataset into Training (70%) and Testing (30%)
set.seed(123)
trainIndex <- createDataPartition(iris$Species, p = 0.7, list = FALSE)
trainData <- iris[trainIndex, ]
testData <- iris[-trainIndex, ]
# -----------------------------
# Support Vector Machine (SVM)
# -----------------------------
svm_model <-svm(Species ~ ., data = trainData, kernel = "linear")
# Prediction
svm_pred <- predict(svm_model, testData)
# Confusion Matrix
cat("SVM Confusion Matrix:\n")
print(confusionMatrix(svm_pred, testData$Species))
# -----------------------------
# Decision Tree Classifier
# -----------------------------
tree_model <- rpart(Species ~ ., data = trainData, method = "class")
# Prediction
tree_pred <- predict(tree_model, testData, type = "class")
# Confusion Matrix
cat("\nDecision Tree Confusion Matrix:\n")
print(confusionMatrix(tree_pred, testData$Species))
# Plot Decision Tree
plot(tree_model)
text(tree_model, use.n = TRUE, cex = 0.8)
