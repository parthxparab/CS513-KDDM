x1 <-c(10,5,6,6,6,7)
x1
hello <- "Hello World"
mode(hello)
x2 <- c(1,2,3,4)
x2
x3<-seq(from=10.2,to= 26.5,by=2.1)
x3

mixed_vector<-c(1,2,'5')
typeof((mixed_vector))

integer_vector<-as.integer(mixed_vector)
?integer()
integer_vector

rm(list=ls())

list

### Lecture 5 ###

my.lst <- list(stud.id=34453,
               stud.name=c("First Name","Last Name"),
               stud.marks=c(14.3,12,15,19))
is.list(my.lst)
mode(my.lst)
typeof(my.lst)
length(my.lst)

my.lst2<-list(seq=1:10,my.lst)
length(my.lst2)

#dataframe
my.dataset<- data.frame(site=c('A','B','C','D','E'),ph=c(1,2,3,4,5))
is.list(my.dataset)
is.data.frame(my.dataset)
is.matrix(my.dataset)
typeof(my.dataset)
length(my.dataset)

View(my.dataset)

data(iris)
View(iris)

Titanic <- read.csv("/Users/parthxparab/Documents/Fall 2019/CS513/raw_data/Titanic_rows.csv")
View(Titanic)

name <-file.choose()
name <- file.choose()
Titanic <- read.csv(name)

open_con <- file("C://Users/bhakt/OneDrive/Desktop/lung.csv",'r')

lung <- read.csv(open_con,header = TRUE,colClasses = c("ID"= "character", "AREA" = "factor", "Gender_father"="NULL"))
View(lung)
close(open_con)


avector <- c(1,2,3,4)
typeof(avector)
second <- avector[2]
names(avector) <- c("first","second","third","fourth")
second <- avector["second"]

avector

my.lst <- list(stud.id=100, stud.name = c("B","D"),stud.marks = c(10,20,15))
my.lst[2]
typeof(my.lst)

my.lst3<- my.lst[[2]]
typeof(my.lst3)
is.vector(my.lst3)
my.lst3[1]

data(iris)
View

subset1<-iris[-c(5,1,20,23),-5]
subset1

### define a function

mmnorm <- function(x,minx,maxx)
{
  z <-((x-minx)/(maxx-minx))
  return(z)
}
myvector <-1:20
mmnorm(myvector,1,20)

mmnorm2 <- function(x)
{  z <-((x-min(x))/(max(x)-min(x)))
return(z)
  
}