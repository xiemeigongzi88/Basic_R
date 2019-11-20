# R语言入门雨实践 

# 1  R基础
# page 

die<-1:6
print(die)

die*die

print(die+1:2)
# 1 2 3 4 5 6 
# 1 2 1 2 1 2
# 2 4 4 6 6 8 

print(die%*% die)

print(die%o%die)

sample(1:4,2,replace = TRUE)

sample(1:6,6,replace = TRUE)

sample(x=1:10,size=4,replace = TRUE)

args(round)
#function (x, digits = 0) 
# NULL

my_function<-function()
{
  dice<-sample(die,size=2,replace = TRUE)
  
  print(dice)
 # print(sum(dice))
}

#my_function()

roll<-function(bones)
{
  dice<-sample(bones,size=3,replace=TRUE)
  print(dice)
}

roll(bones=1:6)

roll(1:4)


# 2 R包与帮助文档  page 40 
install.packages("ggplot2")
library("ggplot2")
x<-c(-1,-0.8,-0.6,-0.4,-0.2,0,0.2,0.4,0.6,0.8,1)
y<-x^3
qplot(x,y)

x<-c(1,2,2,2,3,3)
args(qplot)
qplot(x, binwidth=1)


roll2<-function()
{
  die<-1:6
  dice<-sample(die,size=2,replace = TRUE)
  sum(dice)
  #print(sum(dice))
}

replicate(3,1+1) # 3 times 
replicate(10,roll2())


# 在 sample() 中设置prob 参数 包含权重 的做法 

roll3<-function()
{
  die<-1:6
  dice<-sample(die,size=2,replace=TRUE,
               prob = c(1/8,1/8,1/8,1/8,1/8,3/8))
  sum(dice)
}

test<-replicate(1000000,roll3())
hist(test)  # not the normal distribution 

rolls<-function()
{
  die<c(1:6)
  dice<-sample(die,size=1,replace=TRUE)
  sum(dice)
}

test_1=replicate(10000,rolls())
hist(test_1)


##################################################

#3 R对象 page 55 
die<-c(1:6)
is.vector(die)


five<-5
is.vector(five) ##TRUE 

typeof(die)

# 属性  dim() name()
die<-c(1:6)
dim(die)
names(die)

names(die)<-c("one","two","three","four","five","six")
names(die)

attributes(die)

names(die)<-c("uno","dos","tres","quatro","cinco","seis")

# delete the names 
names(die)<-NULL

dim(die)<-c(2,3)

dim(die)<-c(3,2)

dim(die)<-c(1,2,3)
print(die)

# matrix 
m<-matrix(die,nrow = 2)

a<-c(1,2,3,4,5,6,7,8)
dim(a)<c(2,4)
matrix_a<-matrix(a,nrow = 4)

m<-matrix(die,nrow = 2,byrow = TRUE)

#array 
ar<-array(c(11:14,21:24,31:34),dim=c(2,2,3))

ar_1<-array(c(11:14,21:28,31:34),dim=c(2,2,3)) # 31:34 没有了


#factor  用来存储分类信息
gender<-factor(c("male","female","female","male"))
typeof(gender)

attributes(gender)

# unclass ： 可以看到 R是如何存储 因子的 
unclass(gender)

a<-c(1,2,2,1)
b<-c("Y","N","N","Y")
table(a,b)


# as.character() 将一个因子强制转化成字符串
as.character(gender)

# 强制转换
sum(c(TRUE,TRUE,FALSE,FALSE))

as.character(1)

as.logical(1)

as.numeric(FALSE)


# list 
lis<-list(100:130,"R",list(TRUE,FALSE))


card<-list("ace","hearts",1)
card


# data.frame
df<-data.frame(face=c("ace","two","six"),
               suit=c("clubs","clubs","clubs"),
               value=c(1,2,3))
df

list(face="ace",suit="hearts",value=1)
c(face="ace",suit="hearts",value="one")


# 4 R的记号体系 
# 重复值
deck[c(1,1),c(1,2,3)]

vec<-c(6,1,3,6,10,5)
vec[1:3]

#extract data which is equal or more than 2 columns
# from data.frame, R will give you a new data frame 
# but just one column, it will be a vector 
# if you still need a data frame type, just drop=FALSE

deck[1:2,1,drop=FALSE]


lst<-list(numbers=c(1,2),logical=TRUE,strings=c("a","b","c"))


a<-c(1,2,3)
sum(a)


# 5 对象改值 page 92 
deck2<-deck

vec<-c(0,0,0,0,0,0)
vec
vec[1]<-1000

vec[c(1,3,5)]<-c(1,1,1)

vec[7]<-10
vec

deck2$new<-1:52
deck2

deck2$new<-NULL
head(deck2)



# %in% 是唯一不进行 一一对比的运算符 
1>2
1>c(0,1,2)
c(1,2,3)==c(3,2,1)

1 %in% c(4,5,6)

c(1,2) %in% c(3,4,5)

c(1,2,3) %in% c(3,4,5)

c(1,2,3,4) %in% c(3,4,5)

deck2$face=="ace"
deck2$value[deck2$face=="ace"]


a<-c(1,2,3)
b<-c(1,2,3)
c<-c(1,2,4)

a==b
b==c
a==b & b==c



c(1,2,3,NA)==NA

vec<-c(1,2,3,NA)
is.na(vec)


# 循环 loop
die<-1:6
# expand.grid   n个向量元素的所有组合  
rolls<- expand.grid(die,die)
head(rolls)

rolls$value<-rolls$Var1 + rolls$Var2
head(rolls)

prob<-c("1"=1/8,"2"=1/8,"3"=1/8,"4"=1/8,"5"=1/8,"6"=3/8)

rolls$Var1
typeof(rolls$Var1)
prob[rolls$Var1]

rolls$pro1<-prob[rolls$Var1]
rolls$pro2<-prob[rolls$Var2]
rolls$prob<-rolls$pro1 * rolls$pro2
head(rolls)

sum(rolls$value*rolls$prob)


for(value in c("My", "first", "for", "loop"))
{
  cat(value,"one run","\n")
}

# create a vector with length of 4 
chars<-vector(length=4)

words<-c("My", "first", "for", "loop")
length(words)

for (i in 1:4)
{
  chars[i]<-words[i]
}

print(chars)

for( i in 1:length(words))
{
  print(words[i])
}


