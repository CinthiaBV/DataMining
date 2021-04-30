## Unit-2


### <p align="center" > TECNOLÓGICO NACIONAL DE MÉXICO INSTITUTO TECNOLÓGICO DE TIJUANA SUBDIRECCIÓN ACADÉMICA DEPARTAMENTO DE SISTEMAS Y COMPUTACIÓN PERIODO: Agosto-Diciembre  2020</p>

###  <p align="center">  Carrera: Ing. En Sistemas Computacionales. 
### <p align="center"> Materia: 	Minería de Datos  (BDD-1704 SC9A	).</p>

### <p align="center">  Maestro: Jose Christian Romero Hernandez	</p>
### <p align="center">  No. de control y nombre del alumno: 15211916 - Vargas Garcia Cinthia Gabriela</p>
### <p align="center">  No. de control y nombre del alumno: 15212354 - Francisco Javier Diaz Urias </p>

## Index
&nbsp;&nbsp;&nbsp;[Practice 1](#practice-1)  

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

![](/Unit-2/puntos.jpg)
![](/Unit-2/facetas.jpg)
![](/Unit-2/distribucion.jpg)
