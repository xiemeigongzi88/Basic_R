2 Simple manipulations; numbers and vectors 

page 13 

2.1 Vectors and assignment 
 
> x<-c(10.4,5.6,3.1,6.4,21.7)
> 1/x
[1] 0.09615385 0.17857143 0.32258065 0.15625000 0.04608295

> y<-c(x,0,x)
> y
 [1] 10.4  5.6  3.1  6.4 21.7  0.0 10.4  5.6  3.1  6.4 21.7
 
#####################################

2.2 Vector arithmetic 

> v<-2*x+y+1
Warning message:
In 2 * x + y :
  longer object length is not a multiple of shorter object length
> v
 [1] 32.2 17.8 10.3 20.2 66.1 21.8 22.6 12.8 16.9 50.8 43.5
 
range()

length()

max()

min()

mean()

sum() 

prod() 

sort()

pmax()
pmin()

> a<-c(1,2,3,4,5,6)
> range(a)
[1] 1 6
> length(a)
[1] 6
> sum(a)
[1] 21
> mean(a)
[1] 3.5

> prod(a) # product of items 
[1] 720

> sort(a)
[1] 1 2 3 4 5 6


> b<-c(9,8,7,6,5,4)
> sort(b)
[1] 4 5 6 7 8 9

> pmin(1:5,pi)
[1] 1.000000 2.000000 3.000000 3.141593 3.141593


2.3 Generating regular sequence 
page 14 

two parameters to seq() may be named by=value and length=value, which specify a step size and a length for the sequence respectively, 

> s<-seq(-5,6,by=0.2)
> s
 [1] -5.0 -4.8 -4.6 -4.4 -4.2 -4.0 -3.8 -3.6 -3.4 -3.2 -3.0 -2.8
[13] -2.6 -2.4 -2.2 -2.0 -1.8 -1.6 -1.4 -1.2 -1.0 -0.8 -0.6 -0.4
[25] -0.2  0.0  0.2  0.4  0.6  0.8  1.0  1.2  1.4  1.6  1.8  2.0
[37]  2.2  2.4  2.6  2.8  3.0  3.2  3.4  3.6  3.8  4.0  4.2  4.4
[49]  4.6  4.8  5.0  5.2  5.4  5.6  5.8  6.0
> s1<-seq(from=-5,by=0.2,length=51)
> s1
 [1] -5.0 -4.8 -4.6 -4.4 -4.2 -4.0 -3.8 -3.6 -3.4 -3.2 -3.0 -2.8
[13] -2.6 -2.4 -2.2 -2.0 -1.8 -1.6 -1.4 -1.2 -1.0 -0.8 -0.6 -0.4
[25] -0.2  0.0  0.2  0.4  0.6  0.8  1.0  1.2  1.4  1.6  1.8  2.0
[37]  2.2  2.4  2.6  2.8  3.0  3.2  3.4  3.6  3.8  4.0  4.2  4.4
[49]  4.6  4.8  5.0


> s2<-seq(0,10,length.out=15)
> s2
 [1]  0.0000000  0.7142857  1.4285714  2.1428571  2.8571429
 [6]  3.5714286  4.2857143  5.0000000  5.7142857  6.4285714
[11]  7.1428571  7.8571429  8.5714286  9.2857143 10.0000000


> x<-c(1,2,3,4)
> s3<-rep(x,times=5)
> s3
 [1] 1 2 3 4 1 2 3 4 1 2 3 4 1 2 3 4 1 2 3 4
> s4<-replicate(5,x)
> s4
     [,1] [,2] [,3] [,4] [,5]
[1,]    1    1    1    1    1
[2,]    2    2    2    2    2
[3,]    3    3    3    3    3
[4,]    4    4    4    4    4


> s5<-rep(x,each=5)
> s5
 [1] 1 1 1 1 1 2 2 2 2 2 3 3 3 3 3 4 4 4 4 4
 

 
 
2.4 Logical vector 
page 15 
 
TRUE FALSE NA 
<
<=
>
>=
!=
==

and c1&c2 
or c1|c2 
!c1 : negation of C1 


2.5 Missing values
page 15 

> z<-c(1:3,NA)
> ind<-is.na(z)
> z
[1]  1  2  3 NA
> ind
[1] FALSE FALSE FALSE  TRUE


2.6 Character vector

> labs<-paste(c("X","Y"),1:10,sep = ' ')
> labs
 [1] "X 1"  "Y 2"  "X 3"  "Y 4"  "X 5"  "Y 6"  "X 7"  "Y 8" 
 [9] "X 9"  "Y 10"
> typeof(labs)
[1] "character"
> class(labs)
[1] "character"


> a<-paste(c('A','B','C'),1:9,sep='')
> a
[1] "A1" "B2" "C3" "A4" "B5" "C6" "A7" "B8" "C9"



2.7 Index vectors 
selecting and modifying subsets of a data set 

page 16 

such index vector can be any of four distinct types  

1. A logical vector 

values corresponding to TRUE in the index vector are selected and those corresponding to FALSE are omitted 

y<-x[!is.na(x)]


Note that if x has missing values, y will be shorter than x 

> x<-c(-1,-2,-3,0,1,2,3)
> x>0
[1] FALSE FALSE FALSE FALSE  TRUE  TRUE  TRUE
> z<-(x+1)[(!is.na(x))&x>0] 
#Note compute this from right to left 
> z
[1] 2 3 4



2. A vector of positive integral quantities 
> a<-rep(c(1,2,2,1),times=4)
> a
 [1] 1 2 2 1 1 2 2 1 1 2 2 1 1 2 2 1
> c('x','y')[a]
 [1] "x" "y" "y" "x" "x" "y" "y" "x" "x" "y" "y" "x" "x" "y" "y"
[16] "x

x[1:10]



3. a vector of negative integral quantities 
> a<-c(1,2,3,4,5,6)
> b<-a[-(1:3)]
> b
[1] 4 5 6



4. a vector of character strings 

> fruit<-c(5,10,1,20)
> names(fruit)<-c('orange','banana','apple','peach')
> lunch<-fruit[c('apple','orange')]
> lunch
 apple orange 
     1      5 
	 
	
2.8 Other types of objects 

	 





 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 