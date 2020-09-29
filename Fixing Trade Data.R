library(tidyverse)
library(wakefield)

library(readxl)
Trade_Data <- read_excel("C:/Users/User/Desktop/Software Cheats/Tableau/Trade Data.xls", sheet = "Sheet1")


new.data <- r_data_frame(n = 27, Country = sample(c("Austria", "Belgium", "Bulgaria", "Croatia", "Republic of Cyprus", "Czech Republic", "Denmark", "Estonia", "Finland", "France", "Greece", "Hungary", "Ireland", "Italy", "Latvia", "Lithuania", "Luxembourg", "Malta", "Netherlands", "Poland", "Portugal", "Romania", "Slovakia", "Slovenia", "Spain", "Sweden", "United Kingdom"), replace = FALSE), Year = sample(c(2015), n), Value = c(0), n)
#Removed Germany#

new.data <- new.data[,c(-4)]

d2015s <- ifelse(new.data$Year != 2015, 2015, new.data$Year)
new.data$Year <- d2015s
new.data$Crop <- "Soybeans"

new.data1 <- new.data


new.data$Crop <- "Wheat (Unmilled)"
new.data2 <- new.data

new.data$Year <- 2016
new.data$Crop <- "Soybeans"
new.data3 <- new.data


new.data$Year <- 2017
new.data4 <- new.data

new.data$Year <- 2018
new.data5 <- new.data

new.data$Crop <- "Corn"
new.data6 <- new.data

new.data$Year <- 2019
new.data$Crop <- "Soybeans"
new.data7 <- new.data

new.data$Crop <- "Wheat (Unmilled)"
new.data8 <- new.data

new.data$Year <- 2018
new.data9 <- new.data

new.frame <- rbind(new.data1, new.data2, new.data3, new.data4, new.data5, new.data6, new.data7, new.data8, new.data9)


new.frame$Value <- 1

Trade_Data1 <- Trade_Data %>%
  filter(Country == "European Union-28") %>%
  mutate(Value = Value - 27)


new.frame1 <- rbind(new.frame, Trade_Data1)

Trade_Data2 <- subset(Trade_Data, Country != "European Union-28")

Final_data <- rbind(new.frame1, Trade_Data2)
  

table(Final_data$Country == "European Union-28")

write.csv(Final_data, "C:/Users/User/Desktop/Software Cheats/Tableau/Final_Trade_Data.csv", row.names = FALSE)

