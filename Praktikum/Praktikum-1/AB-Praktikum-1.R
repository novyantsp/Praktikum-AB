# Set Working Directory 
setwd("C:/Users/05211740000082/Documents/AB/Praktikum/Praktikum-1")

# --- No 1 ---- #

# a. Ubah file dari link tersebut ke dalam bentuk .csv 
  ## Import from url 
  dataset <- read.table("http://lib.stat.cmu.edu/datasets/Andrews/T02.1")
  ## Write to csv 
  write.csv(dataset, "dataset.csv")

# b. import dari file text
  ## import from text
  test <- read.table("test.txt")
  
# c. Import dari Web URL 
  ## import from web url
  dataset <- read.table("http://lib.stat.cmu.edu/datasets/Andrews/T02.1")
  
# --- No 2 ---- #
  
# a. Iris
  ## Load Data Iris 
  data(iris)

# b. Mtcars
  ## Load Data mtcars
  mtcars <- read.csv("mtcars.csv")
  
# c. Adult 
  ## Load Data Adult 
  adult <- read.csv("adult.csv")
  
# d. Dataset Link 1
  ## Load Data Dataset Link 1 
  zeamays <- read.table("http://lib.stat.cmu.edu/datasets/Andrews/T02.1")	
  
# --- No 3 ---- #
  
# a. Summary()
  ## Iris
  summary(iris)
  ## mtcars
  summary(mtcars)
  ## adult
  summary(adult)
  ## dataset link 1
  summary(zeamays)
  
# b. Head and Tail
  ## Iris
  head(iris)
  tail(iris)
  ## mtcars
  head(mtcars)
  tail(mtcars)
  ## adult
  head(adult)
  tail(adult)
  ## dataset link 1
  head(zeamays)
  tail(zeamays)
  
# c. Column Name
  ## Iris
  colnames(iris)
  ## mtcars
  colnames(mtcars)
  ## adult
  colnames(adult)
  ## dataset link 1
  colnames(zeamays)
  
# --- No 4 ---- #
  
# a. Iris
  ## Scatterplot Iris 
  plot(iris$Petal.Length, 
       iris$Petal.Width,
       xlab = "Petal Length",
       ylab = "Petal Width",
       pch=23, 
       bg=c("blue","green","red")[unclass(iris$Species)], 
       main="Scatterplot Iris")
  
# b. mtcars
  ## Make mtcars$X as factor
  mtcars$X <- as.factor(mtcars$X)
  
  ## Scatterplot mtcars
  symbols(x=mtcars$X, 
          y=mtcars$mpg, 
          circles=mtcars$cyl,
          inches=1/9, 
          ann=F, 
          bg="hotpink", 
          fg=NULL)
  