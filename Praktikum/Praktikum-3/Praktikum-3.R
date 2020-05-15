# Set Working Directory 
setwd("C:/Users/05211740000082/Documents/AB/Praktikum/Praktikum-3")	

#Install Packages
install.packages("naivebayes")
install.packages("klaR")

# Fungsi Statistik Deskriptif Data Iris 
summary(iris)
head(iris)
tail(iris)
names(iris)

#Penentuan Variable x dan y 
library('caret')
x = iris[,-5]
y = iris$Species

#Load Packages dan Buat Model Cross Validation =10
library('e1071')
library('naivebayes')
library('klaR')
library('MASS')
model=train(x,y,'nb',trControl=trainControl(method='cv',number=10)) 
  
#menunjukkan ringkasan model
model

# Mendapatkan Nilai Prediksi
predict(model$finalModel,x)

# Membandingkan Hasil Prediksi
table(predict(model$finalModel,x)$class,y)

# Memperoleh Hasil Plot Naive Bayes
naive_iris <- NaiveBayes(iris$Species ~ ., data = iris)
plot(naive_iris)
