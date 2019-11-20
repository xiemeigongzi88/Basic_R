9 loop 

page 168 

9.1 期望值 

9.2 expand.grid 

expand.grid （） 函数可以写出 n 个向量元素的所有组合 

> die<-c(1:6)
> rolls<-expand.grid(die,die)
> rolls
   Var1 Var2
1     1    1
2     2    1
3     3    1
4     4    1
5     5    1
6     6    1
7     1    2
8     2    2
9     3    2
10    4    2
11    5    2
12    6    2
13    1    3
14    2    3
15    3    3
16    4    3
17    5    3
18    6    3
19    1    4
20    2    4
21    3    4
22    4    4
23    5    4
24    6    4
25    1    5
26    2    5
27    3    5
28    4    5
29    5    5
30    6    5
31    1    6
32    2    6
33    3    6
34    4    6
35    5    6
36    6    6


> rolls$Value<-rolls$Var1+rolls$Var2
> rolls
   Var1 Var2 Value
1     1    1     2
2     2    1     3
3     3    1     4
4     4    1     5
5     5    1     6
6     6    1     7
7     1    2     3
8     2    2     4
9     3    2     5
10    4    2     6
11    5    2     7
12    6    2     8
13    1    3     4
14    2    3     5
15    3    3     6
16    4    3     7
17    5    3     8
18    6    3     9
19    1    4     5
20    2    4     6
21    3    4     7
22    4    4     8
23    5    4     9
24    6    4    10
25    1    5     6
26    2    5     7
27    3    5     8
28    4    5     9
29    5    5    10
30    6    5    11
31    1    6     7
32    2    6     8
33    3    6     9
34    4    6    10
35    5    6    11
36    6    6    12



> test<-c(1:3)
> a<-expand.grid(test,test,test)
> a
   Var1 Var2 Var3
1     1    1    1
2     2    1    1
3     3    1    1
4     1    2    1
5     2    2    1
6     3    2    1
7     1    3    1
8     2    3    1
9     3    3    1
10    1    1    2
11    2    1    2
12    3    1    2
13    1    2    2
14    2    2    2
15    3    2    2
16    1    3    2
17    2    3    2
18    3    3    2
19    1    1    3
20    2    1    3
21    3    1    3
22    1    2    3
23    2    2    3
24    3    2    3
25    1    3    3
26    2    3    3
27    3    3    3


die<-c(1,2,3,4,5,6)
rolls<-expand.grid(die,die)
rolls$value<-rolls$Var1+rolls$Var2
head(rolls,3)
prob<-c("1"=1/8,"2"=1/8,"3"=1/8,"4"=1/8,"5"=1/8,"6"=3/8)
prob[rolls$Var1]
rolls$prob1<-prob[rolls$Var1]
rolls$prob2<-prob[rolls$Var2]
rolls$prob<-rolls$prob1 * rolls$prob2
sum(rolls$value * rolls$prob)





9.3 For loop 
page 175 

> for ( i in c('my','second','for','loop'))
+ {
+   print(i)
+ }
[1] "my"
[1] "second"
[1] "for"
[1] "loop"


9.4 while loop 
page 181 



9.5 repeat loop
page 181 

repeat{
	n<-n+1
	
	if(n>10)
	{
		break
	}
}


