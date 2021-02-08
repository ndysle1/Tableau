# %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% #
# University Data #
# %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% #

## Data Source ----
#Source: https://www.kaggle.com/theriley106/university-statisticslibrary(rjson) - 2018 USNEWS Rankings#

## Load packages ----
source('settings.R')
library(jsonlite)

## Load dataset ----
data <- fromJSON(paste0(dir$data,'schoolInfo.json'), flatten = TRUE)

is.data.frame(data)

head(data)

apply(is.na(data), 2, sum)

## Write dataset ----
fwrite(data, paste0(dir$data,'University_data.csv'), row.names=TRUE)

## END ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~



