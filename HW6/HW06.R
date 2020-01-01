###############################################
#First Name:Parth
#Last Name: Parab
#CWID: 10444835
#Section: A
#Problem: C 5.0 Decission Tree
###############################################
rm(list=ls())
library(C50)
cancer<-read.csv("/Users/parthxparab/Documents/Fall 2019/CS513/HW6/breast-cancer-wisconsin.data.csv",na.strings = '?')#Change the path accordingly.
View(cancer)
table(cancer$Class)
#To factor the data set
cancer$Class <- factor(cancer$Class, levels = c(2,4),labels = c("Benign", "Malignant"))
# To split the data set into test and testing 
idx<-sort(sample(nrow(cancer),as.integer(.70*nrow(cancer))))
training<-cancer[idx,]
test<-cancer[-idx,]

dev.off()
#Implement C 5.0
model<-C5.0(Class~.,training[,-1])
summary(model)
plot(model)
#Prediction using test 
prediction<-predict(model,test[,-1],type="class") 
#Forming the confusin matrix
conf_matrix<-table(test[,11],prediction)
conf_matrix
str(prediction)
#Showing the error rate 
wrong<-sum(test[,11]!=prediction)
error_rate<-wrong/length(test[,11])
error_rate

