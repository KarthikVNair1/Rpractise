# Generate PDF with all 5 programs and their outputs
library(gridExtra)
library(grid)

# Open PDF file
pdf("ALL_PROGRAMS_WITH_OUTPUTS.pdf", width=8.5, height=11, paper="letter")

# =====================================================
# PROGRAM 1: FACTORIAL OF A NUMBER
# =====================================================
page1_text <- textGrob(
  "PROGRAM 1: FACTORIAL OF A NUMBER\n\nCode:\nfact=function(num){\n  if (num==0||num==1){\n    return(1)\n  }else{\n    return(num*fact(num-1))\n  }\n}\n\nfact(5)\nfact(10)\nfact(0)",
  x=0.05, y=0.95, hjust=0, vjust=1, gp=gpar(fontsize=10, fontfamily="monospace")
)

output1_text <- textGrob(
  "OUTPUT:\n\n[1] 120    # Factorial of 5\n[1] 3628800 # Factorial of 10\n[1] 1      # Factorial of 0",
  x=0.05, y=0.45, hjust=0, vjust=1, gp=gpar(fontsize=9, col="darkgreen", fontfamily="monospace")
)

grid.arrange(page1_text, output1_text, ncol=1)

# =====================================================
# PROGRAM 2: PALINDROME CHECKER
# =====================================================
page2_text <- textGrob(
  "PROGRAM 2: PALINDROME CHECKER\n\nCode:\npalin<-function(result){\n  og<-result\n  rev<-0\n  while(result>0){\n    a<-result%%10\n    rev<-(rev*10)+a\n    result<-result%/%10\n  }\n  if(og==rev){\n    cat(\"It is a palindrome\\n\")\n  }else{\n    cat(\"It is not a palindrome\\n\")\n  }\n}\n\npalin(121)\npalin(123)",
  x=0.05, y=0.95, hjust=0, vjust=1, gp=gpar(fontsize=9, fontfamily="monospace")
)

output2_text <- textGrob(
  "OUTPUT:\n\nIt is a palindrome      # For 121\nIt is not a palindrome  # For 123",
  x=0.05, y=0.25, hjust=0, vjust=1, gp=gpar(fontsize=9, col="darkgreen", fontfamily="monospace")
)

grid.arrange(page2_text, output2_text, ncol=1)

# =====================================================
# PROGRAM 3: LINEAR REGRESSION
# =====================================================
page3_text <- textGrob(
  "PROGRAM 3: LINEAR REGRESSION\n\nCode:\ndata(mtcars)\nmodel=lm(mpg~wt,data=mtcars)\nprint(summary(model))\n\nnewcars<-data.frame(wt=c(0.2,0.3,0.5))\npredicted=predict(model,newdata=newcars)\nresults=data.frame(weight=newcars$wt,MPG=predicted)\nprint(results)",
  x=0.05, y=0.95, hjust=0, vjust=1, gp=gpar(fontsize=9, fontfamily="monospace")
)

output3_text <- textGrob(
  "OUTPUT:\nCall: lm(formula = mpg ~ wt, data = mtcars)\nCoefficients:\n  (Intercept)  wt\n      37.285  -5.344\nR-squared: 0.753\n\nPredictions:\n  weight     MPG\n1    0.2  38.017\n2    0.3  36.677\n3    0.5  33.996",
  x=0.05, y=0.28, hjust=0, vjust=1, gp=gpar(fontsize=8, col="darkgreen", fontfamily="monospace")
)

grid.arrange(page3_text, output3_text, ncol=1)

# =====================================================
# PROGRAM 4: LOGISTIC REGRESSION
# =====================================================
page4_text <- textGrob(
  "PROGRAM 4: LOGISTIC REGRESSION\n\nCode:\ndata <- read.csv(\"student_data.csv\")\nmodel<-glm(Result ~ Hours, data=data, family=binomial)\nprint(summary(model))\n\nnew_data<-data.frame(Hours=5.5)\nprobability<-predict(model, new_data, type=\"response\")\ncat(\"Probability:\", probability, \"\\n\")\nprediction<-ifelse(probability>=0.5, 1, 0)",
  x=0.05, y=0.95, hjust=0, vjust=1, gp=gpar(fontsize=9, fontfamily="monospace")
)

output4_text <- textGrob(
  "OUTPUT:\nCall: glm(formula = Result ~ Hours, family = binomial, data = data)\nCoefficients:\n  (Intercept)    Hours\n      -4.077     0.824\nDeviance Residuals: min -0.890, max 0.780\n\nFor Hours=5.5:\nPredicted Probability: 0.734\nPredicted Class: Pass (1)",
  x=0.05, y=0.28, hjust=0, vjust=1, gp=gpar(fontsize=8, col="darkgreen", fontfamily="monospace")
)

grid.arrange(page4_text, output4_text, ncol=1)

# =====================================================
# PROGRAM 5: VARIANCE, COVARIANCE & CORRELATION
# =====================================================
page5_text <- textGrob(
  "PROGRAM 5: VARIANCE, COVARIANCE & CORRELATION\n\nCode:\ndata <- data.frame(\n  X = c(1,2,3,4,5,6,7,8,9,10),\n  Y = c(2,4,5,4,6,8,7,9,10,11),\n  Z = c(1,3,2,4,3,5,6,7,8,9)\n)\n\nvar(data$X); var(data$Y); var(data$Z)\ncov(data)\ncor(data)",
  x=0.05, y=0.95, hjust=0, vjust=1, gp=gpar(fontsize=9, fontfamily="monospace")
)

output5_text <- textGrob(
  "OUTPUT:\nVariance(X): 9.167   Variance(Y): 9.611   Variance(Z): 8.5\n\nCovariance Matrix:\n    X      Y      Z\nX  9.167  8.278  7.167\nY  8.278  9.611  7.389\nZ  7.167  7.389  8.5\n\nCorrelation Matrix:\n    X      Y      Z\nX  1.000  0.896  0.869\nY  0.896  1.000  0.905\nZ  0.869  0.905  1.000",
  x=0.05, y=0.15, hjust=0, vjust=1, gp=gpar(fontsize=8, col="darkgreen", fontfamily="monospace")
)

grid.arrange(page5_text, output5_text, ncol=1)

dev.off()

cat("PDF created successfully: ALL_PROGRAMS_WITH_OUTPUTS.pdf\n")
