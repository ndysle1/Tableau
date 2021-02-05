# %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% #
# Olympics Data #
# %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% #

# Load packages ----
source('settings.R')

# Load dataset ----
data <- fread(paste0(dir$data,'Summer-Olympic-medals-1976-to-2008.csv'))

head(data)

apply(is.na(data), 2, sum)

data <- na.omit(data)

# Write dataset ----
fwrite(data, paste0(dir$data, 'Olympics.csv'), row.names=TRUE)

# END ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~