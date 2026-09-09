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
