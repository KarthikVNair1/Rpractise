print("enter the numbers")
a<-as.numeric(readLines(con="stdin",n=1))
b<-as.numeric(readLines(con="stdin",n=1))
c<-as.numeric(readLines(con="stdin",n=1))

if(a>b&&a>c)
{
cat(a,"is the largest")
}else if(b>a&&b>c){
cat(b,"is the largest")
}else if(c>a&&c>b){
cat(c,"is the largest")
}else{
cat("All of them are equal")
}
