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

#Generate train and test in the ratio 70% to 30%
size <- floor(0.70 * nrow(df))

#Set the seed 
set.seed(123)
random <- sample(seq_len(nrow(df)), size = size)

#70% data in train dataset
train <- df[random, ]

#30% data in test dataset
test <- df[-random, ]

fit <- randomForest(Attrition~., data=train,importance=TRUE, ntree=100)
importance(fit)
varImpPlot(fit)
pred <- predict(fit, test)
print(pred)
#Confusion Matrix
conf_matrix <- table(pred,class=test$Attrition)
print(conf_matrix)

#Accuracy
accuracy <- function(x){sum(diag(x)/(sum(rowSums(x)))) * 100}
accuracy(conf_matrix)

wrong<- (test$Attrition!=pred)
#Error rate
error_rate<-sum(wrong)/length(wrong)
error_rate 

