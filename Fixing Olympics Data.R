setwd("C:/Users/User/Desktop/Software Cheats/Tableau")

library(readr)
data <- read_csv("Summer-Olympic-medals-1976-to-2008.csv")


apply(is.na(data), 2, sum)
 

data <- na.omit(data)

write.csv(data, "C:/Users/User/Desktop/Software Cheats/Tableau/Olympics.csv", row.names=TRUE)
