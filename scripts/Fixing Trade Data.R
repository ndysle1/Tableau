# %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% #
# Trade Data #
# %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% #

## Load packages ----
source('settings.R')
library(readxl)

## Load dataset ----
Trade_Data <- read_excel(paste0(dir$data,'Trade_Data.xls')
                         , sheet = "Sheet1")
Trade_Data <- setDT(Trade_Data)

## Explanation of Task ----
# In order to create a group for the EU in Tableau, each country of the
# EU needed to be represented in the dataset. To fix this issue, each 
# country except for 1 was added to the dataset and each of their values
# were set to 1. 27 was then subtracted from each EU observation's values
# so that the overall value of trade for the EU did not increase.

## Data Transformation ----
# EU Countries excluding Germany (Germany will be tied to EU in Tableau)
EU <- c("Austria", "Belgium", "Bulgaria", "Croatia", "Republic of Cyprus"
        , "Czech Republic", "Denmark", "Estonia", "Finland", "France"
        , "Greece", "Hungary", "Ireland", "Italy", "Latvia", "Lithuania"
        , "Luxembourg", "Malta", "Netherlands", "Poland", "Portugal"
        , "Romania", "Slovakia", "Slovenia", "Spain", "Sweden"
        , "United Kingdom")

# Find each year and crop that EU shows up in dataset
EU.data <- Trade_Data[Country=='European Union-28',.(Crop,Year)]

# For loop that creates a list of each country and crop/year combination
datalist <- list()
for (i in EU) {
  
  datalist[[i]] <- EU.data[, Country := i]

}
EU.data <- rbindlist(datalist)

# Force all trade values to 1 in EU dataset
EU.data <- setDT(EU.data)
EU.data[, Value := 1]

# For each entry of European-Union 28 remove 27 from total value
Trade_Data <- Trade_Data[, Value := fifelse(
  Country == "European Union-28", Value - 27, Value)]

# Combine two datasets together
final_data <- rbindlist(list(Trade_Data, EU.data)
                        , use.names=TRUE)

## Write dataset ----
fwrite(final_data, paste0(dir$data,'/Final_Trade_Data.csv')
       , row.names = FALSE)

## END ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
