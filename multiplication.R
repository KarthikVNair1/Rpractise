print("Enter the number")

a <- as.numeric(readLines(con="stdin", n=1))

for (i in 1:10) {
  cat(i, "x", a, "=", i*a, "\n")
}
