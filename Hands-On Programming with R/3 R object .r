3 R object 
page 54 
本章介绍 如何用 R 生成一个扑克牌 

3.1 原子型向量 
page 55 

将一组数据用 C 函数组合起来， 形成一个 原子型 向量 

> die<-c(1,2,3,4,5,6)
> die
[1] 1 2 3 4 5 6
> is.vector(die)
[1] TRUE
> five<-5
> five
[1] 5
> is.vector(five)
[1] TRUE

> die<-1:6
> is.vector(die)
[1] TRUE


is.vector() 用来测试某个对象是否是 原子型向量 

也可以生成 只包含一个值的 原子型向量 

R 可以识别 六种 基本类型的原子型向量 
（1） 双整型 double 
（2） 整型 integer 
（3） 字符型 character 
（4） 逻辑类型 logical 
（5） 复数类型 complex 
（6） 原始类型 raw


> text<-'abel'
> text
[1] "abel"

> a<-1L
> typeof(a)
[1] "integer"


> b<-c(1.23,1232,123)
> typeof(b)
[1] "double"



> text<-c('abel','eric')
> typeof(text)
[1] "character"
> a<-c(1L,5L)
> typeof(a)
[1] "integer"


3.1.1 双整型 
默认用 双整型存储 

> die<-1:6
> typeof(die)
[1] "integer"
> die<-c(1,2,3,4,5,6)
> typeof(die)
[1] "double



3.1.2 整型

3.1.3 字符型 

3.1.4 逻辑型
TRUE FALSE 全部大写 


3.1.5 复数类型 和 原始类型 

> comp<-c(1+1i,1+2i,1+3i)
> comp
[1] 1+1i 1+2i 1+3i


> raw(8)
[1] 00 00 00 00 00 00 00 00






3.2 属性 
page 60 
用 attributes 函数 可以查看一个对象包含哪些属性信息
如果一个对象没有任何属性信息 attributes 会返回 NULL 

> die<-1:6
> attributes(die)
NULL


3.2.1 名称属性 

> die<-1:6
> die
[1] 1 2 3 4 5 6
> names(die)<-c('one','two','three','four','five','six')
> names
function (x)  .Primitive("names")

> names(die)
[1] "one"   "two"   "three" "four" 
[5] "five"  "six" 

> attributes(die)
$names
[1] "one"   "two"   "three" "four" 
[5] "five"  "six"  

> die
  one   two three  four  five   six 
    1     2     3     4     5     6 

> die+1
  one   two three  four  five   six 
    2     3     4     5     6     7 
> 

批量删除或者修改某个对象的  名称属性 
names(die)<-c('uno','dos','tres','quatro','cinco','seis')
> die
   uno    dos   tres quatro  cinco 
     1      2      3      4      5 
  seis 
     6 
	 
要想一次性删除 名称属性值 将 NULL 赋值给 names 函数 
> names(die)<-NULL
> die
[1] 1 2 3 4 5 6


3.2.2 维度属性 
原子型向量可以转换成 一个 n 维数组（array）
使用 dim() 函数将 相应的维度赋值给该向量 

> die<-1:6
> dim(die)<-c(2,3)  
> die
     [,1] [,2] [,3]
[1,]    1    3    5
[2,]    2    4    6


> dim(die)<-c(3,2)
> die
     [,1] [,2]
[1,]    1    4
[2,]    2    5
[3,]    3    6

超立方体 不想看 
1*2*3 的 超立方体 
> die<-1:6
> dim(die)<-c(1,2,3) ## 一行 两列 3 切片
> die
, , 1

     [,1] [,2]
[1,]    1    2

, , 2

     [,1] [,2]
[1,]    3    4

, , 3

     [,1] [,2]
[1,]    5    6



3.3 矩阵 
page 62 

> m<-matrix(die,nrow=2)
> m
     [,1] [,2] [,3]
[1,]    1    3    5
[2,]    2    4    6

> m<-matrix(die,nrow=2,byrow=TRUE)
> m
     [,1] [,2] [,3]
[1,]    1    2    3
[2,]    4    5    6

matrix 函数默认的排列方式是 先排满第一列 再排第二列 


3.4 数组 
page 63 

array 函数  将 原子型向量 作为第一个参数 
将一个用来表示维度信息的向量作为第二个参数 

> ar<-array(c(11:14,21:24,31:34),dim=c(2,2,3))
## dim=c(2,2,3) 2 行 2 列 3 切片
> ar
, , 1

     [,1] [,2]
[1,]   11   13
[2,]   12   14

, , 2

     [,1] [,2]
[1,]   21   23
[2,]   22   24

, , 3

     [,1] [,2]
[1,]   31   33
[2,]   32   34


> hand1<-c('A','B','C','D','E','F','G','H','I','G')
> matrix(hand1,nrow=5)
     [,1] [,2]
[1,] "A"  "F" 
[2,] "B"  "G" 
[3,] "C"  "H" 
[4,] "D"  "I" 
[5,] "E"  "G" 
> matrix(hand1,ncol=5)
     [,1] [,2] [,3] [,4] [,5]
[1,] "A"  "C"  "E"  "G"  "I" 
[2,] "B"  "D"  "F"  "H"  "G" 

> dim(hand1)<-c(5,2)
> hand1
     [,1] [,2]
[1,] "A"  "F" 
[2,] "B"  "G" 
[3,] "C"  "H" 
[4,] "D"  "I" 
[5,] "E"  "G" 


> hand2<-c('A','B','C','D','E','F','G','H','I','G')
> matrix(hand2,nrow=5,byrow=TRUE)
     [,1] [,2]
[1,] "A"  "B" 
[2,] "C"  "D" 
[3,] "E"  "F" 
[4,] "G"  "H" 
[5,] "I"  "G" 
> matrix(hand2,ncol=5,byrow=TRUE)
     [,1] [,2] [,3] [,4] [,5]
[1,] "A"  "B"  "C"  "D"  "E" 
[2,] "F"  "G"  "H"  "I"  "G" 


3.5 类 
page 64 

更改对象的维度 不会改变其类型 
但是会改变对象的 class 属性

> die<-1:6
> class(die)
[1] "integer"
> typeof(die)
[1] "integer"
> dim(die)<-c(2,3)
> class(die)
[1] "matrix"
> typeof(die)
[1] "integer"


> die<-1:6
> dim(die)<-c(3,2)
> typeof(die)
[1] "integer"
> class(die)
[1] "matrix"


> die<-c(1,2,3,4,5,6)
> dim(die)<-c(2,3)
> typeof(die)
[1] "double"
> class(die)
[1] "matrix"

> attributes(die)
$dim
[1] 2 3

> class('hello')
[1] "character"
> class(5)
[1] "numeric"


3.5.1 日期与时间 
page 65 


3.5.2 因子  
因子在 R 中用来存储 分类信息 

向 factor 函数传递一个原子型向量 可生成一个因子 

> gender<-factor(c('male','female','female','male'))
> gender
[1] male   female female male  
Levels: female male


> gender<-factor(c('male','female','female','male'))
> typeof(gender)
[1] "integer"
> attributes(gender)
$levels
[1] "female" "male"  

$class
[1] "factor"

> gender
[1] male   female female male  
Levels: female male

使用 unclass 函数 可以看到 R 是如何 存储因子的 
> unclass(gender)
[1] 2 1 1 2
attr(,"levels")
[1] "female" "male"  
> gender
[1] male   female female male  
Levels: female male

在加载或者生成数据时， R 会时常尝试将字符串变量转成 因子类型 

as.character()函数将一个因子强制转换成字符串 

> gender<-factor(c('male','female','female','male'))
> as.character(gender)
[1] "male"   "female" "female" "male"  
> gender
[1] male   female female male  
Levels: female male
> class(gender)
[1] "factor"


> a<-as.character(gender)
> a
[1] "male"   "female" "female" "male"  
> typeof(a)
[1] "character"

> gender<-factor(c('male','female','female','male'))
> as.character(gender)
[1] "male"   "female" "female" "male"  
> gender
[1] male   female female male  
Levels: female male



因为源自型向量只能存储一种类型的数据 所以 R 将三个元素强制转换成 字符型 

> card<-c('A','B',1)
> card
[1] "A" "B" "1"
> typeof(card)
[1] "character"


3.6 强制转换 
page 68 

> sum(c(TRUE,TRUE,FALSE,FALSE))
[1] 2
> as.character(1)
[1] "1"

> as.logical(1)
[1] TRUE
> as.numeric(FALSE)
[1] 0




3.7 列表
page 70

> list_1<-list(100:130,'R',list(TRUE,FALSE))
> list_1
[[1]]
 [1] 100 101 102 103 104 105 106 107 108
[10] 109 110 111 112 113 114 115 116 117
[19] 118 119 120 121 122 123 124 125 126
[28] 127 128 129 130

[[2]]
[1] "R"

[[3]]
[[3]][[1]]
[1] TRUE

[[3]][[2]]
[1] FALSE


##################################
> list_2<-list(1:4)
> list_2
[[1]]
[1] 1 2 3 4


> list_3<-list(list(1,2,3)) ## 注意 comma 
> list_3
[[1]]
[[1]][[1]]
[1] 1

[[1]][[2]]
[1] 2

[[1]][[3]]
[1] 3


> list_4<-list(list(1:4))
> list_4
[[1]]
[[1]][[1]]
[1] 1 2 3 4




> card<-list('A','B',1)
> card
[[1]]
[1] "A"

[[2]]
[1] "B"

[[3]]
[1] 1


3.8 数据框
page  72 


> df<-data.frame(face=c('ace','two','six'),suit=c('clubs','clubs','clubs'),value=c(1,2,3))
> df
  face  suit value
1  ace clubs     1
2  two clubs     2
3  six clubs     3

data.frame 函数的参数时 face suit value 
你也可以采用自己的 



也可以在创建列表或者向量的时候 为其命名  
与 data.frame 函数的相同语法 
> list('ace','hearts',1)
[[1]]
[1] "ace"

[[2]]
[1] "hearts"

[[3]]
[1] 1

> list(face='ace',suit='hearts',value=1)
$face
[1] "ace"

$suit
[1] "hearts"

$value
[1] 1


> c(face='ace',suit='hearts',value='one')
    face     suit    value 
   "ace" "hearts"    "one"

名称会被存储在该对象的属性中 

R 非常喜欢将 字符串存储成因子 
如果向阻止这种行为发生 
添加参数 stringsFactors=FALSE

> df<-data.frame(face=c('ace','two','six'),suit=c('clubs','clubs','clubs'),value=c(1,2,3),stringsAsFactors = FALSE)
> df
  face  suit value
1  ace clubs     1
2  two clubs     2
3  six clubs     3


3.9 加载数据
page  74 


3.10 保存数据
page 77 

> write.csv(deck,file='cards.csv',row.names = FALSE)
> getwd()
[1] "C:/Users/sxw17/Documents"
> setwd("C:/Users/sxw17/Desktop/R/Note")






