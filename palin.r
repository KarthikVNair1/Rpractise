fact=function(num){
if (num==0||num==1){
return(1)
}else{
return(num*fact(num-1))
}}

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
result=fact(num)
cat("Factorial:",result,'\n')
palin(num)
