# 2 simple manipulations: numbers and vectors 

# 2.1 Vectors and assignment 
x<-c(10.4,5.6,3.1,6.4,21.7)
print(1/x)

y<-c(x,0,x)
print(y)


# 2.2 Vector arithmetic 
v<-2*x+y+1
print(2*x)
print(2*x+y)
print(2*x+y+1)
print(v)


# 2.3 generating regular sequence 
seq(from=-5,to=5,by=0.5)

seq(-5,5,length.out = 5)

seq(-5,5,length=3)

s4<-seq(length=51,from=-5,by=0.2)

s5<-rep(x, 5)
print(s5)

s6<-rep(x,each=3)
print(s6)


# 2.4 Logical vector 
tmp<-x>13
print(tmp)


# 2.5 Missing Values 
z<-c(1:4,NA)
ind<-is.na(z)
print(ind)

print(0/0) # NaN: not a number 
# is.na(xx) is TRUE both for NA and NaN values 
# is.nan(xx) is only TRUE for NaNs 


# 2.6 Character vectors 
# the paste() function takes an arbitrary number of arguments and concatenates 
# them one by one into character strings 
labs<-paste(c("x","y"),1:10,sep="")
print(labs)


# 2.7 Index vectors: selecting and modifying subsets of a data set 
# 1. a logical vector 





c("x","y")[rep(c(1,2,2,1),times=4)]
a<-rep(c(1,2,2,1),times=4)

c("x","y")[a]

y<-x[-(1:5)]

fruit<-c(5,10,1,20)
names(fruit)<-c("orange","banana","apple","peach")
lunch<-fruit[c("apple","orange")]
print(lunch)


x[is.na(x)]<-0
y[y<0]<- -y[y<0]
y<-abs(y)


# 2.8 other types of objects 
