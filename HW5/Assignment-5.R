library(class)
library(rpart)

rm(list = ls())

setwd("/Users/parthxparab/Documents/Fall 2019/CS513/HW3")
df = read.csv('breast-cancer-wisconsin.data.csv',header=TRUE, sep=",")
head(df, n=5)
#Summarizing each column (e.g. min, max, mean )
summary(df)
#Here we see that the summary for only column F6 hasn't been calculated on account of non-numeric characters in the column
n <- as.numeric(as.character(df$F6))
summary(n, na.rm = TRUE)
df$F6 <- n
summary(df, na.rm = TRUE)

#Check the number of rows before
nrow(df)

#Remove the rows with missing values 
df <- na.omit(df)

#Check the number of rows after
nrow(df)

#Convert labels to factor class
df$Class<- factor(df$Class , levels = c("2","4") , labels = c("Benign","Malignant"))
#Check if factor class
is.factor(df$Class)

#Generate train and test in the ratio 70% to 30%
df<- df[2:11]
size <- floor(0.70 * nrow(df))

#Set the seed 
set.seed(123)
random <- sample(seq_len(nrow(df)), size = size)

#70% data in train dataset
train <- df[random, ]

#30% data in test dataset
test <- df[-random, ]

#Implementing CART 
cart <- rpart(Class ~ ., data = train, method = "class")

#Predicting class for test set
predicted <- predict(cart, test, type = "class")
print(length(predicted))
print(length(test$Class))

#Confusion Matrix
conf_matrix <- table(predicted,test$Class)
print(conf_matrix)

#Accuracy
accuracy <- function(x){sum(diag(x)/(sum(rowSums(x)))) * 100}
accuracy(conf_matrix)


