#Load Data
diabetes <- read.csv("C:/Users/05211740000082/Documents/AB/Praktikum/Praktikum-3/diabetes.csv")
diabetes$Outcome <- factor(diabetes$Outcome, levels = c(0,1), labels = c("False", "True"))
str(diabetes)
head(diabetes)

#Install & Load Packages
install.packages("tidyverse")
library(tidyverse)
install.packages("ggplot2")
library(ggplot2)
install.packages("caret")
library(caret)
install.packages("caretEnsemble")
library(caretEnsemble)
install.packages("psych")
library(psych)
install.packages("Amelia")
library(Amelia)
install.packages("mice")
library(mice)
install.packages("GGally")
library(GGally)
install.packages("rpart")
library(rpart)
install.packages("randomForest")
library(randomForest)

# Cleaning Data Diabetes
# Convert ‘0’ values into NA
diabetes[, 2:7][diabetes[, 2:7] == 0] <- NA
missmap(diabetes)

# Penghapuasan nilai yang missing 
mice_mod <- mice(diabetes[, c("Glucose", "BloodPressure", "SkinThickness", "Insulin", "BMI" )], method='rf')
mice_complete <- complete(mice_mod)

# Transfer the predicted missing values into the main data set
diabetes$Glucose <- mice_complete$Glucose
diabetes$BloodPressure <- mice_complete$BloodPressure
diabetes$SkinThickness <- mice_complete$SkinThickness
diabetes$Insulin <- mice_complete$Insulin
diabetes$BMI <- mice_complete$BMI
missmap(diabetes)

# Exploratory Data Analysis
# Visual 1
ggplot(diabetes, aes(Age, colour = Outcome)) + geom_freqpoly(binwidth = 1) + labs(title="Age Distribution by Outcome")

# Visual 2
c <- ggplot(diabetes, aes(x=Pregnancies, fill=Outcome, color=Outcome)) + geom_histogram(binwidth = 1) + labs(title="Pregnancy Distribution by Outcome")
c + theme_bw()

#Visual 3
P <- ggplot(diabetes, aes(x=BMI, fill=Outcome, color=Outcome)) + geom_histogram(binwidth = 1) + labs(title="BMI Distribution by Outcome")
P + theme_bw()

# Visual 4
ggplot(diabetes, aes(Glucose, colour = Outcome)) + geom_freqpoly(binwidth = 1) + labs(title="Glucose Distribution by Outcome")

# Visual 5
ggpairs(diabetes)

# Data Modelling
# Building a model
# Split data into training and test data sets
indxTrain <- createDataPartition(y = diabetes$Outcome, p = 0.75, list = FALSE)
training <- diabetes[indxTrain,]
testing <- diabetes[-indxTrain,]

# Check dimensions of the split
prop.table(table(diabetes$Outcome)) * 100
prop.table(table(training$Outcome)) * 100
prop.table(table(testing$Outcome)) * 100

# Create objects x which holds the predictor variables and y which holds the response variables
library(e1071)
x = diabetes[,-9]
y = diabetes$Outcome

model = train(x,y,'nb', trControl = trainControl(method = 'cv', number = 10))
model

# Plot Variable performance
X <- varImp(model)
plot(X)

