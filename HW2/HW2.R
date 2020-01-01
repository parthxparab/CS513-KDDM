#Parth Parab CS-513 A CWID: 10444835



#Load the “breast-cancer-wisconsin.data.csv” from canvas into R and perform the EDA analysis
dataSet <- read.csv("/Users/parthxparab/Documents/Fall 2019/CS513/HW2/breast-cancer-wisconsin.data.csv", na.string = "?")

#Summarizing each column 
summary(dataSet)

#Replace ? with NA for simplicity
dataSet[,1:11][dataSet[,1:11]=="?"] <- NA

#Identifying missing values
is.na(dataSet)
View(dataSet)

#Replacing the missing values with the “mean” of the column.
for(i in 1:ncol(dataSet)){
  dataSet[is.na(dataSet[,i]), i] <- mean(dataSet[,i], na.rm = TRUE)
}

#Rounding Values to first 2 decimal for simplicity
dataSet[,-1] <-round(dataSet[,-1],2)

#Displaying the frequency table of “Class” vs. F6
myTable <- table(dataSet$Class, dataSet$F6)
ftable(myTable)

#Displaying the scatter plot of F1 to F6, one pair at a time
plot(dataSet[2:7], main = "Scatter Plot of F1 to F6", ph = 10, col = 2)

#Show histogram box plot for columns F7 to F9
boxplot(dataSet[8:10], main = "Histogram Box Plot for Columns F7 to F9")

#Delete all the objects from your R- environment. 
rm(list=ls())

#Reload the “breast-cancer-wisconsin.data.csv” from canvas into R. 
dataSet <- read.csv("/Users/parthxparab/Documents/Fall 2019/CS513/HW2/breast-cancer-wisconsin.data.csv", na.string = "?")

#Remove any row with a missing value in any of the columns.
dataSet[,1:11][dataSet[,1:11]=="?"] <- NA
dataSet <- na.omit(dataSet)


