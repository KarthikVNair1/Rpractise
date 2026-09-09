print("Enter : ")
d<-readLines(con="stdin",n=1)
n<-as.numeric(d)
temp<-n
rev<-0

while(temp>0){
digit<-temp%%10
rev<-rev*10+digit
temp<-temp%/%10


}

if(rev==n)
{
cat("palindrome")
}else
{cat("not palindrome")}
