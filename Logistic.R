data.read.csv("student_data.csv")
print(data)
model<-glm(Result ~ Hours,data=data,family=binomial)

cat("Logistic Regression Model Summary:\n")
print(summary(model))
new_data<-data.frame(Hours=5.5)

probability<-predict(model,new_data,type="response")

cat("\n Predicted Probability of passing:",probability,"\n")

prediction<-ifelse(probability>=0.5,1,0)

cat("Predicted Class(0=Fail,2=Pass):",prediction,"\n")

class<-ifelse(prediciton==1,"Pass","Fail")
cat("Final Prediction:",class,"\n")
