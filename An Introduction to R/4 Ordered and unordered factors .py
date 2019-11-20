4 Ordered and unordered factors 
page 22 

4.1 specific example 

> state<-c("tas", "sa", "qld", "nsw", "nsw", "nt", "wa", "wa",
+          "qld", "vic", "nsw", "vic", "qld", "qld", "sa", "tas",
+          "sa", "nt", "wa", "vic", "qld", "nsw", "nsw", "wa",
+          "sa", "act", "nsw", "vic", "vic", "act")
> statef<-factor(state)
> statef
 [1] tas sa  qld nsw nsw nt  wa  wa  qld vic nsw vic qld qld sa 
[16] tas sa  nt  wa  vic qld nsw nsw wa  sa  act nsw vic vic act
Levels: act nsw nt qld sa tas vic wa
> levels(statef)
[1] "act" "nsw" "nt"  "qld" "sa"  "tas" "vic" "wa" 



4.2 the function tapply() and ragged arrays 

page 22 

calculate the sample mean income for each state we can use the special function tapply()

incmeans<-tapply(incomes,statef,mean)


> incomes
 [1] 60 49 40 61 64 60 59 54 62 69 70 42 56 61 61 61 58 51 48 65
[21] 49 49 41 48 52 46 59 46 58 43
> statef
 [1] tas sa  qld nsw nsw nt  wa  wa  qld vic nsw vic qld qld sa 
[16] tas sa  nt  wa  vic qld nsw nsw wa  sa  act nsw vic vic act
Levels: act nsw nt qld sa tas vic wa
> incmeans<-tapply(incomes,statef,mean)
> round(incmeans,3)
   act    nsw     nt    qld     sa    tas    vic     wa 
44.500 57.333 55.500 53.600 55.000 60.500 56.000 52.250 

stderr<-function(x) sqrt(var(x)/length(x))  # x is a vector 

incster<-tapply(incomes,statef,stderr)

incster
     act      nsw       nt      qld       sa      tas      vic 
1.500000 4.310195 4.500000 4.106093 2.738613 0.500000 5.244044 
      wa 
2.657536 


4.3 Ordered factors 
ordered()


> x<-c(1,9,5,8,3,2)
> ordered(x)
[1] 1 9 5 8 3 2
Levels: 1 < 2 < 3 < 5 < 8 < 9

the ordered() function creates such ordered factors but is otherwise identical to factor 

