## Unit-3


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
