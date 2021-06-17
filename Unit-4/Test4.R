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
