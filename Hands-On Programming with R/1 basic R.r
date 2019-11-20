1 R 基础 
page 20 

ctrl+c  终止程序 

page 24 
1.2 对象 
> die<-1:6
> die
[1] 1 2 3 4 5 6

命名规范：
（1）. 不能以数字开头 
（2）. 特殊符号不能出现在名称中 ^ ! $ @ + - / * 

R 区分大小写 

查看哪些已经命名的 R 对象 使用 ls()

> a<-1
> b<-1
> c<-1:6
> ls()
[1] "a"   "b"   "c"   "die"


线性函数的 铁杆粉丝 
> die<-1:6
> die-1
[1] 0 1 2 3 4 5
> die/2
[1] 0.5 1.0 1.5 2.0 2.5 3.0
> die*die
[1]  1  4  9 16 25 36 


> die<-1:6
> die
[1] 1 2 3 4 5 6
> die+1:2
[1] 2 4 4 6 6 8
+1 +2 +1 +2 +1 +2 

> die+1:4
[1] 2 4 6 8 6 8
Warning message:
In die + 1:4 :
  longer object length is not a multiple of shorter object length

对于 两个不等长的向量， R 会重复较短的向量以执行元素方式运算 
 如果长向量的长度值 不是短向量长度值得整数倍 返回一个 warning 
 R 的 这种行为称为 向量循环 
 
使用 %*% 运算符执行内乘法  %o% 运算符执行外乘法  

> die<-1:6
> die %*% die
     [,1]
[1,]   91
内乘法：（结果是数值）
1*1+2*2+3*3+4*4+5*5+6*6

外乘法（结果是矩阵）
> die %o% die 
     [,1] [,2] [,3] [,4] [,5] [,6]
[1,]    1    2    3    4    5    6
[2,]    2    4    6    8   10   12
[3,]    3    6    9   12   15   18
[4,]    4    8   12   16   20   24
[5,]    5   10   15   20   25   30
[6,]    6   12   18   24   30   36


使用 命令执行矩阵转置等运算 用 det 命令获取矩阵的行列式 


1.3 函数 
page 29

> round(3.1415)
[1] 3
> factanal((3))
Error in factanal((3)) : 
  factor analysis requires at least three variables
> factorial(3)
[1] 6


> die<-1:6
> round(mean(die))
[1] 4
 
Note： 1+2+3+4+5+6=21/6=3.5 

> mean(1:6)
[1] 3.5
> mean(die)
[1] 3.5
> round(mean(die))
[1] 4

sample 函数 
sample 函数有两个参数： 一个是 x 的向量 
另一个是 size 的数字 
sample 函数的作用： 从向量X中 抽取 size 个元素并返回 

> sample(x=1:6,size=2)
[1] 2 1

> die<-1:6
> sample(x=die,size=1)
[1] 2
> sample(x=die,size=1)
[1] 6
> sample(x=die,size=1)
[1] 1
> sample(die,size=1)
[1] 4

第一个参数 其实也可以不用写 成 x=die  direct die is ok 

查看函数有哪些参数？？？
如：

> args(round)
function (x, digits = 0) 
#round() 函数 本身有个 默认值 digits=0
 
> args(mean)
function (x, ...) 

> round(3.1415,digits=2)
[1] 3.14

详细的写出参数名称可以防止 使用函数的参数顺序不一致的情况 

> die<-1:6
> sample(size=1,x=die)
[1] 3



1.4 可放回抽样 
page 31 

sample 函数在抽样的时候 默认使用 不可放回抽样 （without replacement）
sample 函数 + 参数 replace=TRUE 可以实现 

> sample(die,size=2,replace=TRUE)
[1] 1 6

可放回抽样是 创建独立随机样本 （independent random sample）
的一种简单方法   样本中的数值是相互独立的 

> dice<-sample(die,size=2,replace=TRUE)
> dice
[1] 3 5
> sum(dice)
[1] 8

后面重复调用 dice 
> dice
[1] 3 5
> dice
[1] 3 5
> dice
[1] 3 5

发现 dice 不用发生变化 这个是因为 R 并不会重新运行 sample 函数了 


1.5 编写自定义函数 
page 33 

> die<-1:6 
> dice<-sample(die,size=2,replace = TRUE)
> sum(dice)
[1] 9

函数构建器 
> my_function<-function(){}
#############################

roll<-function()
{
  die<-1:6
  dice<-sample(die,size=2,replace=TRUE)
  print(dice)
  sum(dice)
}

roll()

> roll()
[1] 1 2
[1] 3


1.6 参数
page 35 

roll_2<-function(bones)
{
  dice<-sample(bones,size=2,replace=TRUE)
  sum(dice)
}

roll_2(bone=1:6)

#################################

roll_2<-function(bones=1:6)
{
  dice<-sample(bones,size=2,replace=TRUE)
  sum(dice)
}

roll_2()

> roll_2()
[1] 7

可以指定一个新的值给 bones 如果不指定 就使用默认值 


















