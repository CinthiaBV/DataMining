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

