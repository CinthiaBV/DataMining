## Unit-2


### <p align="center" > TECNOLÓGICO NACIONAL DE MÉXICO INSTITUTO TECNOLÓGICO DE TIJUANA SUBDIRECCIÓN ACADÉMICA DEPARTAMENTO DE SISTEMAS Y COMPUTACIÓN PERIODO: Agosto-Diciembre  2020</p>

###  <p align="center">  Carrera: Ing. En Sistemas Computacionales. 
### <p align="center"> Materia: 	Minería de Datos  (BDD-1704 SC9A	).</p>

### <p align="center">  Maestro: Jose Christian Romero Hernandez	</p>
### <p align="center">  No. de control y nombre del alumno: 15211916 - Vargas Garcia Cinthia Gabriela</p>
### <p align="center">  No. de control y nombre del alumno: 15212354 - Francisco Javier Diaz Urias </p>

### Index
&nbsp;&nbsp;&nbsp;[Practice 1](#practice-1)  

&nbsp;&nbsp;&nbsp;[Research](#Research)  

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


![](https://github.com/CinthiaBV/DataMining/blob/Unit-2/Unit-2/Image/puntos.JPG?raw=true)

![](https://github.com/CinthiaBV/DataMining/blob/Unit-2/Unit-2/Image/facetas.JPG?raw=true)

![](https://github.com/CinthiaBV/DataMining/blob/Unit-2/Unit-2/Image/distribucion.JPG?raw=true)

### &nbsp;&nbsp;Research.

## Origin of graphs

What is the origin of the graphs?

Just over 250 years ago, the natural philosopher and theologian Joseph Priestley (1733-1804) published in his work A New Chart of History the first known chronograms. Priestley was a great pedagogue in very diverse subjects such as grammar or history, the study of which was for him a moral imperative. And it was precisely for his history classes that he designed a type of graph where different bars on a timeline represented in context and allowed different time periods to be compared, such as lives of people or durations of empires. Priestley's schedules caused a sensation, and his work was reissued dozens of times.


Two decades later, inspired by Priestley, William Playfair (1759-1823), a Scottish engineer and political economist, pioneered the use of graphs to explore, understand, and communicate data by inventing various types of diagrams. Specifically in 1786 he published his Commercial and Political Atlas, considered the first important work with statistical graphics.

In 43 wonderful graphs, Playfair uses lines to represent the evolution over the years of imports and exports between different countries. Incidentally, the absence of historical data for Scotland, which prevented him from reproducing that same analysis, led him to a second innovation: the bar graph. Given that he had data for a single year, he decided to arrange exports and imports in 17 pairs of bars, one for each country with which Scotland had economic relations.


Interestingly, this is the first known graph that does not have a spatial dimension (like a map) or a temporal dimension (like Priestley's timelines). For the first time in history, a graphical solution is given to a problem of pure comparison of quantitative data. And if that wasn't enough, in addition to being considered the father of line, area, and bar graphs, Playfair also has the dubious honor of being the inventor of the pie chart, in his 1801 Statistical Breviary.


Not surprisingly, it was this pie chart, designed to compare proportions in a compact way, that inspired the next protagonist: Florence Nightingale (1820-1910). Nightingale was a British nurse, writer, and statistician, considered the founder of modern nursing and the first woman to be elected to the Royal Statistical Society in 1859. She was a living myth of Victorian England for her important work during the Crimean War. (1853-1856). In the military hospital where she was stationed, she dedicated herself to keeping a meticulous accounting of the causes of death of the soldiers, and she used the so-called rose diagram to communicate the results of her study.


It is a circular histogram that accounts for the seasonality of the various causes of death and their impact, highlighting deaths from infectious diseases. Thanks to this visualization, she managed to convince the British Parliament of the need to carry out a drastic reform of hygiene measures in hospitals.
These and other pioneers have made graphs a fundamental part of statistical data analysis, and their innovations are still relevant, as well as serving as excellent models of clarity in representation.

What is the grammar of graphs?

Every day you can find various graphs that show different statistical data: from the evolution of the cost of mortgages to the distribution of income in a country. There are many ways to represent your data, but not all of them are as efficient or as correct. The key is to understand what we want to communicate and how we are going to structure it. An analogy (not to be interpreted literally) was established between the grammatical construction and the structure of a graph.

An analogy (not to be interpreted literally) was established between the grammatical construction and the structure of a graph.

The analysis of many graphs drew some conclusions to recommend some tips with which to build a graph that did not give rise to confusion and was faithful to its original message.

## Distributions that exist statistically

Bernoulli distribution

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

### &nbsp;&nbsp;Test 2.

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

<<<<<<< HEAD
### &nbsp;&nbsp; Video Link .

https://youtu.be/hKKwGGqpfUM
=======
### Plot

![](https://github.com/CinthiaBV/DataMining/blob/Unit-2/Unit-2/Image/183771764_1152345595188409_6233300732558023209_n.png?raw=true)

### &nbsp;&nbsp; Video Link .
>>>>>>> b544807e9c8c435b1caf8d39e5e79c79dcee3703
