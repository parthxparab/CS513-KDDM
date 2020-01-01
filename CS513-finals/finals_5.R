rm(list=ls())

setwd("C:\\Users\\varsh\\Desktop\\parth\\Knowledge Management and Data mining")
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

#HClust
df2 <-dist(data)
resutls<-hclust(df2)
plot(resutls)
hclust<-cutree(resutls,2)

#Confusion Matrix
conf_matrix =table(hclust, df[,6])
print(conf_matrix)
