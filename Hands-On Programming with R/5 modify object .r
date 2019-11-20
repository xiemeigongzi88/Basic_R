5 modify object 
对象改值 

page 92 

5.1 就地改值 
> vec<-c(0,0,0,0,0,0)
> vec
[1] 0 0 0 0 0 0
> vec[1]
[1] 0
> vec[1]<-233
> vec
[1] 233   0   0   0   0   0

> vec[c(1,3,5)]<-c(1,1,1)
> vec
[1] 1 0 1 0 1 0
> vec[4:6]<-vec[4:6]+1
> vec
[1] 1 0 1 1 2 1
> vec[7]<-98
> vec
[1]  1  0  1  1  2  1 98



> deck_2<-deck
> deck_2[c(13,26,39,52),]
   face     suit value
13  ace   spades     1
26  ace    clubs     1
39  ace diamonds     1
52  ace   hearts     1
> deck_2[c(13,26,39,52),3]
[1] 1 1 1 1
> deck_2$value[c(13,26,39,52)]
[1] 1 1 1 1
> deck_2$value[c(13,26,39,52)]<c(14,14,14,14)
[1] TRUE TRUE TRUE TRUE


> head(deck_2,13)
    face   suit value
1   king spades    13
2  queen spades    12
3   jack spades    11
4    ten spades    10
5   nine spades     9
6  eight spades     8
7  seven spades     7
8    six spades     6
9   five spades     5
10  four spades     4
11 three spades     3
12   two spades     2
13   ace spades     1




5.2 逻辑值取子集
page 95 

> vec<-c(1,0,1,1,2,1,0)
> vec[c(FALSE,FALSE,FALSE,FALSE,TRUE,FALSE,FALSE)]
[1] 2


5.2.1 
逻辑测试 

> 1>2
[1] FALSE
> 1>c(0,1,2)
[1]  TRUE FALSE FALSE
> c(1,2,3)==c(3,2,1)
[1] FALSE  TRUE FALSE


%in% 是唯一不进行 一一对比的运算符 
其作用是 测试其 左边的值 是否出现在 其右边的对象中

> 1 %in% c(1,2,3,4)
[1] TRUE
> c(1,2) %in% c(1,2,3,4,5)
[1] TRUE TRUE
> c(1,2,3) %in% c(3,4,5)
[1] FALSE FALSE  TRUE
> c(1,2,3,4) %in% c(3,4,5)
[1] FALSE FALSE  TRUE  TRUE


5.2.2 布尔运算符 

> a<-c(1,2,3)
> b<-c(1,2,3)
> c<-c(1,2,4)
> a==b
[1] TRUE TRUE TRUE
> b==c
[1]  TRUE  TRUE FALSE
> a==b&b==c
[1]  TRUE  TRUE FALSE

看不下去了 不想看 


5.3 缺失信息 
page 104 

5.3.1 na.rm 
如果其中一个观测值是 NA 那么计算结果也是 NA 
> c(NA,1:10)
 [1] NA  1  2  3  4  5  6  7  8  9 10
 
> mean(c(NA,1:10))
[1] NA

如果添加 参数 na.rm=TRUE  求值时可以去除 NA 

> mean(c(NA,1:10),na.rm = TRUE)
[1] 5.5



5.3.2 is.na 

> is.na(NA)
[1] TRUE
> vec<-c(1,2,3,4,NA)
> is.na(vec)
[1] FALSE FALSE FALSE FALSE  TRUE

