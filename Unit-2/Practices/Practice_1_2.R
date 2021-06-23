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

