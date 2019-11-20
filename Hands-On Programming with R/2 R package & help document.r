2 R package & help document

2.1 R 包 
page 40 

install.packages('ggplot2')

加载包 

> x<-c(-1,-0.8,-0.6,-0.4,-0.2,-0,-0.2,0.4,0.6,0.8,1)
> x
 [1] -1.0 -0.8 -0.6 -0.4 -0.2  0.0 -0.2  0.4  0.6  0.8
[11]  1.0
> y<-x^3
> y
 [1] -1.000 -0.512 -0.216 -0.064 -0.008  0.000 -0.008
 [8]  0.064  0.216  0.512  1.000
> qplot(x,y)

Error in qplot(x, y) : could not find function 


安装正确以后 输入 ： 
可以用 qplot(x,y) 画图 
install.packages("ggplot2")
library(ggplot2)

> x<-c(-1,-0.8,-0.6,-0.4,-0.2,0,0.2,0.4,0.6,0.8,1)
> x
 [1] -1.0 -0.8 -0.6 -0.4 -0.2  0.0
 [7]  0.2  0.4  0.6  0.8  1.0
> y<-x^3
> qplot(x,y)


> x<-c(1,2,2,2,3,3)
> qplot(x,binwidth=1)

> x2<-c(1,1,1,1,1,2,2,2,2,3,3,4)
> qplot(x2,binwidth=1)




roll<-function()
{
  die<-1:6
  dice<-sample(die,size=2,replace=T)
  sum(dice)
}

die<-1:6

roll()

rolls<-replicate(100000,roll())
qplot(rolls,binwidth=1)


page 46 
2.2 从帮助页面获取帮助 
> ?sqrt
> ?log10
> ?sample

在 sample 函数中 设置 prob 参数， 
这个参数是一个包含权重值的向量 

roll<-function()
{
  die<-1:6
  dice<-sample(die,size=2,replace=T,prob=c(1/8,1/8,1/8,1/8,1/8,3/8))
  sum(dice)
}

rolls=replicate(10000,roll())
qplot(rolls,binwidth=1)




