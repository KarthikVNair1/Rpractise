# Load required libraries
library(class)    # For KNN
library(e1071)    # For Naive Bayes
library(caret)    # For data splitting and evaluation

# Load the Iris dataset
data(iris)

# Split dataset into Training (70%) and Testing (30%)
set.seed(123)
trainIndex <- createDataPartition(iris$Species, p = 0.7, list = FALSE)

trainData <- iris[trainIndex, ]
testData <- iris[-trainIndex, ]

# --------------------------

# K-Nearest Neighbors (KNN)

# --------------------------

# Normalize the feature values
normalize <- function(x) {
  (x - min(x)) / (max(x) - min(x))
}

trainX <- as.data.frame(lapply(trainData[,1:4], normalize))

testX <- as.data.frame(lapply(testData[,1:4], normalize))

trainY <- trainData$Species

testY <- testData$Species

# Train and Predict using KNN (k = 3)
knn_pred <- knn(train = trainX,
                test = testX,
                cl = trainY,
                k = 3)

cat("KNN Confusion Matrix:\n")
print(confusionMatrix(knn_pred, testY))

# --------------------------

# Naive Bayes Classifier

# --------------------------

nb_model <- naiveBayes(Species ~ ., data = trainData)

nb_pred <- predict(nb_model, testData)

cat("\nNaive Bayes Confusion Matrix:\n")
print(confusionMatrix(nb_pred, testY))
