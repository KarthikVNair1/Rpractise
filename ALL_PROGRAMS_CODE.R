# PROGRAM 1: FACTORIAL OF A NUMBER
fact=function(num){
if (num==0||num==1){
return(1)
}else{
return(num*fact(num-1))
}}

cat("Enter a Number:")
num<-readLines(con="stdin",n=1)
num=as.numeric(num)
print(num)
result=fact(num)
cat("Factorial:",result,'\n')

# ======================================================

# PROGRAM 2: PALINDROME CHECKER
palin<-function(result){
og<-result
rev<-0
while(result>0){
a<-result%%10
rev<-(rev*10)+a
result<-result%/%10
}
if(og==rev){
cat("It is a pallindrome\n")
}else{cat("It is not a pallindrome\n")}
}

cat("Enter a Number:")
num<-readLines(con="stdin",n=1)
num=as.numeric(num)
print(num)
palin(num)

# ======================================================

# PROGRAM 3: LINEAR REGRESSION
data(mtcars)
model=lm(mpg~wt,data=mtcars)

print(summary(model))


newcars<-data.frame(wt=c(0.2,0.3,0.5))
predicted=predict(model,newdata=newcars)
results=data.frame(weight1000lbs=newcars$wt,PREDICTED_MG=predicted)

print(results)

plot(
	mtcars$wt,mtcars$mpg,
	main="MPG VS WEIGHT",
	xlab="MPG",
	ylab="WEIGHT",
	pch=14,
	col="blue"
	)

#REGRESSION
abline(model,col="red",lwd=2)

# ======================================================

# PROGRAM 4: LOGISTIC REGRESSION
data<-read.csv("student_data.csv")
print(data)
model<-glm(Result ~ Hours,data=data,family=binomial)

cat("Logistic Regression Model Summary:\n")
print(summary(model))
new_data<-data.frame(Hours=5.5)

probability<-predict(model,new_data,type="response")

cat("\n Predicted Probability of passing:",probability,"\n")

prediction<-ifelse(probability>=0.5,1,0)

cat("Predicted Class(0=Fail,1=Pass):",prediction,"\n")

class<-ifelse(prediction==1,"Pass","Fail")
cat("Final Prediction:",class,"\n")

# ======================================================

# PROGRAM 5: VARIANCE, COVARIANCE AND CORRELATION
data(mtcars)

# Selecting relevant columns
data_subset <- mtcars[, c("mpg", "wt", "hp")]

cat("Variance:\n")
print(var(data_subset))

cat("\n\nCovariance Matrix:\n")
print(cov(data_subset))

cat("\n\nCorrelation Matrix:\n")
print(cor(data_subset))
