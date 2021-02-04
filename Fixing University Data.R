
#Source: https://www.kaggle.com/theriley106/university-statisticslibrary(rjson) - 2018 USNEWS Rankings#

install.packages("jsonlite")
library(jsonlite)

setwd("C:/Users/User/Desktop/Software Cheats/R")

data <- fromJSON("schoolInfo.json", flatten = TRUE)

# Convert JSON file to a data frame.
json_data_frame <- as.data.frame(data)

is.data.frame(data)

head(data)

apply(is.na(data), 2, sum) 

write.csv(data, "C:/Users/User/Desktop/Software Cheats/R/University_data.csv", row.names=TRUE)



