## Unit-2


### <p align="center" > TECNOLÓGICO NACIONAL DE MÉXICO INSTITUTO TECNOLÓGICO DE TIJUANA SUBDIRECCIÓN ACADÉMICA DEPARTAMENTO DE SISTEMAS Y COMPUTACIÓN PERIODO: Agosto-Diciembre  2020</p>

###  <p align="center">  Carrera: Ing. En Sistemas Computacionales. 
### <p align="center"> Materia: 	Minería de Datos  (BDD-1704 SC9A	).</p>

### <p align="center">  Maestro: Jose Christian Romero Hernandez	</p>
### <p align="center">  No. de control y nombre del alumno: 15211916 - Vargas Garcia Cinthia Gabriela</p>
### <p align="center">  No. de control y nombre del alumno: 15212354 - Francisco Javier Diaz Urias </p>

### Index
&nbsp;&nbsp;&nbsp;[Practice 1](#practice-1)  

&nbsp;&nbsp;&nbsp;[Test 2](#Test-2)  

### &nbsp;&nbsp;Practice 1.

#### &nbsp;&nbsp;&nbsp;&nbsp; Instructions.

// 1. Search for a data source with csv format (Free theme)

// 2. Read the csv and analyze the data with R

// 3. Generate three graphs with R that tells the history of the data, the first one that is a dot scatter graph, the second that is a faceted graph and the third a graph that tells us something statistical like the distribution of the data and containing the theme layer.
   


               
#### Create an R script 
     
</br>

#### &nbsp;&nbsp;&nbsp;&nbsp; Code.

``` R
#Install library ggplot2

library(ggplot2)

# Load the file csv Happiness

TimeUse <- read.csv(file.choose())
TimeUse

# Summary of file 

summary.data.frame(TimeUse)

# Show head 

head(TimeUse)

# Dot scatter graph
# Country and time spendign in eating based on their sex

ggplot(data = TimeUse) +
  geom_point(mapping = aes(x = GEO.ACL00 , y = Eating, color = SEX))

# Faceted graph
# Country and time spendign sleeping  based on their sex
ggplot(data = TimeUse) +
  geom_point(mapping = aes(x = SEX , y = Sleep )) +
  facet_wrap(~ GEO.ACL00, nrow = 2)

# Distribution of the data
# Total participants on the dataframe and time spending study  based on their sex
ggplot(data = TimeUse) +
  geom_bar(mapping = aes(x = SEX, fill = Study))

```


#### Plots


![](https://github.com/CinthiaBV/DataMining/blob/Unit-2/puntos.JPG?raw=true)

![](https://github.com/CinthiaBV/DataMining/blob/Unit-2/facetas.JPG?raw=true)

![](https://github.com/CinthiaBV/DataMining/blob/Unit-2/distribucion.JPG?raw=true)

### &nbsp;&nbsp;Test 2 .

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

# # Summary 

summary(movies)

# Tail

tail(movies)

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

### &nbsp;&nbsp; Video Link .