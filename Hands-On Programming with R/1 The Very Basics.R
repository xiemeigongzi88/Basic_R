# 1 The Very Basics 
100:130
length(100:130)

3%5  # error 


die<-1:6


my_number<-1
my_number<-999

ls()

die<-1:6
die-1

die/2

die*die

die<-1:6
die+1:2

die+1:4

# inner multiplication with the %*% 
die %*% die 
# 1*1 + 2*2 + 3*3 + 4*4 + 5*5 + 6*6 


# outer multiplication with the %o% 
die %o% die 


# Functions 
round(4.1415)

factorial(3)

mean(1:6)

mean(die)

round(mean(die))

# sample() 
# a vector named x and a number named size 
# return size elements from the vector 
sample(x=1:4, size=2)


# use a name that a function does not expect 
# you may get an error 
round(3.1415,corners=2 )


# check function takes what arguments 
args(round)


round(x=3.1415, digits=2)

args(sample)

sample(die, 1)



# Sample with Replacement 

sample(die,size=2)
# the second die never has the same value as the first die 


sample(die, size=2, replace = TRUE)
# put the value back into the jar 


dice<-sample(die, size=2, replace = TRUE)
dice

sum(dice)


# Writing Your Own Functions 

# The Function Constructor 

roll<-function()
{
  die<-1:6
  dice<-sample(die, size=2, replace = TRUE)
  sum(dice)
}

roll()


#-------------------------------------

roll2<-function(bones){
  dice<-sample(bones, size=2, replace=TRUE)
  sum(dice)
}

roll2(1:4)
roll2(1:10)



