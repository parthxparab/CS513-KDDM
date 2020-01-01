# Knowledge Discovery and Data Mining (CS 513A)

# Course      : CS 513A
# First Name  : Parth
# Last Name   : Parab
# CWID        : 10444835
# Purpose     : MidTerm  Q4

##########################################################
rm(list=ls())
df <- read.csv("adult_income_EDA.csv", na.string = "?") #Read the data set properly
df[,1:12][df[,1:12]==" ?"] <- NA

View(df)

numeric_variables <- dplyr::select_if(df, is.numeric) 
View(numeric_variables)

#Find max, min, median, mean and the SD of the numeric features
summary(numeric_variables)

#Replace the missing value with the median of the numbers
for(i in 1:ncol(numeric_variables)){
  df[is.na(numeric_variables[,i]), i] <- median(numeric_variables[,i], na.rm = TRUE)
}

View(df)

#Plot a box plot for the numeric variables 
boxplot(numeric_variables)

