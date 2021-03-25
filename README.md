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

&nbsp;&nbsp;&nbsp;[Practice 4](#practice-4)

&nbsp;&nbsp;&nbsp;[Investigation 1 ](#investigation-1)    


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
### &nbsp;&nbsp;Investigation 1 .

#### &nbsp;&nbsp;&nbsp;&nbsp; Instructions.

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
https://www.4rsoluciones.com/blog/pair-programming-mejorando-el-proceso-dedesarrollo-2/

 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 

