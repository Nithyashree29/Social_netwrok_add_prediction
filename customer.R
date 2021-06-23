####importing dataset######
data<-read.csv(choose.files())
data
names(data)

str(data)

dim(data)
summary
### removing the columns which are not necessary
data=data[,-c(1,2)]
data
dim(data)
#### data preprocessing-part1
colSums(is.na(data))

##data preprocessing-part2-outlier treatment
boxplot(data$Age)   ##no outlier
boxplot(data$EstimatedSalary) ## no outlier


## data preprocessing-part-3
### no encoding part found so no need to do encoding


##data preprocessing-part-4-feauture scaling
data$age=scale(data$Age)  ## left to user choice
data$EstimatedSalary=scale(data$EstimatedSalary)
data
data=data[,-1]
head(data)

###Data preprocessing completed
### since its supervised machinelearning we have target variable
##we have to split the data into training and testing for building model and prediction 
##with test data set
library(caTools)
set.sedd(551)
split=sample.split(data$Purchased,SplitRatio = 0.75)
split
table(split)

training=subset(data,split==TRUE)
test=subset(data,split==FALSE)
nrow(training)
nrow(test)

#building the generalized linear model in logestic regression
reg<-glm(Purchased~.,data=training,family = 'binomial')
reg
summary(reg)
##Null deviance=it is bydefault ,even though we have independent variable or not
##Residual deviance=considered only based on independent variable.
#AIC should be less but not a threshold value
step(reg) ## this will enable us to see the lesser value of AIC 

##use MLE=maximum liklihood estimation,to provide threshold v alue
##threshold value=0.5
###prediction 
pred=predict(reg,newdata=test,type='response')
pred
pred=ifelse(pred>=0.5,1,0)
pred
### to find accuracy
cm=table(test$Purchased,pred)
cm


library(caret)
confusionMatrix(cm)

##threshold=0.5 ,accuracy=85%
plot(test$Purchased)


##ROC,AOC
install.packages("ROCR")
library(ROCR)

Roc_Auv<-prediction(pred,test$Purchased)
Roc_Auv
###insetad of changing accuracy again and again we need ROc by default it checks the best fit
##always AOC should be less than ROc 
Roc_Auv_newvalue=performance(Roc_Auv,"tpr","fpr")
Roc_Auv_newvalue
plot(Roc_Auv_newvalue,print.cutoffs.at=seq(.1,by=.1),text.adj=c(-1,1),cex=.7)
abline(a=0,b=1)

##Final result
##accuracy=84%
#cutoff=90%,wherte Tpr=60%,Fpr=~15%
