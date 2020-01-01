###############################################
#First Name:Parth
#Last Name: Parab
#CWID: 10444835
#Section: A
#Problem: H Cluster & K Means
###############################################

rm(list=ls())
cancer<-read.csv("/Users/parthxparab/Downloads/Raw_data/wisc_bc_ContinuousVar.csv",na.strings = '?')#Change the path accordingly.
View(cancer)
summary(cancer)
table(cancer$diagnosis)
#To factor the data set
cancer<-na.omit(cancer)
cancer<-cancer[-1]
cancer_dist<-dist(cancer[,-1])
hclust_results<-hclust(cancer_dist)
plot(hclust_results)
hclust_2<-cutree(hclust_results,2)
table(hclust_2,cancer[,1])


rm(list=ls())
cancer<-read.csv("/Users/parthxparab/Downloads/Raw_data/wisc_bc_ContinuousVar.csv",na.strings = '?')#Change the path accordingly.
View(cancer)
summary(cancer)
table(cancer$diagnosis)
#To factor the data set
cancer<-na.omit(cancer)
cancer<-cancer[-1]
kmeans_2<- kmeans(cancer[,-1],2,nstart = 10)
kmeans_2$cluster
table(kmeans_2$cluster,cancer[,1])

