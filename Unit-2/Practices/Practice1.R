#Install library ggplot2



library(ggplot2)

#Load the file csv
TestData <- read.csv(file.choose())
TestData

summary.data.frame(TestData)
plot(TestData)
head(TestData)


#Data Life Expectancy
DataLife <- data.frame(Code= Country_Code, Life_1960=Life_Expectancy_At_Birth_1960,
                       Life_2013=Life_Expectancy_At_Birth_2013)
head(DataLife)

# Data Life Expectancy and fertility , year 1960
filter_Country <- Happiness$Country ==AT
filter_AT
Happiness_Country <- Happiness[filter_Country,]
Happiness_Country
head(Hapiness_Country)
Happiness_Country <- merge(Happines_Country, DataLife, by.x = "Country.Code", by.y = "Code")
head(Happiness_Country)

qplot(data=Happiness, x=Country, xlab = "Country", y=Life_1960, ylab = "Life Expectancy", main = "Year 1960", color=Region, size=I(1))

