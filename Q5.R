library(readxl)
library(readr)
setwd("~/Milgard/3 - Winter Quarter/560 - Data Mining/Assignments/Mid Term/Q 5")
Q_5 <- read_excel("~/Milgard/3 - Winter Quarter/560 - Data Mining/Assignments/Mid Term/Q 5.xlsx")
View(Q_5)

AY <- c(0,1,0,1,1,0,1)
PY <- c(0.5,0.9,0.7,0.7,0.3,0.4,0.5)
DF <-data.frame("Actual Y"=AY,"Predicted Y"=PY)

pred.6<- ifelse(DF$Predicted.Y>0.6, 1,0)
pred.8<- ifelse(DF$Predicted.Y>0.8, 1,0)

DFp<-data.frame("Output for threshold 0.6"=pred.6, "Output for threshold 0.8"=pred.8)

new.DF<-cbind(DF,DFp)
new.DF
## Ashrith Madan

library(caret)
library(forecast)
y <- as.factor(new.DF$Actual.Y)
predictions.6 <- as.factor(new.DF$Output.for.threshold.0.6)
predictions.8 <- as.factor(new.DF$Output.for.threshold.0.8)

cm.6 <- confusionMatrix(predictions.6, reference = y)
cm.8 <- confusionMatrix(predictions.8, reference = y)

w<- c('Recall', 'Precision', 'Accuracy', 'F1 Measure')
c.6<-c(cm.6$byClass["Recall"],cm.6$byClass["Precision"],cm.6$byClass["Balanced Accuracy"],cm.6$byClass["F1"])
c.8<-c(cm.8$byClass["Recall"],cm.8$byClass["Precision"],cm.8$byClass["Balanced Accuracy"],cm.8$byClass["F1"])

cm.DF<-data.frame("Value"=w,"Cutoff Scores for 0.6"=c.6,"Cutoff Scores for 0.8"=c.8)
cm.DF[,c(2:3)]

## Ashrith Madan
