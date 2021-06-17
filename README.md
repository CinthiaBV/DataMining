## Unit-3

## Unit-4



### <p align="center" > TECNOLÓGICO NACIONAL DE MÉXICO INSTITUTO TECNOLÓGICO DE TIJUANA SUBDIRECCIÓN ACADÉMICA DEPARTAMENTO DE SISTEMAS Y COMPUTACIÓN PERIODO: Agosto-Diciembre  2020</p>

###  <p align="center">  Carrera: Ing. En Sistemas Computacionales. 
### <p align="center"> Materia: 	Datos Masivos (BDD-1704 SC9A	).</p>

### <p align="center">  Maestro: Jose Christian Romero Hernandez	</p>
### <p align="center">  No. de control y nombre del alumno: 15211916 - Vargas Garcia Cinthia Gabriela</p>
### <p align="center">  No. de control y nombre del alumno: 15212354 - Francisco Javier Diaz Urias </p>

## Index

&nbsp;&nbsp;&nbsp;[Practice 1](#practice-1)  

&nbsp;&nbsp;&nbsp;[Practice 2](#practice-2)

&nbsp;&nbsp;&nbsp;[Practice 3](#practice-3)

&nbsp;&nbsp;&nbsp;[Practice 4](#practice-4)

&nbsp;&nbsp;&nbsp;[Practice 5](#practice-5)

&nbsp;&nbsp;&nbsp;[Homework](#homework)


&nbsp;&nbsp;&nbsp;[Test 3](#Test-3)

### &nbsp;&nbsp;Practice 1.

#### &nbsp;&nbsp;&nbsp;&nbsp; Instructions.


#### Analyze Logistic Regression 

#### &nbsp;&nbsp;&nbsp;&nbsp; Code.
````R
getwd()
setwd("C:/Users/cheli/Documents/DataMining-master/MachineLearning/LogisticRegression")
getwd()

# Importing the dataset
dataset <- read.csv('Social_Network_Ads.csv')
dataset <- dataset[, 3:5]

# Splitting the dataset into the Training set and Test set
# Install.packages('caTools')
library(caTools)
set.seed(123)
split <- sample.split(dataset$Purchased, SplitRatio = 0.75)
training_set <- subset(dataset, split == TRUE)
test_set <- subset(dataset, split == FALSE)

# Feature scaling
training_set[, 1:2] <- scale(training_set[, 1:2])
test_set[, 1:2] <- scale(test_set[, 1:2])

# Fitting Logistic Regression to Training set
classifier = glm(formula = Purchased ~ .,
                 family = binomial,
                 data = training_set)

# Predicting the Test set results
prob_pred = predict(classifier, type = 'response', newdata = test_set[-3])
prob_pred
y_pred = ifelse(prob_pred > 0.5, 1, 0)
y_pred

# Making the Confusion Metrix
cm = table(test_set[, 3], y_pred)
cm

# Using library ggplot2 visualize the data of the dataset on a graph
library(ggplot2)

# Visualize data for training set of estimated salary on 'x' and purchased on 'y'
ggplot(training_set, aes(x=EstimatedSalary, y=Purchased)) + geom_point() + 
  stat_smooth(method="glm", method.args=list(family="binomial"), se=FALSE)

# Visualize data for training set of Age on 'x' and purchased on 'y'
ggplot(training_set, aes(x=Age, y=Purchased)) + geom_point() + 
  stat_smooth(method="glm", method.args=list(family="binomial"), se=FALSE)

# Visualize data for test set of estimated salary on 'x' and purchased on 'y' 
ggplot(test_set, aes(x=EstimatedSalary, y=Purchased)) + geom_point() + 
  stat_smooth(method="glm", method.args=list(family="binomial"), se=FALSE)

# Visualize data for test set of Age on 'x' and purchased on 'y'
ggplot(test_set, aes(x=Age, y=Purchased)) + geom_point() + 
  stat_smooth(method="glm", method.args=list(family="binomial"), se=FALSE)

# Visualization the Training set result
# install.packages('ElemStatLearn') No work for me, 
# manual mode. Go to this URL https://cran.r-project.org/src/contrib/Archive/ElemStatLearn/
# Download with the latest date 2019-08-12 09:20	12M
# Then follow this page steps https://riptutorial.com/r/example/5556/install-package-from-local-source

# Import library ElemStatLearn
library(ElemStatLearn)


### &nbsp;&nbsp;Test 1.

#### &nbsp;&nbsp;&nbsp;&nbsp; Instructions.
  //Implement the K-Means grouping model with the Iris.csv dataset found 
  //at https://github.com/jcromerohdz/iris using the kmeans () method in R. 
  //Once the grouping model is obtained do the corresponding data visualization analysis.


# In this part we are using the training set to a new graph to visualize the training set results
set = training_set
X1 = seq(min(set[, 1]) - 1, max(set[, 1]) + 1, by = 0.01)
X2 = seq(min(set[, 2]) - 1, max(set[, 2]) + 1, by = 0.01)
grid_set = expand.grid(X1, X2)

#Give a name at the columns to use and predict also set the limit of the plot and other settings
colnames(grid_set) = c('Age', 'EstimatedSalary')
prob_set = predict(classifier, type = 'response', newdata = grid_set)
y_grid = ifelse(prob_set > 0.5, 1, 0)
plot(set[, -3],
     main = 'Logistic Regression (Training set)',
     xlab = 'Age', ylab = 'Estimated Salary',
     xlim = range(X1), ylim = range(X2))
contour(X1, X2, matrix(as.numeric(y_grid), length(X1), length(X2)), add = TRUE)
points(grid_set, pch = '.', col = ifelse(y_grid == 1, 'springgreen3', 'tomato'))
points(set, pch = 21, bg = ifelse(set[, 3] == 1, 'green4', 'red3'))


#  Import library ElemStatLearn
library(ElemStatLearn)

# In this part we are using the training set to a new graph to visualize the test set results
set = test_set
X1 = seq(min(set[, 1]) - 1, max(set[, 1]) + 1, by = 0.01)
X2 = seq(min(set[, 2]) - 1, max(set[, 2]) + 1, by = 0.01)
grid_set = expand.grid(X1, X2)

#Give a name at the columns to use and predict also set the limit of the plot and other settings
colnames(grid_set) = c('Age', 'EstimatedSalary')
prob_set = predict(classifier, type = 'response', newdata = grid_set)
y_grid = ifelse(prob_set > 0.5, 1, 0)
plot(set[, -3],
     main = 'Logistic Regression (Test set)',
     xlab = 'Age', ylab = 'Estimated Salary',
     xlim = range(X1), ylim = range(X2))
contour(X1, X2, matrix(as.numeric(y_grid), length(X1), length(X2)), add = TRUE)
points(grid_set, pch = '.', col = ifelse(y_grid == 1, 'springgreen3', 'tomato'))
points(set, pch = 21, bg = ifelse(set[, 3] == 1, 'green4', 'red3'))
````
#### Plots Practice 1

![](https://github.com/CinthiaBV/DataMining/blob/Unit-3/Unit-3/Images/EstimatedSalary-Purchased-training-set.png?raw=true)

![](https://github.com/CinthiaBV/DataMining/blob/Unit-3/Unit-3/Images/Age-Purchased-training-set.png?raw=true)

![](https://github.com/CinthiaBV/DataMining/blob/Unit-3/Unit-3/Images/EstimatedSalary-Purchased-test-set.png?raw=true)

![](https://github.com/CinthiaBV/DataMining/blob/Unit-3/Unit-3/Images/Age-Purchased-test-set.png?raw=true)

![](https://github.com/CinthiaBV/DataMining/blob/Unit-3/Unit-3/Images/Logistec%20regression-Training%20set-1.png?raw=true)

![](https://github.com/CinthiaBV/DataMining/blob/Unit-3/Unit-3/Images/Logistic%20training%20set%202.png?raw=true)

![](https://github.com/CinthiaBV/DataMining/blob/Unit-3/Unit-3/Images/Logistec%20regression-Test%20set-1.png?raw=true)

![](https://github.com/CinthiaBV/DataMining/blob/Unit-3/Unit-3/Images/Logistic%20test%20set%202.png?raw=true)

### &nbsp;&nbsp;Practice 2.

#### &nbsp;&nbsp;&nbsp;&nbsp; Instructions.

//Make the analysis corresponding to the R script of K-Nearest Neighbors (K-NN) which must be documented in its repository by

// putting in it its visual results and its /////detailed description of its observations as well as the source of the code.

#### K-Nearest Neighbors (K-NN).


#### &nbsp;&nbsp;&nbsp;&nbsp; Code.
````R

# K-Nearest Neighbors (K-NN)

# Importing the dataset
dataset = read.csv('Social_Network_Ads.csv')
dataset = dataset[3:5]

# Encoding the target feature as factor
dataset$Purchased = factor(dataset$Purchased, levels = c(0, 1))

# Splitting the dataset into the Training set and Test set
# install.packages('caTools')
library(caTools)
set.seed(123)
split = sample.split(dataset$Purchased, SplitRatio = 0.75)
training_set = subset(dataset, split == TRUE)
test_set = subset(dataset, split == FALSE)

# Feature Scaling
training_set[-3] = scale(training_set[-3])
test_set[-3] = scale(test_set[-3])

# Fitting K-NN to the Training set and Predicting the Test set results
library(class)
y_pred = knn(train = training_set[, -3],
             test = test_set[, -3],
             cl = training_set[, 3],
             k = 5,
             prob = TRUE)

# Making the Confusion Matrix
cm = table(test_set[, 3], y_pred)

# Visualising the Training set results
library(ElemStatLearn)
set = training_set
X1 = seq(min(set[, 1]) - 1, max(set[, 1]) + 1, by = 0.01)
X2 = seq(min(set[, 2]) - 1, max(set[, 2]) + 1, by = 0.01)
grid_set = expand.grid(X1, X2)
colnames(grid_set) = c('Age', 'EstimatedSalary')
y_grid = knn(train = training_set[, -3], test = grid_set, cl = training_set[, 3], k = 5)
plot(set[, -3],
     main = 'K-NN (Training set)',
     xlab = 'Age', ylab = 'Estimated Salary',
     xlim = range(X1), ylim = range(X2))
contour(X1, X2, matrix(as.numeric(y_grid), length(X1), length(X2)), add = TRUE)
points(grid_set, pch = '.', col = ifelse(y_grid == 1, 'springgreen3', 'tomato'))
points(set, pch = 21, bg = ifelse(set[, 3] == 1, 'green4', 'red3'))

# Visualising the Test set results
library(ElemStatLearn)
set = test_set
X1 = seq(min(set[, 1]) - 1, max(set[, 1]) + 1, by = 0.01)
X2 = seq(min(set[, 2]) - 1, max(set[, 2]) + 1, by = 0.01)
grid_set = expand.grid(X1, X2)
colnames(grid_set) = c('Age', 'EstimatedSalary')
y_grid = knn(train = training_set[, -3], test = grid_set, cl = training_set[, 3], k = 5)
plot(set[, -3],
     main = 'K-NN (Test set)',
     xlab = 'Age', ylab = 'Estimated Salary',
     xlim = range(X1), ylim = range(X2))
contour(X1, X2, matrix(as.numeric(y_grid), length(X1), length(X2)), add = TRUE)
points(grid_set, pch = '.', col = ifelse(y_grid == 1, 'springgreen3', 'tomato'))
points(set, pch = 21, bg = ifelse(set[, 3] == 1, 'green4', 'red3'))


````
#### Plots Practice 2

Knn set 

![](https://github.com/CinthiaBV/DataMining/blob/Unit-3/Unit-3/Images/knn.PNG?raw=true)


### &nbsp;&nbsp;Practice 3.

#### &nbsp;&nbsp;&nbsp;&nbsp; Instructions.

#### Make the analysis corresponding to the R script of the Desicion Tree, which must be documented in its repository, putting in it its visual results and its detailed description of its observations as well as the source code.

#### &nbsp;&nbsp;&nbsp;&nbsp; Code.
```R
# Decision Tree Classification

getwd()
setwd("C:/Users/cheli/Documents/Mineria de datos")
getwd()
# Importing the dataset
dataset = read.csv('Social_Network_Ads.csv')
dataset = dataset[3:5]

# Encoding the target feature as factor
dataset$Purchased = factor(dataset$Purchased, levels = c(0, 1))

# Splitting the dataset into the Training set and Test set
# install.packages('caTools')
library(caTools)
set.seed(123)
split = sample.split(dataset$Purchased, SplitRatio = 0.75)
training_set = subset(dataset, split == TRUE)
test_set = subset(dataset, split == FALSE)

# Feature Scaling
training_set[-3] = scale(training_set[-3])
test_set[-3] = scale(test_set[-3])

# Fitting Decision Tree Classification to the Training set
# install.packages('rpart')
library(rpart)
classifier = rpart(formula = Purchased ~ .,
                   data = training_set)

# Predicting the Test set results
y_pred = predict(classifier, newdata = test_set[-3], type = 'class')
y_pred
# Making the Confusion Matrix
cm = table(test_set[, 3], y_pred)
cm
# Visualising the Training set results import library ElemStatLearn
library(ElemStatLearn)

# In this part we are using the training set to a new graph to visualize the training set results
set = training_set
X1 = seq(min(set[, 1]) - 1, max(set[, 1]) + 1, by = 0.01)
X2 = seq(min(set[, 2]) - 1, max(set[, 2]) + 1, by = 0.01)
grid_set = expand.grid(X1, X2)

# Give a name at the columns to use and predict also set the limit of the plot and other settings
colnames(grid_set) = c('Age', 'EstimatedSalary')
y_grid = predict(classifier, newdata = grid_set, type = 'class')
plot(set[, -3],
     main = 'Decision Tree Classification (Training set)',
     xlab = 'Age', ylab = 'Estimated Salary',
     xlim = range(X1), ylim = range(X2))
contour(X1, X2, matrix(as.numeric(y_grid), length(X1), length(X2)), add = TRUE)
points(grid_set, pch = '.', col = ifelse(y_grid == 1, 'springgreen3', 'tomato'))
points(set, pch = 21, bg = ifelse(set[, 3] == 1, 'green4', 'red3'))

# Visualising the Test set results import library ElemStatLearn
library(ElemStatLearn)

# In this part we are using the training set to a new graph to visualize the training set results
set = test_set
X1 = seq(min(set[, 1]) - 1, max(set[, 1]) + 1, by = 0.01)
X2 = seq(min(set[, 2]) - 1, max(set[, 2]) + 1, by = 0.01)
grid_set = expand.grid(X1, X2)

# Give a name at the columns to use and predict also set the limit of the plot and other settings
colnames(grid_set) = c('Age', 'EstimatedSalary')
y_grid = predict(classifier, newdata = grid_set, type = 'class')
plot(set[, -3], main = 'Decision Tree Classification (Test set)',
     xlab = 'Age', ylab = 'Estimated Salary',
     xlim = range(X1), ylim = range(X2))
contour(X1, X2, matrix(as.numeric(y_grid), length(X1), length(X2)), add = TRUE)
points(grid_set, pch = '.', col = ifelse(y_grid == 1, 'springgreen3', 'tomato'))
points(set, pch = 21, bg = ifelse(set[, 3] == 1, 'green4', 'red3'))

# Plotting the tree to visualize the results of Decision tree classifier
plot(classifier)
text(classifier, cex=0.6)
```
#### Plots Practice 3

![](https://github.com/CinthiaBV/DataMining/blob/Unit-3/Unit-3/Images/Decision_tree_classifier%20training%20set%201.png?raw=true)

![](https://github.com/CinthiaBV/DataMining/blob/Unit-3/Unit-3/Images/Decision_tree_classifier%20training%20set%202.png?raw=true)

![](https://github.com/CinthiaBV/DataMining/blob/Unit-3/Unit-3/Images/Decision_tree_classifier%20test%20set%201.png?raw=true)

![](https://github.com/CinthiaBV/DataMining/blob/Unit-3/Unit-3/Images/Decision_tree_classifier%20test%20set%202.png?raw=true)

![](https://github.com/CinthiaBV/DataMining/blob/Unit-3/Unit-3/Images/plot%20decision%20tree.png?raw=true)

### &nbsp;&nbsp;Practice 4.

#### &nbsp;&nbsp;&nbsp;&nbsp; Instructions.
// Make the analysis corresponding to the R script of Random Forest which must be documented in its repository, 
//putting in it its visual results and its detailed description of its observations as well as the source code.

#### Random Forest visualization

#### &nbsp;&nbsp;&nbsp;&nbsp; Code.

````R
# Random Forest Classification

getwd()
setwd("/home/chris/Documents/itt/Enero_Junio_2020/Mineria_de_datos/DataMining/MachineLearning/RandomForest")
getwd()

# Importing the dataset
dataset = read.csv('Social_Network_Ads.csv')
dataset = dataset[3:5]

# Encoding the target feature as factor
dataset$Purchased = factor(dataset$Purchased, levels = c(0, 1))

# Splitting the dataset into the Training set and Test set
# install.packages('caTools')
library(caTools)
set.seed(123)
split = sample.split(dataset$Purchased, SplitRatio = 0.75)
training_set = subset(dataset, split == TRUE)
test_set = subset(dataset, split == FALSE)

# Feature Scaling
training_set[-3] = scale(training_set[-3])
test_set[-3] = scale(test_set[-3])

# Fitting Random Forest Classification to the Training set
# install.packages('randomForest')
library(randomForest)
set.seed(123)
classifier = randomForest(x = training_set[-3],
                          y = training_set$Purchased,
                          ntree =10)


# Predicting the Test set results
y_pred = predict(classifier, newdata = test_set[-3])
y_pred

# Making the Confusion Matrix
cm = table(test_set[, 3], y_pred)
cm

# Visualising the Training set results
library(ElemStatLearn)
set = training_set
X1 = seq(min(set[, 1]) - 1, max(set[, 1]) + 1, by = 0.01)
X2 = seq(min(set[, 2]) - 1, max(set[, 2]) + 1, by = 0.01)
grid_set = expand.grid(X1, X2)
colnames(grid_set) = c('Age', 'EstimatedSalary')
y_grid = predict(classifier, grid_set)
plot(set[, -3],
     main = 'Random Forest Classification (Training set)',
     xlab = 'Age', ylab = 'Estimated Salary',
     xlim = range(X1), ylim = range(X2))
contour(X1, X2, matrix(as.numeric(y_grid), length(X1), length(X2)), add = TRUE)
points(grid_set, pch = '.', col = ifelse(y_grid == 1, 'springgreen3', 'tomato'))
points(set, pch = 21, bg = ifelse(set[, 3] == 1, 'green4', 'red3'))

# Visualising the Test set results
library(ElemStatLearn)
set = test_set
X1 = seq(min(set[, 1]) - 1, max(set[, 1]) + 1, by = 0.01)
X2 = seq(min(set[, 2]) - 1, max(set[, 2]) + 1, by = 0.01)
grid_set = expand.grid(X1, X2)
colnames(grid_set) = c('Age', 'EstimatedSalary')
y_grid = predict(classifier, grid_set)
plot(set[, -3], main = 'Random Forest Classification (Test set)',
     xlab = 'Age', ylab = 'Estimated Salary',
     xlim = range(X1), ylim = range(X2))
contour(X1, X2, matrix(as.numeric(y_grid), length(X1), length(X2)), add = TRUE)
points(grid_set, pch = '.', col = ifelse(y_grid == 1, 'springgreen3', 'tomato'))
points(set, pch = 21, bg = ifelse(set[, 3] == 1, 'green4', 'red3'))

# Choosing the number of trees
plot(classifier)

````

#### Plots Practice 4

![](https://github.com/CinthiaBV/DataMining/blob/Unit-3/Unit-3/Images/Capture.PNG?raw=true)

![](https://github.com/CinthiaBV/DataMining/blob/Unit-3/Unit-3/Images/Capture1.PNG?raw=true)

![](https://github.com/CinthiaBV/DataMining/blob/Unit-3/Unit-3/Images/Capture2.PNG?raw=true)

![](https://github.com/CinthiaBV/DataMining/blob/Unit-3/Unit-3/Images/Capture3.PNG?raw=true)


### &nbsp;&nbsp;Practice 5.

#### &nbsp;&nbsp;&nbsp;&nbsp; Instructions.

#### Make the analysis corresponding to the R script of the SVM, which must be documented in its repository, putting in it its visual results and its detailed description of its observations as well as the source code.

#### &nbsp;&nbsp;&nbsp;&nbsp; Code.

```R
# Support Vector Machine (SVM)
# Set our workspace
getwd()
setwd("C:/Users/cheli/Documents/Mineria de datos")
getwd()

# Importing the dataset
dataset = read.csv('Social_Network_Ads.csv')
dataset = dataset[3:5]

# Encoding the target feature as factor
dataset$Purchased = factor(dataset$Purchased, levels = c(0, 1))

# Splitting the dataset into the Training set and Test set
# install.packages('caTools')
library(caTools)
set.seed(123)
split = sample.split(dataset$Purchased, SplitRatio = 0.75)
training_set = subset(dataset, split == TRUE)
test_set = subset(dataset, split == FALSE)

# Feature Scaling
training_set[-3] = scale(training_set[-3])
test_set[-3] = scale(test_set[-3])

# Fitting SVM to the Training set
# install.packages('e1071')
library(e1071)
classifier = svm(formula = Purchased ~ .,
                 data = training_set,
                 type = 'C-classification',
                 kernel = 'linear')
svm
# Predicting the Test set results
y_pred = predict(classifier, newdata = test_set[-3])
y_pred
# Making the Confusion Matrix
cm = table(test_set[, 3], y_pred)
cm
# Visualising the Training set results, import the library  ElemStatLearn
library(ElemStatLearn)

# In this part we are using the training set to a new graph to visualize the training set results
set = training_set
X1 = seq(min(set[, 1]) - 1, max(set[, 1]) + 1, by = 0.01)
X2 = seq(min(set[, 2]) - 1, max(set[, 2]) + 1, by = 0.01)
grid_set = expand.grid(X1, X2)

# Give a name at the columns to use and predict also set the limit of the plot and other settings
colnames(grid_set) = c('Age', 'EstimatedSalary')
y_grid = predict(classifier, newdata = grid_set)
plot(set[, -3],
     main = 'SVM (Training set)',
     xlab = 'Age', ylab = 'Estimated Salary',
     xlim = range(X1), ylim = range(X2))
contour(X1, X2, matrix(as.numeric(y_grid), length(X1), length(X2)), add = TRUE)
points(grid_set, pch = '.', col = ifelse(y_grid == 1, 'springgreen3', 'tomato'))
points(set, pch = 21, bg = ifelse(set[, 3] == 1, 'green4', 'red3'))

# Visualising the Test set results, import the library  ElemStatLearn
library(ElemStatLearn)

# In this part we are using the training set to a new graph to visualize the training set results
set = test_set
X1 = seq(min(set[, 1]) - 1, max(set[, 1]) + 1, by = 0.01)
X2 = seq(min(set[, 2]) - 1, max(set[, 2]) + 1, by = 0.01)
grid_set = expand.grid(X1, X2)

# Give a name at the columns to use and predict also set the limit of the plot and other settings
colnames(grid_set) = c('Age', 'EstimatedSalary')
y_grid = predict(classifier, newdata = grid_set)
plot(set[, -3], main = 'SVM (Test set)',
     xlab = 'Age', ylab = 'Estimated Salary',
     xlim = range(X1), ylim = range(X2))
contour(X1, X2, matrix(as.numeric(y_grid), length(X1), length(X2)), add = TRUE)
points(grid_set, pch = '.', col = ifelse(y_grid == 1, 'springgreen3', 'tomato'))
points(set, pch = 21, bg = ifelse(set[, 3] == 1, 'green4', 'red3'))
```
#### Plots Practice 5

![](https://github.com/CinthiaBV/DataMining/blob/Unit-3/Unit-3/Images/SVM%20training%20set%201.png?raw=true)

![](https://github.com/CinthiaBV/DataMining/blob/Unit-3/Unit-3/Images/SVM%20training%20set%202.png?raw=true)

![](https://github.com/CinthiaBV/DataMining/blob/Unit-3/Unit-3/Images/SVM%20test%20set%201.png?raw=true)

![](https://github.com/CinthiaBV/DataMining/blob/Unit-3/Unit-3/Images/SVM%20test%20set%202.png?raw=true)

### &nbsp;&nbsp;Homework.

#### &nbsp;&nbsp;&nbsp;&nbsp; Instructions.

What is the goal of the Euclidean distance for the K-Nearest Neighbors (K-NN) machine learning model?
Explain the equating of the Eclidean distance in your own words?

### Euclidean Distance

In mathematics, algebra, geometry, and more specifically in real analysis, complex analysis, and analytical geometry, it is a non-negative function used in various contexts to calculate the distance between two points, first in the plane and then in space. It is also used to define the distance between two points in other types of spaces of three or more dimensions. And to find the length of a segment defined by two points of a line, of the plane or of spaces of greater dimension.

Equation

The equation is simple, we take our coordinates from our points, we subtract, we subtract the values (x2 - x1), we raise it to the square and we add the result of the operation of the second point (y2-y1) to the square, to finish we take the square root of the result .

KNN R

Within the kNN algorithm, the most used distance measures are: Euclidean distance, Minkowski distance, Manhattan distance, Cosine distance and Jaccard distance. These are not the only ones, the kNN algorithm can use any other measure of distance, although with these we will cover the vast majority of cases.

Euclidean Distance

The Euclidean distance is based on the Pythagorean theorem, according to which, the hypotenuse squared is equal to the sum of the squared legs.

This formula will work regardless of the number of variables there are. Starting from the Pythagorean theorem, we can find the distance in a straight line between two points, that is, the Euclidean distance. In the following image we can see how the distance between points p and q would be calculated.

Thus, since the Euclidean distance is one of the possible distance measures that the kNN algorithm can use.

### &nbsp;&nbsp;Test 3.

#### &nbsp;&nbsp;&nbsp;&nbsp; Instructions.

#### Implement the Naive Bayes classification model with the dataset
Social_Network_Ads.csv and using the e1071 library with the naiveBayes () function.
Once the classifier is obtained, do the data visualization analysis
correspondent.

#### &nbsp;&nbsp;&nbsp;&nbsp; Code.

```R
getwd()
setwd("C:/Users/cheli/Documents/Mineria de datos")
getwd()

dataset = read.csv('Social_Network_Ads.csv')
dataset = dataset[3:5]

# Encoding the target feature as factor
dataset$Purchased = factor(dataset$Purchased, levels = c(0, 1))

# Splitting the dataset into the Training set and Test set
# install.packages('caTools')
library(caTools)
set.seed(123)
split = sample.split(dataset$Purchased, SplitRatio = 0.75)
training_set = subset(dataset, split == TRUE)
test_set = subset(dataset, split == FALSE)

# Feature Scaling
training_set[-3] = scale(training_set[-3])
test_set[-3] = scale(test_set[-3])

# Fitting  Naive Bayes  classifier to the Training set
# Install.packages('e1071')
library(e1071)
classifier = naiveBayes(x = training_set[-3],
                        y = training_set$Purchased)
naiveBayes

# Predicting the Test set results
y_pred = predict(classifier, newdata = test_set[-3])
y_pred

# Making the Confusion Matrix
cm = table(test_set[, 3], y_pred)
cm

# Visualising the Training set results, first import the library ElemStatLearn 
library(ElemStatLearn)

# In this part we are using the training set to a new graph to visualize the training set results
set = training_set
X1 = seq(min(set[, 1]) - 1, max(set[, 1]) + 1, by = 0.01)
X2 = seq(min(set[, 2]) - 1, max(set[, 2]) + 1, by = 0.01)
grid_set = expand.grid(X1, X2)

# Give a name at the columns to use and predict also set the limit of the plot and other settings
colnames(grid_set) = c('Age', 'EstimatedSalary')
y_grid = predict(classifier, newdata = grid_set)
plot(set[, -3],
     main = ' Naive Bayes  Classifier (Training set)',
     xlab = 'Age', ylab = 'Estimated Salary',
     xlim = range(X1), ylim = range(X2))
contour(X1, X2, matrix(as.numeric(y_grid), length(X1), length(X2)), add = TRUE)
points(grid_set, pch = '.', col = ifelse(y_grid == 1, 'springgreen3', 'tomato'))
points(set, pch = 21, bg = ifelse(set[, 3] == 1, 'green4', 'red3'))

# Visualising the Test set results, first import the library ElemStatLearn
library(ElemStatLearn)

# In this part we are using the training set to a new graph to visualize the training set results
set = test_set
X1 = seq(min(set[, 1]) - 1, max(set[, 1]) + 1, by = 0.01)
X2 = seq(min(set[, 2]) - 1, max(set[, 2]) + 1, by = 0.01)
grid_set = expand.grid(X1, X2)

# Give a name at the columns to use and predict also set the limit of the plot and other settings
colnames(grid_set) = c('Age', 'EstimatedSalary')
y_grid = predict(classifier, newdata = grid_set)
plot(set[, -3], main = ' Naive Bayes  Classifier (Test set)',
     xlab = 'Age', ylab = 'Estimated Salary',
     xlim = range(X1), ylim = range(X2))
contour(X1, X2, matrix(as.numeric(y_grid), length(X1), length(X2)), add = TRUE)
points(grid_set, pch = '.', col = ifelse(y_grid == 1, 'springgreen3', 'tomato'))
points(set, pch = 21, bg = ifelse(set[, 3] == 1, 'green4', 'red3'))
```
#### Plots Test 3

![](https://github.com/CinthiaBV/DataMining/blob/Unit-3/Unit-3/Images/test%203%20naive%20bayes%20training%20set%201.png?raw=true)

![](https://github.com/CinthiaBV/DataMining/blob/Unit-3/Unit-3/Images/test%203%20naive%20bayes%20training%20set%202.png?raw=true)

![](https://github.com/CinthiaBV/DataMining/blob/Unit-3/Unit-3/Images/test3%20naive%20bayes%20test%20set%201.png?raw=true)

![](https://github.com/CinthiaBV/DataMining/blob/Unit-3/Unit-3/Images/test3%20naive%20bayes%20test%20set%202.png?raw=true)

### Link of Evaluation

https://youtu.be/VPxcUOR3qyg

### <p align="justify">  
Contents
 
Pair Programming 

What is pair programming? 

Practice in pair programming 

Advantages and disadvantages of pair programming 

What are the benefits of this approach? 

Pair Programming
 
<div align="justify">Developing new software is not an easy process. Depending on the size of the program, a large number of potential junctures, roles, and problematic issues will need to be considered. Even the most experienced software developers can become disoriented. Hence, in recent years other more modern working methods have been developed that allow more efficient programming and generate error-free code: Scrum and Kanban serve, for example, to improve the complete system.
Pair programming does not try to be all that encompassing: developers always work in pairs on the code. How does it work and what are the advantages of this working method?
What is pair programming?
 
The method known as pair programming is used mainly in agile software development and, more specifically, in extreme programming (XP). Pair programming specifies that there are always two people working on the code at the same time and that they sit together as much as possible. One is in charge of writing the code and the other of supervising it in real time. At the same time, they are constantly exchanging impressions: they discuss problems, find solutions and develop creative ideas.
These two workers are typically assigned different roles: the programmer who has been assigned the pilot role is in charge of writing the code. The programmer who has been assigned the copilot role is in charge of monitoring that code. One of the rules of pair programming states that these two roles are exchanged regularly (at short intervals). In this way, a possible hierarchical gap is avoided: equality between both workers is promoted and a fluid exchange of roles is achieved.

n addition, the workspace should ideally also be tailored to the specific requirements of pair programming. Each worker must have their own mouse, keyboard and screen, which will always show the same information as the colleague's.
Somewhat less common is the method called remote pair programming. In this case, the programmers do not sit together, but are located in completely different places. For this method to work, you must have special technical solutions. Even despite the distance, colleagues must have a direct line of communication and must be able to access the code and view modifications in real time.
Practice in pair programming
 
In practice, this is usually a collaboration between two developers with different degrees of experience: thus, a more experienced worker can pass on their knowledge to their younger colleagues directly through practice. On the other hand, it is possible that a younger worker will come up with other ideas, perhaps more innovative, that they can contribute to the project.
Likewise, a mix of workers from different industries can also be quite beneficial: if an old-school programmer collaborates with a designer, the combination of their experiences can be quite helpful for both.

The working method is very useful mainly for large projects. The “four eyes” principle is especially effective when you have to deal with large amounts of code that also needs to be changed regularly. It guarantees that the best possible version of a fragment will always be inserted in the source text, reducing the amount of errors, so that it will not be necessary to carry out so many retouching. Post-monitoring of very long source codes requires a lot of time and effort, so it is best if these codes are set error-free from scratch as far as possible.
However, it is not always mandatory that this collaboration is between the same colleagues, even in the case of the same project. In fact, it can be beneficial to mix these pairs regularly. This way, all team members can get a good idea of ​​the full source text. This allows the success of the project to be less dependent on the different people involved. If one of them fails, it does not jeopardize the entire project, since the rest can compensate for its absence.
Advantages and disadvantages of pair programming
 
Working as a couple on a project, whether it is scheduling or otherwise, has many advantages. In general, four eyes see much more than just two - the pair programming method minimizes the risk of errors. While one person writes the code, the other visualizes it and concentrates only on finding errors. In general, it is quite difficult for us to detect the errors themselves. It is usually our colleagues who detect them most quickly.

Another of the great advantages derived from communication is the constant development of creativity: the constant exchange that takes place between the pair of programmers causes ideas that perhaps would not be had if the work were individual. Intercom also ensures that problems can be better solved in less time. Well, while a person who works alone can be satisfied with the first option that seems best to him, the people involved in pair programming must always justify their decisions to the rest. It is possible that they have another perception of the problem and are not satisfied with the solution that is proposed to them. This generates a debate in which new ideas are often presented that lead to a much better code.
Good code is also concise code: experience dictates that source text generated by pair programming tends to be shorter in layout and therefore more efficient. This allows a later saving in resources in case of maintenance and adaptation.
As we have already mentioned, this technique can also be used to allow more experienced workers to share their knowledge with their younger colleagues. This not only takes advantage of the essential advantage of pair programming, which is the generation of high-quality code, but can also be used simultaneously for training purposes.

However, this is all very time consuming: two programmers work together much faster than one alone, but no more than two programmers working separately. This means that this method makes projects progress more slowly or requires more staff, which in turn increases costs. Supporters of pair programming estimate that these overtime is compensated because the generated code contains fewer errors, is better structured in general and requires much less maintenance.
Another possible downside is that pair programming is suitable for team building, but only if both partners work well together. With such a close collaboration, their problems with each other may slow down the results or end up escalating to something much worse. It is for this reason that the assignment of pairs in this method cannot be done randomly. The ideal would be to work with a different partner each time, but this only works well if there is harmony in the whole team
 
What are the benefits of this approach?
 
Greater discipline: The presence of observing prevents the driver from being distracted from his tasks and forces him to do things well.
Greater motivation: Programming in pairs is more enjoyable than programming alone, being an important motivation for the work team.
Increased long-term productivity: According to a study, pair programming increases development time by 15%, but in return provides more quality in the design, reduces defects and improves communication between team members.
Better learning: The driver can be accompanied by an observer more experienced than him, or vice versa. They are even likely to have a similar skill level in different fields. As a result, at least one of you will learn the best way: watching an expert work.
Risk reduction: As the code will be subject to constant review, the risk of making mistakes that take us away from the desired solution will be reduced.

Bibliography
 
1 & 1 IONOS Inc. (2020, September 30). Pair Programming. IONOS Digital Guide.
https://www.ionos.mx/digitalguide/paginas-web/desarrollo-web/pair-programming/
 
A. (2016, November 3). Pair programming: improving the development process. 4R Solutions | Web & Mobile Design, Development and Programming.
https://www.4rsoluciones.com/blog/pair-programming-mejorando-el-proceso-dedesarrollo-2

## Unit-2


### <p align="center" > TECNOLÓGICO NACIONAL DE MÉXICO INSTITUTO TECNOLÓGICO DE TIJUANA SUBDIRECCIÓN ACADÉMICA DEPARTAMENTO DE SISTEMAS Y COMPUTACIÓN PERIODO: Febrero-Junio  2021</p>

###  <p align="center">  Carrera: Ing. En Sistemas Computacionales. 
### <p align="center"> Materia: 	Minería de Datos  (BDD-1704 SC9A	).</p>

### <p align="center">  Maestro: Jose Christian Romero Hernandez	</p>
### <p align="center">  No. de control y nombre del alumno: 15211916 - Vargas Garcia Cinthia Gabriela</p>
### <p align="center">  No. de control y nombre del alumno: 15212354 - Francisco Javier Diaz Urias </p>

### Index

&nbsp;&nbsp;&nbsp;[Practice_1 ](#practice_2)  

&nbsp;&nbsp;&nbsp;[Research Data Mining](#Research Data Mining)  

&nbsp;&nbsp;&nbsp;[Test_2](#Test_2)  

### &nbsp;&nbsp;Practice_1.

#### &nbsp;&nbsp;&nbsp;&nbsp; Instructions.

// 1. Search for a data source with csv format (Free theme)

``` R
#Iris csv
#added the necessary libraries
library (stats) #contains the method to implement kmeans "
library (cluster) # contains everything to evaluate clusters "
library (ggplot2) #contains the necessary tools for graphing and interpreting data


#We indicate the path of the folder where the file to be used is located
getwd()
setwd ("C:/Users/filos/Desktop/Test4/")
getwd ()

# We import the data from the specified file type csv
dataset = read.csv ('iris.csv')

# Delete the species column and scale the data since we only need numerical values
dataset.scale <- scale (dataset [, -5])

#The previous count of each type of species is carried out
dataset $ species

# Application of K MEANS this receives two parameters: data and number of clusters to form.

datameans = kmeans (dataset.scale, 3)
datameans

# Get group to which the data belongs is obtained according to the kmeans function.
datameans $ cluster
table (datameans $ cluster, dataset $ species)

# We assign the class variable, the numerical data as a factor of the data set.
class = factor (dataset [, 5]) ## classifies and stores data in levels

# We assign to the variable predicts, the classes predicted by kmeans.
predicts = NULL

# The function mode will count the number of records of each class
mode = function (x) {
  ux = unique (x)
  ux [which.max (tabulate (match (x, ux)))]
}

# We segment the clustering, We apply the mode function which will return the highest number of occurrences linked to the assigned class.
predicts [datameans $ cluster == mode (datameans $ cluster [1:50])] = "setosa"
predicts [datameans $ cluster == mode (datameans $ cluster [50: 100])] = "versicolor"
predicts [datameans $ cluster == mode (datameans $ cluster [100: 150])] = "virginica"

# The variable is transformed  predicts to factor.
predicts = factor (predicts)
predicts

# Confusion matrix

df = table (class, predicts)
df
precision = (sum (diag (df))) / sum (df)
precision

## we graph
clusplot (dataset, datameans $ cluster,
          shade = TRUE, color = TRUE, plotchar = FALSE, span = TRUE,
          labels = 2, main = paste ('Clusters'), xlab = 'Sepal', ylab = 'Petal')

datameans $ size
datameans $ totss
datameans $ withinss
datameans $ iter
datameans $ tot.withinss
datameans $ betweenss

```

## Plot



It consists of carrying out a random experiment only once and observing whether a certain event occurs or not, where p is the probability that this is the case (success) and q = 1-p the probability that it is not (failure). In reality it is not more than one that can only take two modalities, that is why the fact of calling the possible results of the result tests success or failure. We could therefore define this experiment by means of a v.a. discrete X that takes the values ​​X = 0 if the event does not occur, and X = 1 otherwise.

Binomial distribution

The binomial distribution is a discrete probability distribution that measures the number of successes in a sequence of n independent BERNOULLI trials, with a fixed probability p of occurrence of success between trials. • There are many situations in which a binomial experience. Each of the experiments is independent of the rest (the probability of the result of one experiment does not depend on the result of the rest). The result of each experiment must admit only two categories (which are called success and failure). The probabilities of both possibilities must be constant in all the experiments (they are denoted as pyqopy 1-p). • The variable that measures the number of successes that have occurred in the n experiments is designated by X. • When they occur Under these circumstances, the variable X is said to follow a binomial probability distribution, and is denoted B (n, p)

Poisson distribution

It is a discrete model, but in which the set of values ​​with non-zero probability is not finite, but countable. • This distribution is usually used for counts of the number of individuals per unit of time, space, etc. • Properties from the Poisson model • 1) Expectation: E (X) = λ • 2) Variance: V (X) = λ • In this distribution, the expectation and the variance coincide.

Normal distribution

In statistics and probability, it is called a normal distribution, Gaussian distribution or Gaussian distribution, to one of the probability distributions of a continuous variable that most often appears approximate in real phenomena. • The graph of its density function has a bell shape and is symmetric with respect to a certain parameter. This curve is known as a Gaussian bell and is the graph of a Gaussian function.

Gamma distribution

In statistics the gamma distribution is a continuous probability distribution with two parameters k and λ whose density function for values ​​x> 0 is • Here e is the number and and Γ is the gamma function. For values ​​the that is Γ (k) = (k - 1)! (the factorial of k - 1). In this case - for example to describe a Poisson process - they are called the Erlang distribution with a parameter θ = 1 / λ. • The expected value and the variance of a random variable X of gamma distribution are E * X + = k / λ = kθ V * X + = k / λ2 = kθ2.

Student distribution

In probability and statistics, the t (Student's) distribution is a probability distribution that arises from the problem of estimating the mean of a normally distributed population when the sample size is small. It arises, in most practical statistical studies, when the standard deviation of a population is unknown and must be estimated from the data of a sample. • The t-Student test was developed in 1899 by the English chemist William Sealey Gosset (1876-1937), while working on quality control techniques for the Guinness distilleries in Dublin. Because at the distillery, his job was not initially that of a statistician and his dedication should be exclusively aimed at improving production costs, he published his findings anonymously by signing his articles with the name of "Student".

### &nbsp;&nbsp;Test_2.

#### &nbsp;&nbsp;&nbsp;&nbsp; Instructions.

// Develop the following problem with R and RStudio for knowledge extraction
that the problem requires.

               
#### Create an R script 
     
</br>

#### &nbsp;&nbsp;&nbsp;&nbsp; Code.

``` R
# Get the path and select the directory of file to use
getwd()
setwd("C:/Users/cheli/Documents/DataMining-master/Datasets")
getwd()

# Read the file to use
movies <- read.csv("Project-Data.csv")

# Show the first rows data of the file to use
head(movies)

# Show the lat rows of the file
tail(movies)

#Summary of the movies
summary(movies)

# Rename the columns 
colnames(movies) <- c("Day_Week","Director","Genre","Title","Release_Date","Studio","Adjusted Gross","Budget","Gross","IMDb_Rating","MovieLens_Rating","Overseas","Overseas%","Profit","Profit%","Runtime","US","GrossPor")

# Filter the data to eliminate unnecessary data
filter_movies <- (movies$Genre=="action" | movies$Genre=="adventure" | movies$Genre=="animation" | movies$Genre=="comedy" | movies$Genre=="drama") & (movies$Studio=="Buena Vista Studios" | movies$Studio=="Fox" | movies$Studio=="Paramount Pictures" | movies$Studio=="Sony" | movies$Studio=="Universal" | movies$Studio=="WB")

# Shows the previously made filter, each data shows it as true or false
filter_movies 

# Compares the data that was loaded with the array 
movies <- movies[filter_movies,]
head(movies)

# Load the library to use, in this case to use plots we are using ggplot2
library(ggplot2) 

# Declaration of the input data and set values to "x" and "y"
gg <- ggplot(movies, aes(x=Genre, y=GrossPor, color=Studio,Size=Budget))

# Create a plot using geom_gitter and geom_boxplot to graph the values, also customize the plot the closet thing to the example
gg + geom_jitter(aes(color=Studio,size=Budget)) + geom_boxplot(size=0.5,alpha=0.5,color="Black",outlier.shape = NA)+ theme(
  plot.title = element_text(color="Black", size=16, hjust = 0.5),
  axis.title.x = element_text(color="blue", size=16),
  axis.title.y = element_text(color="blue", size=16)
)  +  ggtitle("Domestic Gross % by Genre") + ylab("Gross %US")  

```


![](https://github.com/CinthiaBV/DataMining/blob/Unit-4/Unit-4/Images/plot4.PNG?raw=true)

## Video 


### &nbsp;&nbsp; Video Link Unit_2 .
 https://youtu.be/hKKwGGqpfUM


https://youtu.be/CdsfLaOYCGU

