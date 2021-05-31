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

### &nbsp;&nbsp;Practice 1.

#### &nbsp;&nbsp;&nbsp;&nbsp; Instructions.

#### Homework analyze the follow atomation backwardElimination function 

#### &nbsp;&nbsp;&nbsp;&nbsp; Code.
````R
getwd()
setwd("C:/Users/cheli/Documents/DataMining-master/MachineLearning/MultipleLinearRegression")
getwd()

# Importing the dataset
dataset <- read.csv('50_Startups.csv')

# Encoding categorical data 
dataset$State = factor(dataset$State,
                       levels = c('New York', 'California', 'Florida'),
                       labels = c(1,2,3))

dataset
# Splitting the dataset into the Training set and Test set
Install.packages('caTools')
library(caTools)
set.seed(123)
split <- sample.split(dataset$Profit, SplitRatio = 0.8)
training_set <- subset(dataset, split == TRUE)
test_set <- subset(dataset, split == FALSE)

# Fitting Multiple Linear Regression to the Training set
#regressor = lm(formula = Profit ~ R.D.Spend + Administration + Marketing.Spend + State)
regressor = lm(formula = Profit ~ .,
               data = training_set )

summary(regressor)

# Prediction the Test set results
y_pred = predict(regressor, newdata = test_set)
y_pred

# Assigment: visualize the siple liner regression model with R.D.Spend 

# Building the optimal model using Backward Elimination
regressor = lm(formula = Profit ~ R.D.Spend + Administration + Marketing.Spend + State,
               data = dataset )
summary(regressor)

regressor = lm(formula = Profit ~ R.D.Spend + Administration + Marketing.Spend,
               data = dataset )
summary(regressor)

regressor = lm(formula = Profit ~ R.D.Spend + Marketing.Spend,
               data = dataset )
summary(regressor)

regressor = lm(formula = Profit ~ R.D.Spend + Marketing.Spend,
               data = dataset )
summary(regressor)

y_pred = predict(regressor, newdata = test_set)
y_pred

# Homework analyze the follow atomation backwardElimination function 

#Create the function and assign the parameters
backwardElimination <- function(x, sl) {
  # Create a variable 'numVars' and its equal a the length of 'x'
  numVars = length(x)
  # Create a cycle  for each value  of continuous data starting from its first value the function 
  for (i in c(1:numVars)){
    #Create the variable 'regressor' for the values of the linear regression
    regressor = lm(formula = Profit ~ ., data = x)
    #Create the variable 'maxVar' in this have the vector with de max coefficient
    maxVar = max(coef(summary(regressor))[c(2:numVars), "Pr(>|t|)"])
    #If 'maxVar' is greater then 'sl' execute the variable 'j' and 'j' its deleted from 'x'
    if (maxVar > sl){
      j = which(coef(summary(regressor))[c(2:numVars), "Pr(>|t|)"] == maxVar)
      x = x[, -j]
    }
    # Remove one unit from the length of our dataset, from the for, and return the sum of all the values inside regressor, the cycle continues until  p-value.
    numVars = numVars - 1
  }
  return(summary(regressor))
}

SL = 0.05
#dataset = dataset[, c(1,2,3,4,5)]
training_set
backwardElimination(training_set, SL)
````

### &nbsp;&nbsp;Practice 2.

#### &nbsp;&nbsp;&nbsp;&nbsp; Instructions.

#### Find 20 more functions in R and make an example of it.

#### &nbsp;&nbsp;&nbsp;&nbsp; Code.


