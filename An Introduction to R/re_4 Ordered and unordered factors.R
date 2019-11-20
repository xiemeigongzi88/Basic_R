# 4 Ordered and unordered factors 

# 4.1 a specific example 
state <- c("tas", "sa", "qld", "nsw", "nsw", "nt", "wa", "wa",
           "qld", "vic", "nsw", "vic", "qld", "qld", "sa", "tas",
           "sa", "nt", "wa", "vic", "qld", "nsw", "nsw", "wa",
           "sa", "act", "nsw", "vic", "vic", "act")
print(length(state))
f<-factor(state)

print(f)


# 4.2 the function of tapply() and ragged arrays 
incomes <- c(60, 49, 40, 61, 64, 60, 59, 54, 62, 69, 70, 42, 56,
             61, 61, 61, 58, 51, 48, 65, 49, 49, 41, 48, 52, 46,
             59, 46, 58, 43)
print(length(incomes))
incmeans<-tapply(incomes,f,mean)

df<-data.frame(income=incomes,state=state)


# 4.3 Ordered factors 
f<-factor(state,ordered = TRUE)
ordered(f)  # identical method 

print(f)
