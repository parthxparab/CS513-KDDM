# Knowledge Discovery and Data Mining (CS 513A)

# Course      : CS 513A
# First Name  : Parth
# Last Name   : Parab
# CWID        : 10444835
# Purpose     : MidTerm Q5

##########################################################
rm(list=ls())
df <- read.csv("Adult_income_knn.csv", header=TRUE, sep=",") 
head(df, z=5)
View(df())

sapply(df, function(df) sum(is.na (df)))
#no missing values

test <- df[seq(1, nrow(df), by = 5),]
View(test)

train <- df[-seq(5, nrow(df), by = 5),]
View(train)

library(kknn)
accuracy <- function(x){ sum(diag(x)/(sum(rowSums(x)))) * 100}
#for k=1
matrix1 <- kknn(formula = Income~.,train,test,k=1)
fit <- fitted(matrix1)
k1 <- table(test$Income,fit)
k1
accuracy(k1)
ErrorRate = 100 - accuracy(k1)
ErrorRate

#For k=3
matrix3 <- kknn(formula = Income~.,train,test,k=3)
fit <- fitted(matrix3)
k3 <- table(test$Income,fit)
k3
accuracy(k3)
ErrorRate = 100 - accuracy(k3)
ErrorRate

#For k=5
matrix5 <- kknn(formula = Income~.,train,test,k=5)
fit <- fitted(matrix5)
k5 <- table(test$Income,fit)
k5
accuracy(k5)
ErrorRate = 100 - accuracy(k5)
ErrorRate



 
