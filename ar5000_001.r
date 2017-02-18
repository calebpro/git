#
getwd()
#
setwd("D:/")
getwd()f
gdfgsgdgsd
ls()
install.packages("ff")
library("ff")

??fread
?fread

install.packages("data.table")
library(data.table)

test <- fread("ar50000.txt", sep="\t", header=FALSE)
?fread
#test <- read.table("ar50000.txt", separator="/t", header=FALSE)
test1 <- head(test)
str(test1)
test1
head(test1, 1)
head(test1$V1, 1)
head(test1$V2, 1)


#http://stackoverflow.com/questions/4227223/r-list-to-data-frame
strsplit(test1, ",")
test2 <- strsplit(test1$V2, ",")
## split 되면서 나는 같은 한줄이었다를 표시하는 방법은 없는가 ? 


str(test2)
test2[1:1]
class(test2)
# "list"

#2번째 LINE  109번째 패키지(설치)
test2[[2]][[109]]

test2[[1,1]]

test2[[3]]
u1 <- unlist(test2)
str(u1)
u1

m1 <- matrix(unlist(test2), byrow=T)
m1

df <- data.frame(matrix(unlist(test2), byrow=T),stringsAsFactors=FALSE)


df

df2 <- do.call(rbind.data.frame, test2)
str(df2)
df2


install.packages("plyr")
library (plyr)

ldf <- ldply (test2, data.frame)
ldf

sdf <- data.frame(t(sapply(test2,c)))
sdf
summary(sdf)
str(sdf)
class(sdf)







l <- list(list(col1="a",col2=1),list(col1="b",col2=2))

f = function(x) function(i) unlist(lapply(x, `[[`, i), use.names=FALSE)

as.data.frame(Map(f(l), names(l[[1]])))





install.packages("arules")
library(arules)

trans<-read.transactions("ar50000.txt",format = "basket",sep=",", encoding = "UTF-8", rm.duplicates=TRUE);
#inspect(trans)

itemFrequencyPlot(trans,topN=20,type="absolute")
rules <- apriori(trans, parameter = list(supp = 0.001, conf = 0.04, minlen=3, maxlen=3))

options(digits=3)
#inspect(rules[1:10])
summary(rules)
rules<-sort(rules, by="lift", decreasing=TRUE)
inspect(head(sort(rules, by="support"), 30))
plot(rules, method = "graph")







