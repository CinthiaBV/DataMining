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

&nbsp;&nbsp;&nbsp;[Practice 5](#practice-5)


&nbsp;&nbsp;&nbsp;[Test-1](#Test-1)



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

### &nbsp;&nbsp;Practice 5.

#### &nbsp;&nbsp;&nbsp;&nbsp; Instructions.
   
// Using the Demographic.Data dataframe, perform the low, medium-high filters, 
and also use the filters for each country.
               
#### Using DataSet Demographic.Data
     
</br>

#### &nbsp;&nbsp;&nbsp;&nbsp; Code.

``` R
stats <- read.csv(file.choose())
stats
#Filtrar países por ingresos bajos
head(stats)
filter <- stats$Income.Group == "Low income" #TRUE
filter
stats[filter,]
#Filter países por ingresos medianos bajos
head(stats)
filter <- stats$Income.Group == "Lower middle income" #TRUE
filter
stats[filter,]
Filtrar países por ingresos medianos bajos
head(stats)
filter <- stats$Income.Group == "Lower middle income" #TRUE
filter
stats[filter,]

Filtrar por país Malta
head(stats)
filter <- stats$Country.Name == "Malta" #TRUE
filter
stats[filter,]
#Filtrar por país Qatar
head(stats)
filter <- stats$Country.Name == "Qatar" #TRUE
filter
stats[filter,]
#Filtrar por país Holanda
head(stats)
filter <- stats$Country.Name == "Netherlands" #TRUE
filter
stats[filter,]
#Filtrar por país Noruegahead(stats)
filter <- stats$Country.Name == "Norway" #TRUE
filter
stats[filter,]

``` 

&nbsp;&nbsp;&nbsp;[Test-1](#Test-1)  


### &nbsp;&nbsp;Test-1.

#### &nbsp;&nbsp;&nbsp;&nbsp; Instructions.
   
You should generate a scatter-plot that shows the
Life expectancy statistics (y-axis) and fertility rate
(Fertility Rate -x axis) by country (Country).
The scatter plot should also be classified by country Regions (Country
Regions).
You have been provided data for 2 years: 1960 and 2013 and you are required to
produce a visualization for each of these years.
               
#### Create an R script.
     
</br>

#### &nbsp;&nbsp;&nbsp;&nbsp; Code.

``` R
#Execute below code to generate three new vectors
Country_Code <- c("ABW","AFG","AGO","ALB","ARE","ARG","ARM","ATG","AUS","AUT","AZE","BDI","BEL","BEN","BFA","BGD","BGR","BHR","BHS","BIH","BLR","BLZ","BOL","BRA","BRB","BRN","BTN","BWA","CAF","CAN","CHE","CHL","CHN","CIV","CMR","COG","COL","COM","CPV","CRI","CUB","CYP","CZE","DEU","DJI","DNK","DOM","DZA","ECU","EGY","ERI","ESP","EST","ETH","FIN","FJI","FRA","FSM","GAB","GBR","GEO","GHA","GIN","GMB","GNB","GNQ","GRC","GRD","GTM","GUM","GUY","HKG","HND","HRV","HTI","HUN","IDN","IND","IRL","IRN","IRQ","ISL","ITA","JAM","JOR","JPN","KAZ","KEN","KGZ","KHM","KIR","KOR","KWT","LAO","LBN","LBR","LBY","LCA","LKA","LSO","LTU","LUX","LVA","MAC","MAR","MDA","MDG","MDV","MEX","MKD","MLI","MLT","MMR","MNE","MNG","MOZ","MRT","MUS","MWI","MYS","NAM","NCL","NER","NGA","NIC","NLD","NOR","NPL","NZL","OMN","PAK","PAN","PER","PHL","PNG","POL","PRI","PRT","PRY","PYF","QAT","ROU","RUS","RWA","SAU","SDN","SEN","SGP","SLB","SLE","SLV","SOM","SSD","STP","SUR","SVK","SVN","SWE","SWZ","SYR","TCD","TGO","THA","TJK","TKM","TLS","TON","TTO","TUN","TUR","TZA","UGA","UKR","URY","USA","UZB","VCT","VEN","VIR","VNM","VUT","WSM","YEM","ZAF","COD","ZMB","ZWE")
Life_Expectancy_At_Birth_1960 <- c(65.5693658536586,32.328512195122,32.9848292682927,62.2543658536585,52.2432195121951,65.2155365853659,65.8634634146342,61.7827317073171,70.8170731707317,68.5856097560976,60.836243902439,41.2360487804878,69.7019512195122,37.2782682926829,34.4779024390244,45.8293170731707,69.2475609756098,52.0893658536585,62.7290487804878,60.2762195121951,67.7080975609756,59.9613658536585,42.1183170731707,54.2054634146342,60.7380487804878,62.5003658536585,32.3593658536585,50.5477317073171,36.4826341463415,71.1331707317073,71.3134146341463,57.4582926829268,43.4658048780488,36.8724146341463,41.523756097561,48.5816341463415,56.716756097561,41.4424390243903,48.8564146341463,60.5761951219512,63.9046585365854,69.5939268292683,70.3487804878049,69.3129512195122,44.0212682926829,72.1765853658537,51.8452682926829,46.1351219512195,53.215,48.0137073170732,37.3629024390244,69.1092682926829,67.9059756097561,38.4057073170732,68.819756097561,55.9584878048781,69.8682926829268,57.5865853658537,39.5701219512195,71.1268292682927,63.4318536585366,45.8314634146342,34.8863902439024,32.0422195121951,37.8404390243902,36.7330487804878,68.1639024390244,59.8159268292683,45.5316341463415,61.2263414634146,60.2787317073171,66.9997073170732,46.2883170731707,64.6086585365854,42.1000975609756,68.0031707317073,48.6403170731707,41.1719512195122,69.691756097561,44.945512195122,48.0306829268293,73.4286585365854,69.1239024390244,64.1918292682927,52.6852682926829,67.6660975609756,58.3675853658537,46.3624146341463,56.1280731707317,41.2320243902439,49.2159756097561,53.0013170731707,60.3479512195122,43.2044634146342,63.2801219512195,34.7831707317073,42.6411951219512,57.303756097561,59.7471463414634,46.5107073170732,69.8473170731707,68.4463902439024,69.7868292682927,64.6609268292683,48.4466341463415,61.8127804878049,39.9746829268293,37.2686341463415,57.0656341463415,60.6228048780488,28.2116097560976,67.6017804878049,42.7363902439024,63.7056097560976,48.3688048780488,35.0037073170732,43.4830975609756,58.7452195121951,37.7736341463415,59.4753414634146,46.8803902439024,58.6390243902439,35.5150487804878,37.1829512195122,46.9988292682927,73.3926829268293,73.549756097561,35.1708292682927,71.2365853658537,42.6670731707317,45.2904634146342,60.8817073170732,47.6915853658537,57.8119268292683,38.462243902439,67.6804878048781,68.7196097560976,62.8089268292683,63.7937073170732,56.3570487804878,61.2060731707317,65.6424390243903,66.0552926829268,42.2492926829268,45.6662682926829,48.1876341463415,38.206,65.6598292682927,49.3817073170732,30.3315365853659,49.9479268292683,36.9658780487805,31.6767073170732,50.4513658536585,59.6801219512195,69.9759268292683,68.9780487804878,73.0056097560976,44.2337804878049,52.768243902439,38.0161219512195,40.2728292682927,54.6993170731707,56.1535365853659,54.4586829268293,33.7271219512195,61.3645365853659,62.6575853658537,42.009756097561,45.3844146341463,43.6538780487805,43.9835609756098,68.2995365853659,67.8963902439025,69.7707317073171,58.8855365853659,57.7238780487805,59.2851219512195,63.7302195121951,59.0670243902439,46.4874878048781,49.969512195122,34.3638048780488,49.0362926829268,41.0180487804878,45.1098048780488,51.5424634146342)
Life_Expectancy_At_Birth_2013 <- c(75.3286585365854,60.0282682926829,51.8661707317073,77.537243902439,77.1956341463415,75.9860975609756,74.5613658536585,75.7786585365854,82.1975609756098,80.890243902439,70.6931463414634,56.2516097560976,80.3853658536585,59.3120243902439,58.2406341463415,71.245243902439,74.4658536585366,76.5459512195122,75.0735365853659,76.2769268292683,72.4707317073171,69.9820487804878,67.9134390243903,74.1224390243903,75.3339512195122,78.5466585365854,69.1029268292683,64.3608048780488,49.8798780487805,81.4011219512195,82.7487804878049,81.1979268292683,75.3530243902439,51.2084634146342,55.0418048780488,61.6663902439024,73.8097317073171,62.9321707317073,72.9723658536585,79.2252195121951,79.2563902439025,79.9497804878049,78.2780487804878,81.0439024390244,61.6864634146342,80.3024390243903,73.3199024390244,74.5689512195122,75.648512195122,70.9257804878049,63.1778780487805,82.4268292682927,76.4243902439025,63.4421951219512,80.8317073170732,69.9179268292683,81.9682926829268,68.9733902439024,63.8435853658537,80.9560975609756,74.079512195122,61.1420731707317,58.216487804878,59.9992682926829,54.8384146341464,57.2908292682927,80.6341463414634,73.1935609756098,71.4863902439024,78.872512195122,66.3100243902439,83.8317073170732,72.9428536585366,77.1268292682927,62.4011463414634,75.2682926829268,68.7046097560976,67.6604146341463,81.0439024390244,75.1259756097561,69.4716829268293,83.1170731707317,82.290243902439,73.4689268292683,73.9014146341463,83.3319512195122,70.45,60.9537804878049,70.2024390243902,67.7720487804878,65.7665853658537,81.459756097561,74.462756097561,65.687243902439,80.1288780487805,60.5203902439024,71.6576829268293,74.9127073170732,74.2402926829268,49.3314634146342,74.1634146341464,81.7975609756098,73.9804878048781,80.3391463414634,73.7090487804878,68.811512195122,64.6739024390244,76.6026097560976,76.5326585365854,75.1870487804878,57.5351951219512,80.7463414634146,65.6540975609756,74.7583658536585,69.0618048780488,54.641512195122,62.8027073170732,74.46,61.466,74.567512195122,64.3438780487805,77.1219512195122,60.8281463414634,52.4421463414634,74.514756097561,81.1048780487805,81.4512195121951,69.222,81.4073170731707,76.8410487804878,65.9636829268293,77.4192195121951,74.2838536585366,68.1315609756097,62.4491707317073,76.8487804878049,78.7111951219512,80.3731707317073,72.7991707317073,76.3340731707317,78.4184878048781,74.4634146341463,71.0731707317073,63.3948292682927,74.1776341463415,63.1670487804878,65.878756097561,82.3463414634146,67.7189268292683,50.3631219512195,72.4981463414634,55.0230243902439,55.2209024390244,66.259512195122,70.99,76.2609756097561,80.2780487804878,81.7048780487805,48.9379268292683,74.7157804878049,51.1914878048781,59.1323658536585,74.2469268292683,69.4001707317073,65.4565609756098,67.5223658536585,72.6403414634147,70.3052926829268,73.6463414634147,75.1759512195122,64.2918292682927,57.7676829268293,71.159512195122,76.8361951219512,78.8414634146341,68.2275853658537,72.8108780487805,74.0744146341464,79.6243902439024,75.756487804878,71.669243902439,73.2503902439024,63.583512195122,56.7365853658537,58.2719268292683,59.2373658536585,55.633)

#Install library ggplot2

library(ggplot2)

#Load the file csv
TestData <- read.csv(file.choose())
TestData


#Data Life Expectancy
DataLife <- data.frame(Code= Country_Code, Life_1960=Life_Expectancy_At_Birth_1960,
                       Life_2013=Life_Expectancy_At_Birth_2013)
head(DataLife)

# Data Life Expectancy and fertility , year 1960
filter_1960 <- TestData$Year==1960
filter_1960
TestData_1960 <- TestData[filter_1960,]
TestData_1960
head(TestData_1960)
TestData_1960 <- merge(TestData_1960, DataLife, by.x = "Country.Code", by.y = "Code")
head(TestData_1960)
TestData_1960$Life_2013 <- NULL
head(TestData_1960)
qplot(data=TestData_1960, x=Fertility.Rate, xlab = "Fertility", y=Life_1960, ylab = "Life Expectancy", main = "Year 1960", color=Region, size=I(1))



# Data Life Expectancy and fertility , year 2013
filter_2013 <- TestData$Year==2013
filter_2013
TestData_2013 <- TestData[filter_2013,]
TestData_2013
head(TestData_2013)
TestData_2013 <- merge(TestData_2013, DataLife, by.x = "Country.Code", by.y = "Code")
head(TestData_2013)
TestData_2013$Life_1960 <- NULL
head(TestData_2013)
qplot(data=TestData_2013, x=Fertility.Rate,  xlab = "Fertility", y=Life_2013, ylab = "Life Expectancy", main = "Year 2013", color=Region, size=I(1))

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
https://www.4rsoluciones.com/blog/pair-programming-mejorando-el-proceso-dedesarrollo-2
