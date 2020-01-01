rm(list=ls())

setwd("C:\\Users\\varsh\\Desktop\\parth\\Knowledge Management and Data mining")
library(randomForest)
df <- read.csv('IBM_Attrition_v3.csv',na.strings = "?")
head(df, n=5)
#Summarizing each column (e.g. min, max, mean )
summary(df)

#Check the number of rows before
nrow(df)

#Remove the rows with missing values 
df <- na.omit(df)

#Check the number of rows after
nrow(df)

data <- df[,-3]
data <- data[,-5]
set.seed(123)

#KMeans

kmeans_1<- kmeans(data,2,nstart = 10)
kmeans_1$cluster
#Confusion Matrix
conf_matrix = table(kmeans_1$cluster,df[,6])
print(conf_matrix)

