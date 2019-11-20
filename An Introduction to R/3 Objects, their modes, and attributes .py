3 Objects, their modes, and attributes 

3.1 Intrinsic attributes: mode and length 

page 19 

> z<-0:9
> z
 [1] 0 1 2 3 4 5 6 7 8 9
> digits<-as.character(z)
> digits
 [1] "0" "1" "2" "3" "4" "5" "6" "7" "8" "9"
> d<-as.integer(digits)
> d
 [1] 0 1 2 3 4 5 6 7 8 9
 
 
3.2 changing the length of an object 

page 20 

an "empty" object may still have a mode 

> e<-numeric()
> e
numeric(0)

makes e an empty vector structure of mode numberic 

the same as character() 


> e[3]<-18
> e
[1] NA NA 18

scan() function is used to automatic adjustment

if alpha is an object in the first place 

> alpha<-c(1,2,3,4,5,6,7,8,9,10)
> length(alpha)
[1] 10
> alpha<-alpha[2*1:5]
# makes it an object of length 5 consisting of just the former components with even index 
> alpha
[1]  2  4  6  8 10
> length(alpha)
[1] 5

# retain just the first three values by 
> length(alpha)<-3
> alpha
[1] 2 4 6



3.3 Getting and setting attributes 

dim() 
names() 

> x<-c(1,2,3,4,5,6)
> names(x)<-paste(c("A","B"),1:2,sep='')
> x
  A1   B2 <NA> <NA> <NA> <NA> 
   1    2    3    4    5    6 
> names(x)<-paste(c("A","B"),1:6,sep='')
> x
A1 B2 A3 B4 A5 B6 
 1  2  3  4  5  6 
 
 

 > x
     [,1] [,2] [,3]
[1,]    1    3    5
[2,]    2    4    6
> as.numeric(x)
[1] 1 2 3 4 5 6


> x<-c(1,2,3,4,5,6)
> dim(x)<-c(2,3)
> x
     [,1] [,2] [,3]
[1,]    1    3    5
[2,]    2    4    6
> as.numeric(x)
[1] 1 2 3 4 5 6



3.4 The class of an object 
page 20 

