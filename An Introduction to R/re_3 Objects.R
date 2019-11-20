# 3 Objects their modes and attributes 

# 3.1 Intrinsic attributes: mode and length 
z<-0:9
digits<-as.character(z)
print(digits)

d<-as.integer(digits)
print(d)


# 3.2 Changing the length of an object 
e<-numeric()
e[2]<-8
print(e)


print(2*1:5)
alpha<-numeric()
alpha<-alpha[2*1:5]
# makes it an object of length 5 consisting of just the former 
# components with even index 

print(length(alpha))
print(length(c(1,2,3,NA))) #4 

# we can retain just the first three values by 
length(alpha)<-3  # change the length 
print(length(alpha))

a<-numeric()
a<-a[5]
print(length(a))  #1 


# 3.3 Getting and setting attributes 
z<-0:5
attr(z,"dim")<-c(2,3) 
print(z)
# another way 
a<-0:5
dim(a)<-c(2,3)
print(a)


# 3.4 the class of an object 
unclass()

# supplimentry content 
# http://blog.sciencenet.cn/blog-505988-1086254.html

v<-c("female","female","male","male","female")
x<-factor(v,levels = c("female","male"))
print(x)

table(x)
unclass(x)

print(unclass(x))
class(unclass(x))

