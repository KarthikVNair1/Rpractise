cat("Enter rows and columns of first matrix (e.g., 2 2): \n")
d1 <- scan(file = "stdin", n = 2, what = integer(), quiet = TRUE)

cat("Enter elements: \n")
element1 <- scan(file = "stdin", n = d1[1] * d1[2], what = numeric(), quiet = TRUE)
mat1 <- matrix(element1, nrow = d1[1], ncol = d1[2], byrow = TRUE)

cat("Enter rows and columns of second matrix (e.g., 2 2): \n")
d2 <- scan(file = "stdin", n = 2, what = integer(), quiet = TRUE)

cat("Enter elements: \n")
element2 <- scan(file = "stdin", n = d2[1] * d2[2], what = numeric(), quiet = TRUE)
mat2 <- matrix(element2, nrow = d2[1], ncol = d2[2], byrow = TRUE)

# Check dimensions for Addition and Subtraction
if (all(d1 == d2)) {
  cat("\nAddition:\n")
  print(mat1 + mat2)
  
  cat("\nSubtraction:\n")
  print(mat1 - mat2)
} else {
  cat("\nCannot perform Addition/Subtraction: Matrix dimensions must be identical.\n")
}

# Check dimensions for Matrix Multiplication
if (d1[2] == d2[1]) {
  cat("\nMultiplication:\n")
  print(mat1 %*% mat2)
} else {
  cat("\nCannot perform Multiplication: Columns of Matrix 1 must equal Rows of Matrix 2.\n")
}

cat("\nEnter order of square matrix (e.g., 2 for 2x2): \n")
d <- scan(file = "stdin", n = 1, what = integer(), quiet = TRUE)

cat("Enter elements: \n")
element <- scan(file = "stdin", n = d * d, what = numeric(), quiet = TRUE)
mat3 <- matrix(element, nrow = d, ncol = d, byrow = TRUE)

cat("\nTranspose:\n")
print(t(mat3))

cat("\nInverse:\n")
# Use tryCatch to prevent crashing if the matrix is singular
tryCatch({
  print(solve(mat3))
}, error = function(e) {
  cat("Cannot calculate inverse: This is a singular matrix (determinant is 0).\n")
})
