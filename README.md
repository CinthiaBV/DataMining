# Unit-1


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


### &nbsp;&nbsp;Practice 1..

#### &nbsp;&nbsp;&nbsp;&nbsp; Instructions..
   
1.- Initialize sample size
2.- Initialize counter
3.-loop for(i in rnorm(size))
4.- Check if the iterated variable falls
5.- Increase counter if the condition is true
6.- return a result <- counter / N

               
#### Create an R script that will count how many of these numbers fall between -1 and 1 and divide by the total quantity of N.
     
</br>

#### &nbsp;&nbsp;&nbsp;&nbsp; Code..

size <- 99999999
cont <- 0
mean <- 0
stdev <- 1
for(i in rnorm(size,mean,stdev)){
  if(i>=-1 && i<=1)
    cont <- cont+1
}
result <- cont/size
result <- result*100
paste(format(round(result, 2), nsmall = 2),"%")

