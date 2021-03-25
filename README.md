## Unit-1


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


### &nbsp;&nbsp;Practice 1.

#### &nbsp;&nbsp;&nbsp;&nbsp; Instructions.
   
// 1.- Initialize sample size

// 2.- Initialize counter

// 3.-loop for(i in rnorm(size))

// 4.- Check if the iterated variable falls

// 5.- Increase counter if the condition is true

// 6.- return a result <- counter / N

               
#### Create an R script that will count how many of these numbers fall between -1 and 1 and divide by the total quantity of N.
     
</br>

#### &nbsp;&nbsp;&nbsp;&nbsp; Code.

``` R
# Initialize sample size 
size <- 99999999

# Initialize counter
# Check if the iterated variable falls
# Increase counter if the condition is true

cont <- 0
mean <- 0
stdev <- 1

#loop for(i in rnorm(size))
for(i in rnorm(size,mean,stdev)){
  if(i>=-1 && i<=1)
    cont <- cont+1
}

result <- cont/size
result <- result*100
paste(format(round(result, 2), nsmall = 2),"%")

``` 

### &nbsp;&nbsp;Practice 2.

#### &nbsp;&nbsp;&nbsp;&nbsp; Instructions.

#### Find 20 more functions in R and make an example of it.

#### &nbsp;&nbsp;&nbsp;&nbsp; Code.

``` R
#1.-Absolute value
abs(4)

#2.-Square root
sqrt(7)	

#3.-Returns the next integer value of the chosen number, the result is 4
ceiling(3.475)

#4.-Return the integer, the result is 3
floor(3.475)	

#5.-Return the integer, the result is 5
trunc(5.99)	

#6.-Round the value of the specific digits, the result is 3.48
round(3.475, digits=2)	

"7.-Return the integer values in case the number of requested significant digits 
is less than the the number of digits in front of the 
decimal separator, the result is 3.5"
signif(3.475, digits=2)	

#8.-Cosine of (n)
cos(7)

#9.-Sine of (n)
sin(7)

#10.-Tangent of (n)
tan(7)	

#11.-Natural logarithm of (n)
log(7)

#12.-Common logarithm of (n)
log10(7)

#13.-Exponential value#
exp(7)

#14.-Uppercase
data <- "Text"
toupper(data)	

#15.-Lowercase
tolower(data)	

#16.-Sum
sum(1:2)

#17.-Median
median(1:4)

#18.-Standard deviation
sd(10:7)

#19.-Minimum
min(1,4,6,7)

#20.-Maximum
max(1,4,6,7)
```

## &nbsp;&nbsp;Practice 3.

#### &nbsp;&nbsp;&nbsp;&nbsp; Instructions.
   
// Scenario: You are a Data Scientist working for a consulting firm.
One of your colleagues from the Auditing Department has asked you
to help them assess the financial statement of organization X.

You have been supplied with two vector of data: mounthly revenue and
expenses for the financial year in quiestion. Your task is to calculate
the following financial matrics:

- profit for each mounth
- profit after tax for each month (the tax rate is 30%)
- profit margin for each month - equal to profit after tax divided by revenue
- good months - where the profit after tax was greater than the mean for the year
- bad months - where the profit after tax was less then the mean for years
- the best month - where the profit after tax was max for the year
- the worst month - where the profit after tax was min for the year

               
#### All results need to be presented as vectors.

Results for dollar values need to be calculate with $0.01 precision, but need to be
presented in Units of $1,000(i.e. 1k) with no decimal point.

Results for the profit margin ratio needed to be presented in units of % with no
decimal points.

Note: Your collegue has warned you that it is okay for tax for any given month to be
negative (in accounting terms, negative tax translates into a deferred tax asset).
     
</br>

#### &nbsp;&nbsp;&nbsp;&nbsp; Code.

``` R
Hint 1
Use:
  round()
mean()
max()
min()

#Data
revenue <- c(14574.49, 7606.46, 8611.41, 9175.41, 8058.65, 8105.44, 11496.28, 9766.09, 10305.32, 14379.96, 10713.97, 15433.50)
expenses <- c(12051.82, 5695.07, 12319.20, 12089.72, 8658.57, 840.20, 3285.73, 5821.12, 6976.93, 16618.61, 10054.37, 3803.96)

#Solution
#Calculate Profit As The Differences Between Revenue And Expenses
profit <- revenue- expenses 
profit

#Calculate Tax As 30% Of Profit And Round To 2 Decimal Points
tax <- round(0.30 * profit, 2)
tax 

#Calculate Profit Remaining After Tax Is Deducted
profit.after.tax <- revenue - profit
profit.after.tax

#Calculate The Profit Margin As Profit After Tax Over Revenue
#Round To 2 Decimal Points, Then Multiply By 100 To Get %
profit.margin <- round(profit.after.tax / revenue, 2) * 100
profit.margin

#Calculate The Mean Profit After Tax For The 12 Months
mean_pat <- mean(profit.after.tax)
mean_pat

#Find The Months With Above-Mean Profit After Tax
good.months <- profit.after.tax > mean_pat
good.months

#Bad Months Are The Opposite Of Good Months !
bad.months <- !good.months
bad.months

#The Best Month Is Where Profit After Tax Was Equal To The Maximum
best.month <- profit.after.tax == max(profit.after.tax)
best.month

#The Worst Month Is Where Profit After Tax Was Equal To The Minimum
worst.month <- profit.after.tax == min(profit.after.tax)
worst.month

#Convert All Calculations To Units Of One Thousand Dollars
revenue.1000 <- round(revenue / 1000, 0)
expenses.1000 <- round(expenses / 1000, 0)
profit.1000 <- round(profit / 1000, 0)
profit.after.tax.1000 <- round(profit.after.tax / 1000, 0)

#Print Results
revenue.1000
expenses.1000
profit.1000
profit.after.tax.1000
profit.margin
good.months
bad.months
best.month
worst.month

#BONUS:
#Preview Of What's Coming In The Next Section
M <- rbind(
  revenue.1000,
  expenses.1000,
  profit.1000,
  profit.after.tax.1000,
  profit.margin,
  good.months,
  bad.months,
  best.month,
  worst.month
)

#Print The Matrix
M

``` 
