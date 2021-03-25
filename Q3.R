library(readxl)
Q_3 <- read_excel("~/Milgard/3 - Winter Quarter/560 - Data Mining/Assignments/Mid Term/dataforExamquestion3.xlsx")
View(Q_3)

## Partition 633 into 10 Units of 63 items each
Unit1<-Q_3[1:63,]
Unit2<-Q_3[64:126,]
Unit3<-Q_3[127:189,]
Unit4<-Q_3[190:252,]
Unit5<-Q_3[253:314,]
Unit6<-Q_3[315:377,]
Unit7<-Q_3[378:441,]
Unit8<-Q_3[442:504,]
Unit9<-Q_3[505:567,]
Unit10<-Q_3[568:633,]

## Finding Units where BK = 0
cat(paste("Unit 1 with BK as '0'= ",nrow(Unit1)-sum(Unit1$bktype)),
    paste("Unit 2 with BK as '0'= ",nrow(Unit2)-sum(Unit2$bktype)),
    paste("Unit 3 with BK as '0'= ",nrow(Unit3)-sum(Unit3$bktype)),
    paste("Unit 4 with BK as '0'= ",nrow(Unit4)-sum(Unit4$bktype)),
    paste("Unit 5 with BK as '0'= ",nrow(Unit5)-sum(Unit5$bktype)),
    paste("Unit 6 with BK as '0'= ",nrow(Unit6)-sum(Unit6$bktype)),
    paste("Unit 7 with BK as '0'= ",nrow(Unit7)-sum(Unit7$bktype)),
    paste("Unit 8 with BK as '0'= ",nrow(Unit8)-sum(Unit8$bktype)),
    paste("Unit 9 with BK as '0'= ",nrow(Unit9)-sum(Unit9$bktype)),
    paste("Unit 10 with BK as '0'= ",nrow(Unit10)-sum(Unit10$bktype)),
    paste("Total items in all Units where BK is '0'= ",nrow(Q_3)-sum(Q_3$bktype)), sep = '\n')
## Ashrith Madan

partitions<- split(Q_3, sample(1:10, nrow(Q_3), replace=TRUE))
for (i in 1:10){
  assign(paste("partition", i, sep=""), as.data.frame(partitions[i]))
}
x= c(sum(partition1$X1.bktype==0),
     sum(partition2$X2.bktype==0),
     sum(partition3$X3.bktype==0),
     sum(partition4$X4.bktype==0),
     sum(partition5$X5.bktype==0),
     sum(partition6$X6.bktype==0),
     sum(partition7$X7.bktype==0),
     sum(partition8$X8.bktype==0),
     sum(partition9$X9.bktype==0),
     sum(partition10$X10.bktype==0))
t=c("Total",sum(Q_3$bktype==0))

count_frame <- data.frame(frame=seq(1,10,1), records_where_bk_0 = x)
count_frame <- rbind(count_frame, t)
count_frame
## Ashrith Madan

## B Calculate the mean for DATA1 for each type BK=0, BK=1.
names(Q_3)[27]<-"DATA_1"
Q_3$DATA_1 <-as.numeric(Q_3$DATA_1)

sub.bk0 <-subset(Q_3,bktype == 0)
sub.bk1 <-subset(Q_3,bktype == 1)
sub.bk1 <- sub.bk1[1:79,]
sub.Q_3<-rbind(sub.bk0,sub.bk1)

cat(paste("DATA1 with BK as '0' has a Mean of ",mean(sub.bk0$DATA_1)),
    paste("DATA1 with BK as '1' has a Mean of ",mean(sub.bk1$DATA_1)),
    sep = '\n')
## Ashrith Madan

library(caret)
library(dplyr)
sub.Q_3.t <-as.data.frame(sub.Q_3[,c(8,27)])

#compute summary statistics by BK value
group_by(sub.Q_3.t,bktype) %>%
  summarise(
    count = n(),
    mean = mean(DATA_1, na.rm = TRUE),
    sd = sd(DATA_1, na.rm = TRUE))
## Ashrith Madan
