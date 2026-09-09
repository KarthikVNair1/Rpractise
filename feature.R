data(mtcars)
print("The first six records of the dataset:")
head(mtcars)
x<-mtcars$mpg
y<-mtcars$hp

var_x=var(x)
var_y=var(y)

covariance=cov(x,y)
correlation=cor(x,y)

cat("Variance of x:",var_x,"\n")
cat("Variance of y:",var_y,"\n")
cat("covariance:",covariance,"\n")
cat("correlation:",correlation)
