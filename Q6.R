library(readxl)
TrainQ6 <- read_excel("~/Milgard/3 - Winter Quarter/560 - Data Mining/Assignments/Mid Term/TrainQ6.xlsx")
ValidQ6 <- read_excel("~/Milgard/3 - Winter Quarter/560 - Data Mining/Assignments/Mid Term/TestQ6.xlsx")

#convert to variable integers
df<-rbind(TrainQ6,ValidQ6)
df$Age<-as.integer(as.factor(df$Age))
df$`Spectacle Prescription`<-as.integer(as.factor(df$`Spectacle Prescription`))
df$Astigmatic<-as.integer(as.factor(df$Astigmatic))
df$`Tear Production Rate`<-as.integer(as.factor(df$`Tear Production Rate`))
df$`Class Label`<-as.integer(as.factor(df$`Class Label`))

TrainQ6.df <- as.data.frame(df[1:10,])
ValidQ6.df <- as.data.frame(df[11:20,])

# initialize a data frame with two columns: k, and accuracy.
accuracy.df <- data.frame(k = seq(1,5,by=1), RMSE = rep(0,5))

library(FNN)
# compute knn for different k on Validation.

set.seed(22)
for(i in 1:5){
  knn.pred<-class::knn(train = TrainQ6.df, test = ValidQ6.df, cl = TrainQ6.df[,6], k = i)
  accuracy.df[i,2]<-RMSE(as.numeric(as.character(knn.pred)),ValidQ6.df[,6])
}


as.data.frame(accuracy.df[3:5,])
## Ashrith Madan