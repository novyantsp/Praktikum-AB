# Set Working Directory 
setwd("C:/Users/05211740000082/Documents/AB/Praktikum/Praktikum-2")

# Install Package neuralnet 
install.packages("neuralnet")

# Install Package caret 
install.packages("caret")

# --- No 1 ---- #

## Load Data Creditscore
df <- read.csv("creditscore.csv")

# --- No 2 ---- #

## Drop column clientid
df$clientid <- NULL

## Data Normalization
df_norm <- as.data.frame(apply(df[, 1:4], 2, function(x) (x - min(x))/(max(x)-min(x))))
df_norm$default10yr <- df$default10yr
summary(df_norm)

## import Library neuralnet
library(neuralnet)

## import Library caret
library(caret) 

## training sample with n observations
n <- round(nrow(df_norm)*0.67);n
set.seed(12);samp=sample(1:nrow(df_norm),n)

## Make train and test data
train = df_norm[samp,]
test = df_norm[-samp,]

## get features
feats <- names(df_norm[,1:4])

## Make ANN Formula
f<-paste(feats,collapse='+')
f<-paste('default10yr~',f)
f<-as.formula(f);f

## train neural net 
nn <- neuralnet(f,train,hidden=7,stepmax=1e8) 

# --- No 3 ---- #

## View Error Neuralnet
nn$result.matrix[1]

# --- No 4 ---- #
## View Steps Neuralnet
nn$result.matrix[3]

# --- No 5 ---- #

#Prediction Model 
predict=compute(nn,test[1:4]) 
predict 
predict1 <- ifelse(predict$net.result>0.5, 1, 0) 

#Compare Data Actual Prediction 
actual <- test$default10yr
predict_actual <- data.frame(predict1, actual)
head(predict_actual, 100)

#confusion matrix 
confusionMatrix(as.factor(predict1),as.factor(test$default10yr)) 

# --- No 6 ---- #

## Plot Neuralnet
plot(nn)