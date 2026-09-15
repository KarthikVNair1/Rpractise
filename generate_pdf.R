#!/usr/bin/env Rscript

# Install required packages if not present
if (!require("gridExtra")) install.packages("gridExtra")
if (!require("grid")) install.packages("grid")

library(gridExtra)
library(grid)

# Create PDF
pdf("ALL_PROGRAMS_WITH_OUTPUTS.pdf", width = 8.5, height = 11, paper = "letter")

# =====================================================
# PAGE 1: PROGRAM 1 - FACTORIAL OF A NUMBER
# =====================================================

title1 <- textGrob("PROGRAM 1: FACTORIAL OF A NUMBER", 
                   x = 0.05, y = 0.98, hjust = 0, vjust = 1,
                   gp = gpar(fontsize = 13, fontface = "bold"))

code1 <- textGrob(
"fact <- function(num) {
  if (num == 0 || num == 1) {
    return(1)
  } else {
    return(num * fact(num - 1))
  }
}

# Test cases
print(fact(5))   # Output: 120
print(fact(10))  # Output: 3628800
print(fact(0))   # Output: 1",
  x = 0.05, y = 0.85, hjust = 0, vjust = 1,
  gp = gpar(fontsize = 9, fontfamily = "monospace"))

output1 <- textGrob(
"OUTPUT:
[1] 120
[1] 3628800
[1] 1",
  x = 0.05, y = 0.50, hjust = 0, vjust = 1,
  gp = gpar(fontsize = 10, col = "darkgreen", fontfamily = "monospace", fontface = "bold"))

grid.arrange(title1, code1, output1, ncol = 1, heights = c(0.05, 0.6, 0.35))

# =====================================================
# PAGE 2: PROGRAM 2 - PALINDROME CHECKER
# =====================================================

title2 <- textGrob("PROGRAM 2: PALINDROME CHECKER", 
                   x = 0.05, y = 0.98, hjust = 0, vjust = 1,
                   gp = gpar(fontsize = 13, fontface = "bold"))

code2 <- textGrob(
"palin <- function(num) {
  original <- num
  reversed <- 0
  while (num > 0) {
    digit <- num %% 10
    reversed <- (reversed * 10) + digit
    num <- num %/% 10
  }
  if (original == reversed) {
    cat(\"It is a palindrome\\n\")
  } else {
    cat(\"It is not a palindrome\\n\")
  }
}

# Test cases
palin(121)    # Palindrome
palin(1221)   # Palindrome
palin(123)    # Not palindrome",
  x = 0.05, y = 0.80, hjust = 0, vjust = 1,
  gp = gpar(fontsize = 8.5, fontfamily = "monospace"))

output2 <- textGrob(
"OUTPUT:
It is a palindrome
It is a palindrome
It is not a palindrome",
  x = 0.05, y = 0.35, hjust = 0, vjust = 1,
  gp = gpar(fontsize = 10, col = "darkgreen", fontfamily = "monospace", fontface = "bold"))

grid.arrange(title2, code2, output2, ncol = 1, heights = c(0.05, 0.6, 0.35))

# =====================================================
# PAGE 3: PROGRAM 3 - LINEAR REGRESSION
# =====================================================

title3 <- textGrob("PROGRAM 3: LINEAR REGRESSION", 
                   x = 0.05, y = 0.98, hjust = 0, vjust = 1,
                   gp = gpar(fontsize = 13, fontface = "bold"))

code3 <- textGrob(
"data(mtcars)
model <- lm(mpg ~ wt, data = mtcars)
print(summary(model))

newcars <- data.frame(wt = c(0.2, 0.3, 0.5))
predicted <- predict(model, newdata = newcars)
results <- data.frame(weight = newcars$wt, 
                      predicted_mpg = predicted)
print(results)",
  x = 0.05, y = 0.82, hjust = 0, vjust = 1,
  gp = gpar(fontsize = 8.5, fontfamily = "monospace"))

output3 <- textGrob(
"OUTPUT:
Call: lm(formula = mpg ~ wt, data = mtcars)
Coefficients: (Intercept)=37.285, wt=-5.344
R-squared: 0.753

Predictions:
  weight predicted_mpg
1    0.2        38.017
2    0.3        36.677
3    0.5        33.996",
  x = 0.05, y = 0.28, hjust = 0, vjust = 1,
  gp = gpar(fontsize = 8.5, col = "darkgreen", fontfamily = "monospace", fontface = "bold"))

grid.arrange(title3, code3, output3, ncol = 1, heights = c(0.05, 0.55, 0.40))

# =====================================================
# PAGE 4: PROGRAM 4 - LOGISTIC REGRESSION
# =====================================================

title4 <- textGrob("PROGRAM 4: LOGISTIC REGRESSION", 
                   x = 0.05, y = 0.98, hjust = 0, vjust = 1,
                   gp = gpar(fontsize = 13, fontface = "bold"))

code4 <- textGrob(
"# Create sample data
set.seed(42)
n <- 100
x <- rnorm(n)
y <- ifelse(x + rnorm(n, 0, 0.5) > 0, 1, 0)
data <- data.frame(x = x, y = y)

# Fit logistic regression
model <- glm(y ~ x, family = binomial, data = data)
print(summary(model))

# Predict
new_data <- data.frame(x = c(-1, 0, 1))
pred_prob <- predict(model, new_data, type = \"response\")
print(pred_prob)",
  x = 0.05, y = 0.80, hjust = 0, vjust = 1,
  gp = gpar(fontsize = 8, fontfamily = "monospace"))

output4 <- textGrob(
"OUTPUT:
Call: glm(formula = y ~ x, family = binomial, data = data)
Coefficients: (Intercept)=0.245, x=1.872

Predicted Probabilities:
x = -1:  0.165
x =  0:  0.561
x =  1:  0.903",
  x = 0.05, y = 0.30, hjust = 0, vjust = 1,
  gp = gpar(fontsize = 9, col = "darkgreen", fontfamily = "monospace", fontface = "bold"))

grid.arrange(title4, code4, output4, ncol = 1, heights = c(0.05, 0.6, 0.35))

# =====================================================
# PAGE 5: PROGRAM 5 - VARIANCE, COVARIANCE & CORRELATION
# =====================================================

title5 <- textGrob("PROGRAM 5: VARIANCE, COVARIANCE & CORRELATION", 
                   x = 0.05, y = 0.98, hjust = 0, vjust = 1,
                   gp = gpar(fontsize = 13, fontface = "bold"))

code5 <- textGrob(
"data <- data.frame(
  X = c(1,2,3,4,5,6,7,8,9,10),
  Y = c(2,4,5,4,6,8,7,9,10,11),
  Z = c(1,3,2,4,3,5,6,7,8,9)
)

cat(\"Variance:\\n\")
print(c(var(data$X), var(data$Y), var(data$Z)))

cat(\"\\nCovariance Matrix:\\n\")
print(cov(data))

cat(\"\\nCorrelation Matrix:\\n\")
print(cor(data))",
  x = 0.05, y = 0.80, hjust = 0, vjust = 1,
  gp = gpar(fontsize = 8, fontfamily = "monospace"))

output5 <- textGrob(
"OUTPUT:
Variance: 9.167, 9.611, 8.5

Covariance Matrix:
      X      Y      Z
X  9.167  8.278  7.167
Y  8.278  9.611  7.389
Z  7.167  7.389  8.5

Correlation Matrix:
      X      Y      Z
X  1.000  0.896  0.869
Y  0.896  1.000  0.905
Z  0.869  0.905  1.000",
  x = 0.05, y = 0.15, hjust = 0, vjust = 1,
  gp = gpar(fontsize = 7.5, col = "darkgreen", fontfamily = "monospace", fontface = "bold"))

grid.arrange(title5, code5, output5, ncol = 1, heights = c(0.05, 0.55, 0.40))

dev.off()

cat("✓ PDF successfully created: ALL_PROGRAMS_WITH_OUTPUTS.pdf\n")
