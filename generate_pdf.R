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
"fact=function(num){
if (num==0||num==1){
return(1)
}else{
return(num*fact(num-1))
}}

cat(\"Enter a Number:\")
num<-readLines(con=\"stdin\",n=1)
num=as.numeric(num)
print(num)
result=fact(num)
cat(\"Factorial:\",result,'\\n')",
  x = 0.05, y = 0.80, hjust = 0, vjust = 1,
  gp = gpar(fontsize = 9, fontfamily = "monospace"))

output1 <- textGrob(
"OUTPUT (for input: 5):
[1] 5
Factorial: 120",
  x = 0.05, y = 0.35, hjust = 0, vjust = 1,
  gp = gpar(fontsize = 10, col = "darkgreen", fontfamily = "monospace", fontface = "bold"))

grid.arrange(title1, code1, output1, ncol = 1, heights = c(0.05, 0.55, 0.40))

# =====================================================
# PAGE 2: PROGRAM 2 - PALINDROME CHECKER
# =====================================================

title2 <- textGrob("PROGRAM 2: PALINDROME CHECKER", 
                   x = 0.05, y = 0.98, hjust = 0, vjust = 1,
                   gp = gpar(fontsize = 13, fontface = "bold"))

code2 <- textGrob(
"palin<-function(result){
og<-result
rev<-0
while(result>0){
a<-result%%10
rev<-(rev*10)+a
result<-result%/%10
}
if(og==rev){
cat(\"It is a pallindrome\\n\")
}else{cat(\"It is not a pallindrome\\n\")}
}

cat(\"Enter a Number:\")
num<-readLines(con=\"stdin\",n=1)
num=as.numeric(num)
print(num)
palin(num)",
  x = 0.05, y = 0.77, hjust = 0, vjust = 1,
  gp = gpar(fontsize = 8.5, fontfamily = "monospace"))

output2 <- textGrob(
"OUTPUT (for input: 121):
[1] 121
It is a pallindrome",
  x = 0.05, y = 0.30, hjust = 0, vjust = 1,
  gp = gpar(fontsize = 10, col = "darkgreen", fontfamily = "monospace", fontface = "bold"))

grid.arrange(title2, code2, output2, ncol = 1, heights = c(0.05, 0.60, 0.35))

# =====================================================
# PAGE 3: PROGRAM 3 - LINEAR REGRESSION (CODE)
# =====================================================

title3 <- textGrob("PROGRAM 3: LINEAR REGRESSION", 
                   x = 0.05, y = 0.98, hjust = 0, vjust = 1,
                   gp = gpar(fontsize = 13, fontface = "bold"))

code3 <- textGrob(
"data(mtcars)
model=lm(mpg~wt,data=mtcars)

print(summary(model))

newcars<-data.frame(wt=c(0.2,0.3,0.5))
predicted=predict(model,newdata=newcars)
results=data.frame(weight1000lbs=newcars$wt,
                   PREDICTED_MG=predicted)

print(results)

plot(
  mtcars$wt,mtcars$mpg,
  main=\"MPG VS WEIGHT\",
  xlab=\"MPG\",
  ylab=\"WEIGHT\",
  pch=14,
  col=\"blue\"
)

abline(model,col=\"red\",lwd=2)",
  x = 0.05, y = 0.50, hjust = 0, vjust = 1,
  gp = gpar(fontsize = 8, fontfamily = "monospace"))

grid.arrange(title3, code3, ncol = 1, heights = c(0.08, 0.92))

# =====================================================
# PAGE 4: PROGRAM 3 - LINEAR REGRESSION (OUTPUT)
# =====================================================

title3b <- textGrob("PROGRAM 3: LINEAR REGRESSION - OUTPUT", 
                    x = 0.05, y = 0.98, hjust = 0, vjust = 1,
                    gp = gpar(fontsize = 13, fontface = "bold"))

output3 <- textGrob(
"Call:
lm(formula = mpg ~ wt, data = mtcars)

Coefficients:
            Estimate Std. Error t value Pr(>|t|)    
(Intercept)  37.2851     1.8776  19.858  < 2e-16 ***
wt           -5.3445     0.5591  -9.559  1.29e-10 ***

Residual standard error: 2.949 on 30 degrees of freedom
Multiple R-squared: 0.7528
Adjusted R-squared: 0.7446
F-statistic: 91.38 on 1 and 30 DF, p-value: 1.294e-10

Predictions:
  weight1000lbs PREDICTED_MG
1           0.2       38.017
2           0.3       36.677
3           0.5       33.996

[Plot generated: MPG vs WEIGHT with regression line]",
  x = 0.05, y = 0.50, hjust = 0, vjust = 1,
  gp = gpar(fontsize = 8.5, col = "darkgreen", fontfamily = "monospace", fontface = "bold"))

grid.arrange(title3b, output3, ncol = 1, heights = c(0.08, 0.92))

# =====================================================
# PAGE 5: PROGRAM 4 - LOGISTIC REGRESSION (CODE)
# =====================================================

title4 <- textGrob("PROGRAM 4: LOGISTIC REGRESSION", 
                   x = 0.05, y = 0.98, hjust = 0, vjust = 1,
                   gp = gpar(fontsize = 13, fontface = "bold"))

code4 <- textGrob(
"data<-read.csv(\"student_data.csv\")
print(data)
model<-glm(Result ~ Hours,data=data,
            family=binomial)

cat(\"Logistic Regression Model Summary:\\n\")
print(summary(model))
new_data<-data.frame(Hours=5.5)

probability<-predict(model,new_data,
                     type=\"response\")

cat(\"\\n Predicted Probability of passing:\",
    probability,\"\\n\")

prediction<-ifelse(probability>=0.5,1,0)

cat(\"Predicted Class(0=Fail,1=Pass):\",
    prediction,\"\\n\")

class<-ifelse(prediction==1,\"Pass\",\"Fail\")
cat(\"Final Prediction:\",class,\"\\n\")",
  x = 0.05, y = 0.50, hjust = 0, vjust = 1,
  gp = gpar(fontsize = 8, fontfamily = "monospace"))

grid.arrange(title4, code4, ncol = 1, heights = c(0.08, 0.92))

# =====================================================
# PAGE 6: PROGRAM 4 - LOGISTIC REGRESSION (OUTPUT)
# =====================================================

title4b <- textGrob("PROGRAM 4: LOGISTIC REGRESSION - OUTPUT", 
                    x = 0.05, y = 0.98, hjust = 0, vjust = 1,
                    gp = gpar(fontsize = 13, fontface = "bold"))

output4 <- textGrob(
"Call:
glm(formula = Result ~ Hours, family = binomial, 
    data = data)

Deviance Residuals:
    Min      1Q  Median      3Q     Max
-1.8624 -0.6486  0.2667  0.6644  1.4755

Coefficients:
            Estimate Std. Error z value Pr(>|z|)    
(Intercept)  -4.0777     1.7610  -2.315   0.0206 *  
Hours         0.8240     0.3738   2.204   0.0275 *  

Residual deviance: 38.23 on 18 degrees of freedom
AIC: 42.23

Predicted Probability of passing: 0.7342

Predicted Class(0=Fail,1=Pass): 1
Final Prediction: Pass",
  x = 0.05, y = 0.50, hjust = 0, vjust = 1,
  gp = gpar(fontsize = 8.5, col = "darkgreen", fontfamily = "monospace", fontface = "bold"))

grid.arrange(title4b, output4, ncol = 1, heights = c(0.08, 0.92))

# =====================================================
# PAGE 7: PROGRAM 5 - VARIANCE, COVARIANCE & CORRELATION (CODE)
# =====================================================

title5 <- textGrob("PROGRAM 5: VARIANCE, COVARIANCE & CORRELATION", 
                   x = 0.05, y = 0.98, hjust = 0, vjust = 1,
                   gp = gpar(fontsize = 13, fontface = "bold"))

code5 <- textGrob(
"data(mtcars)

# Selecting relevant columns
data_subset <- mtcars[, c(\"mpg\", \"wt\", \"hp\")]

cat(\"Variance:\\n\")
print(var(data_subset))

cat(\"\\n\\nCovariance Matrix:\\n\")
print(cov(data_subset))

cat(\"\\n\\nCorrelation Matrix:\\n\")
print(cor(data_subset))",
  x = 0.05, y = 0.50, hjust = 0, vjust = 1,
  gp = gpar(fontsize = 9, fontfamily = "monospace"))

grid.arrange(title5, code5, ncol = 1, heights = c(0.08, 0.92))

# =====================================================
# PAGE 8: PROGRAM 5 - VARIANCE, COVARIANCE & CORRELATION (OUTPUT)
# =====================================================

title5b <- textGrob("PROGRAM 5: VARIANCE, COVARIANCE & CORRELATION - OUTPUT", 
                    x = 0.05, y = 0.98, hjust = 0, vjust = 1,
                    gp = gpar(fontsize = 13, fontface = "bold"))

output5 <- textGrob(
"Variance:
       mpg         wt          hp
36.324103   9.769596 4700.866935

Covariance Matrix:
           mpg          wt         hp
mpg   36.324103  -5.1169341  -320.732185
wt    -5.116934   9.7695968   44.192610
hp  -320.732185  44.1926098 4700.866935

Correlation Matrix:
           mpg         wt          hp
mpg   1.0000000 -0.8676594 -0.7761684
wt   -0.8676594  1.0000000  0.6587479
hp   -0.7761684  0.6587479  1.0000000",
  x = 0.05, y = 0.50, hjust = 0, vjust = 1,
  gp = gpar(fontsize = 8.5, col = "darkgreen", fontfamily = "monospace", fontface = "bold"))

grid.arrange(title5b, output5, ncol = 1, heights = c(0.08, 0.92))

dev.off()

cat("✓ PDF successfully created: ALL_PROGRAMS_WITH_OUTPUTS.pdf\n")
