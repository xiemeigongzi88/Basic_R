4 mark system 

4.1 值得选取 
page 80 

要从 一个数据框中提取某个值 或者 某一组值 

deck[,]

括号内有两个索引参数， 以 comma 隔开 
索引参数告诉 R 需要提取哪些值
第一个索引参数 选择 相应得行 
第二个参数 选择 相应得列 

4.1.1 正整数索引 

> deck[1,c(1,2,3)]
  face   suit value
1 king spades    13
> deck[1,c(2,3)]
    suit value
1 spades    13


如果在索引中 重复某个数值 
R 就会在相应的索引位置重复提取相应的数据 
这些数据 会在最后的 “数据子集” 中重复出现 

> deck[c(1,1),c(1,2,3)]
    face   suit value
1   king spades    13
1.1 king spades    13


> vec<-c(1:6)
> vec
[1] 1 2 3 4 5 6
> vec[1:4]
[1] 1 2 3 4

索引从 1  开始


从一个数据框中提取两列 或者 两列以上的数据 
R 会返回一个心的数据框 

> deck[1:2,1:2]
   face   suit
1  king spades
2 queen spades



如果只提取一列， R 会返回一个向量 
> deck[1:2,1]
[1] king  queen
13 Levels: ace eight five four jack king ... two

如果仍然想返回一个数据框 可以在括号里添加 drop=FALSE

> deck[1:2,1,drop=FALSE]
   face
1  king
2 queen



4.1.2 负整数索引 
> deck[-(2:52),1:3]
  face   suit value
1 king spades    13


4.1.3 零索引

返回一个空的对象 



4.1.4 空格索引 

提取所有行 或者 所有列 
> deck[,c(1,2)]


4.1.5 逻辑值索引 

R 会匹配索引值为 TRUE 的 位置 
并 提取出 相应的 元素 而忽略所有索引值为 FALSE 的位置 

> deck[c(1,2,3),c(TRUE,TRUE,FALSE)]
   face   suit
1  king spades
2 queen spades
3  jack spades


4.1.6 名称索引

> deck[1,c("face","suit",'value')]
  face   suit value
1 king spades    13
> deck[,'value']
 [1] 13 12 11 10  9  8  7  6  5  4  3  2  1 13 12 11
[17] 10  9  8  7  6  5  4  3  2  1 13 12 11 10  9  8
[33]  7  6  5  4  3  2  1 13 12 11 10  9  8  7  6  5
[49]  4  3  2  1



4.2 发牌 

4.3 洗牌 


4.4 美元符号 与 双中括号 
page 88 
 
> deck$value
 [1] 13 12 11 10  9  8  7  6  5  4  3  2  1 13 12 11
[17] 10  9  8  7  6  5  4  3  2  1 13 12 11 10  9  8
[33]  7  6  5  4  3  2  1 13 12 11 10  9  8  7  6  5
[49]  4  3  2  1

> mean(deck$value)
[1] 7
> median(deck$value)
[1] 7


##recall the list
 
> li_1<-list(1,2,3,4)
> li_1
[[1]]
[1] 1

[[2]]
[1] 2

[[3]]
[1] 3

[[4]]
[1] 4

> li_2<-list(1:4)
> li_2
[[1]]
[1] 1 2 3 4



> list_1<-list(numbers=c(1,2),logical=TRUE,strings=c("a","b","c"))
> list_1
$numbers
[1] 1 2

$logical
[1] TRUE

$strings
[1] "a" "b" "c"


> list_1[1]
$numbers
[1] 1 2
其返回时一个更小的列表 只包含一个元素 即 c(1,2)
 
很多的 R 函数 不接受 列表 对象 作为输入 如
> lis<-list(c(1:4))
> sum(lis[1])
Error in sum(lis[1]) : invalid 'type' (list) of argument

记住： list[1] 的标记是  [[1]] 这个可以用

lis<-list(c(1:4))
> a<-lis[1]
> sum(a)
Error in sum(a) : invalid 'type' (list) of argument
> a
[[1]]
[1] 1 2 3 4
就是说 a 还是列表对象

> sum(lis[[1]])
[1] 10
这样是可以的

> lis[[1]]
[1] 1 2 3 4

