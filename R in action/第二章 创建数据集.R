# 第二章 创建数据集 

# 2.2 数据结构 

# 2.2.1 向量 
a<- c(1,2,5,3,6,-2,4) # 数值型 向量 
b<- c("one", "two", "three") # 字符型 向量  
c<- c(TRUE, TRUE, FALSE, TRUE) # 逻辑型 向量 

'''
单个向量中的数据必须有 相同的类型和模式
同一向量中 无法混杂 不同模式的数据 
'''
####################################

### 访问向量中的元素 
a<- c(1,2,5,3,6,-2,4)
a[1]

a[c(1,3,5)]

a[2:6]
'''
> a<- c(1,2,5,3,6,-2,4)
> a[1]
[1] 1
> 
> a[c(1,3,5)]
[1] 1 5 6
> 
> a[2:6]
[1]  2  5  3  6 -2

'''

# 2.2.2 矩阵 

y<- matrix(1:20, nrow = 5, ncol = 4)
y

'''
     [,1] [,2] [,3] [,4]
[1,]    1    6   11   16
[2,]    2    7   12   17
[3,]    3    8   13   18
[4,]    4    9   14   19
[5,]    5   10   15   20
'''

#################################

cell<- c(1,26,24,68)
rnames <- c("R1","R2")
cnames<- c("C1","C2")

mymatrix<- matrix(cell, nrow = 2, ncol = 2, byrow = TRUE,
                  dimnames = list(rnames, cnames))

mymatrix

''' 
> mymatrix
   C1 C2
R1  1 26
R2 24 68
'''

mymatrix<- matrix(cell, nrow = 2, ncol = 2, byrow = FALSE,
                  dimnames = list(rnames, cnames))

mymatrix

'''
> mymatrix
   C1 C2
R1  1 24
R2 26 68
'''

### code list 2-2 
x<- matrix(1:10, nrow = 2)
x

x[2,]
x[,2]

x[1,4]

x[1, c(4,5)]

'''
> x
     [,1] [,2] [,3] [,4] [,5]
[1,]    1    3    5    7    9
[2,]    2    4    6    8   10
> 
> x[2,]
[1]  2  4  6  8 10
> x[,2]
[1] 3 4
> 
> x[1,4]
[1] 7
> 
> x[1, c(4,5)]
[1] 7 9
'''


#############################
# 2.2.3 数组 
# array (vector, dimensions, dimnames)
# code list 2-3 
dim1<- c("A1","A2")
dim2<- c("B1","B2","B3")
dim3<- c("C1","C2","C3","C4")
# dimension=c(2,3,4) 2行3列4切片
z<- array(1:24, c(2,3,4), dimnames = list(dim1, dim2, dim3))
z

'''
> z
, , C1

   B1 B2 B3
A1  1  3  5
A2  2  4  6

, , C2

   B1 B2 B3
A1  7  9 11
A2  8 10 12

, , C3

   B1 B2 B3
A1 13 15 17
A2 14 16 18

, , C4

   B1 B2 B3
A1 19 21 23
A2 20 22 24
'''

#################################

# 2.2.4 数据框 
# code list 2-4 

patientID = c(1,2,3,4)
age<- c(25,34, 28, 52)
diabetes<- c("type1","type2","type1","type1")
status<- c("poor","improved","excellent","poor")

patient_data <- data.frame(patientID, age, diabetes, status)

patient_data

'''
> patient_data
  patientID age diabetes    status
1         1  25    type1      poor
2         2  34    type2  improved
3         3  28    type1 excellent
4         4  52    type1      poor
'''
#####################################
# code list 2-5 选取数据框中的元素 
patient_data[1:2]

'''
> patient_data[1:2]
  patientID age
1         1  25
2         2  34
3         3  28
4         4  52
'''

patient_data[c('diabetes','status')]
'''
> patient_data[c('diabetes','status')]
  diabetes    status
1    type1      poor
2    type2  improved
3    type1 excellent
4    type1      poor
'''

#########################################
# $ 用来选取一个给定数据框中的某个特定变量 

table(patient_data$diabetes, patient_data$status)

'''
> table(patient_data$diabetes, patient_data$status)
       
        excellent improved poor
  type1         1        0    2
  type2         0        1    0
'''

###########################################
# 使用 attach(), detach() with() 简化代码 

summary(mtcars$mpg)
'''
> summary(mtcars$mpg)
   Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
  10.40   15.43   19.20   20.09   22.80   33.90 
'''

plot(mtcars$mpg, mtcars$disp)
plot(mtcars$mpg, mtcars$wt)

# 以上的代码也可以写成

attach(mtcars)
  summary(mpg)
  plot(mpg, disp)
  plot(mpg,wt)
detach(mtcars)
  
# 使用 with() 函数 
with(mtcars,{
  summary(mpg, disp, wt)
  plot(mpg, disp)
  plot(mpg,wt)
})

# with()函数的局限性， 赋值仅在 函数的括号里有效
with(mtcars,{
  stats<- summary(mpg)
  stats
})

stats

'''
   Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
  10.40   15.43   19.20   20.09   22.80   33.90 
> 
> stats
#Error: object "stats" not found
'''

#####################################################
'''
如果需要创建在 with() 结构以外存在的对象
使用 特殊赋值符 <<- 代替 标准赋值符 <- 
<<- 可以将 对象保存到 with() 之外的全局环境中
'''

with (mtcars,{
  nokeepstats<- summary(mpg)
  keepstats<<- summary(mpg)
})

nokeepstats
keepstats
'''
> nokeepstats
Error: object "nokeepstats" not found
> keepstats
   Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
  10.40   15.43   19.20   20.09   22.80   33.90 
'''

### 2. 实例标识符 
patient_data<- data.frame(patientID, age, diabetes, status,
                          row.names = patientID)

patient_data

'''
> patient_data
  patientID age diabetes    status
1         1  25    type1      poor
2         2  34    type2  improved
3         3  28    type1 excellent
4         4  52    type1      poor
'''

########################################
# 2.2.5 因子

diabetes<- c("type1","type2","type1","type1")
status<- c("poor","improved","excellent","poor")

status<- factor(status, order = TRUE,
                levels=c("poor","improved","excellent"))

'''
> status
[1] poor      improved  excellent poor     
Levels: poor < improved < excellent
'''

### code list 2-6 因子的使用

patientID = c(1,2,3,4)
age<- c(25,34, 28, 52)
diabetes<- c("type1","type2","type1","type1")
status<- c("poor","improved","excellent","poor")

diabetes<- factor(diabetes)
status<- factor(status, order=TRUE)

patient_data<- data.frame(patientID, age, diabetes, status)
patient_data

'''
> patient_data
  patientID age diabetes    status
1         1  25    type1      poor
2         2  34    type2  improved
3         3  28    type1 excellent
4         4  52    type1      poor
'''

str(patient_data)
'''
"data.frame":	4 obs. of  4 variables:
 $ patientID: num  1 2 3 4
 $ age      : num  25 34 28 52
 $ diabetes : Factor w/ 2 levels "type1","type2": 1 2 1 1
 $ status   : Ord.factor w/ 3 levels "excellent"<"improved"<..: 3 2 1 3
 '''

summary(patient_data)
'''
> summary(patient_data)
   patientID         age         diabetes       status 
 Min.   :1.00   Min.   :25.00   type1:3   excellent:1  
 1st Qu.:1.75   1st Qu.:27.25   type2:1   improved :1  
 Median :2.50   Median :31.00             poor     :2  
 Mean   :2.50   Mean   :34.75                          
 3rd Qu.:3.25   3rd Qu.:38.50                          
 Max.   :4.00   Max.   :52.00 
 '''

#################################################
# 2.2.6 列表
# mylist <- list(name1= object1, name2= object2,...)

# code list 2-7 创建一个列表
g<- "my first list"
h<- c(25, 26, 18,39)
j<- matrix(1:10, nrow = 5)
k<- c("one","two","three")

mylist<- list(title=g, ages=h, j,k)
mylist

'''
$title
[1] "my first list"

$ages
[1] 25 26 18 39

[[3]]
     [,1] [,2]
[1,]    1    6
[2,]    2    7
[3,]    3    8
[4,]    4    9
[5,]    5   10

[[4]]
[1] "one"   "two"   "three"
'''

mylist[[2]]
'''
> mylist[[2]]
[1] 25 26 18 39
'''

####################################

# 2.4 数据集的标注 
# 2.4.1 变量标签 

names(patient_data)
'''
> names(patient_data)
[1] "patientID" "age"       "diabetes"  "status"   
'''

names(patient_data)[2]<- "age at hospitalization (in year)"

names(patient_data)

'''
> names(patient_data)[2]<- "age at hospitalization (in year)"
> names(patient_data)
[1] "patientID"                       
[2] "age at hospitalization (in year)"
[3] "diabetes"                        
[4] "status"   
'''

############################################
# 2.4.2 值标签 
patient_data$gender<- c("female","male","male","female")
patient_data$status<- factor(patient_data$status, 
                              levels=c(1,2,3),
                              labels=c("poor","improved","excellent"))

patient_data

# 这里出现问题 