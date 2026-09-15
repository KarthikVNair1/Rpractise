# Program 5: Variance, Covariance and Correlation
# Create sample data
data <- data.frame(
  X = c(1, 2, 3, 4, 5, 6, 7, 8, 9, 10),
  Y = c(2, 4, 5, 4, 6, 8, 7, 9, 10, 11),
  Z = c(1, 3, 2, 4, 3, 5, 6, 7, 8, 9)
)

cat("=== VARIANCE, COVARIANCE & CORRELATION ANALYSIS ===\n\n")

cat("Data:\n")
print(data)

cat("\n\nVariance:\n")
cat("Var(X) =", var(data$X), "\n")
cat("Var(Y) =", var(data$Y), "\n")
cat("Var(Z) =", var(data$Z), "\n")

cat("\n\nCovariance Matrix:\n")
print(cov(data))

cat("\n\nCorrelation Matrix:\n")
print(cor(data))

cat("\n\nPairwise Correlations:\n")
cat("Cor(X,Y) =", cor(data$X, data$Y), "\n")
cat("Cor(X,Z) =", cor(data$X, data$Z), "\n")
cat("Cor(Y,Z) =", cor(data$Y, data$Z), "\n")
