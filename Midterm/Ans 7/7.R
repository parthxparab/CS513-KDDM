# Knowledge Discovery and Data Mining (CS 513A)

# Course      : CS 513A
# First Name  : Parth
# Last Name   : Parab
# CWID        : 10444835
# Purpose     : MidTerm Q7

##########################################################

rm(list=ls())

#Install packages
library(rpart)
library(rpart.plot)
library(rattle)
library(RColorBrewer)

data = read.csv('adult_income_Dtree.csv',header=TRUE, sep=",", na.string = " ?")
View(data)

#splitting the data as every 5th row as test and remaining as training data
test <-data[seq(1,nrow(data), by=5),]
View(test)

train <-data[-seq(1,nrow(data), by=5),]
View(train)

#Making CART 
CART_class <- rpart(Income~., data= train)

#The decision tree plot
rpart.plot(CART_class)

#Testing against the test data
CART_predict<-predict(CART_class,test, type="class")
table(Actual=test[,11],CART=CART_predict)

#comparing row by row and counting the number of false predictions
CART_wrong<-sum(test[,11]!=CART_predict)
CART_error_rate<-CART_wrong/length(test[,11])*100
#error rate in percentage
sprintf('Error rate: %s percent',CART_error_rate)
