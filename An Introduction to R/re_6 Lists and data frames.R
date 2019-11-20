# 6 Lists and data frames 

# 6.1 Lists 
lst<-list(name="Fred",wife="Mary",
          no.chidren=3,child.ages=c(4,7,9))


class(lst$name)==class(lst[[1]])
typeof(lst$name)
class(lst$child.ages[1])

# lst$name == lst[[1]]
# lst$wife == lst[[2]]
# lst$child.age[1] == lst[[4]][1]


# 6.2 Cosntructing and modifying lists 

lst[5]<-list(matrix=Mat)


# 6.3 Data frames 

# 6.3.2 attach() and detach() 











