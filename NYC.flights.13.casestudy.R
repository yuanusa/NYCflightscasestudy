#CASE: How many flight records are in the dataset for each NYC airport? 
# Their average distance and delay?


library(dplyr)
library(rmarkdown)
library(ggplot2)
library(nycflights13)
#dim(flights)
#by_origin <- group_by(flights,origin)   # groupby origin
#delay <- summarise(by_origin,
#                   count = n(),        # count the number of flights
#                   dist = mean (distance, na.rm = TRUE),     # average distance 
#                   delay = mean(arr_delay, na.rm = TRUE))    # na.rm = TRUE is not zero
#delay <- filter(delay, delay >6)      # any flight delay is over 6
#delay                                 # print delay

delay_pipe <- flights %>%          # %>% is pipeline operator
  filter(!is.na(dep_delay)) %>%    # ! means NOT, filter all data is not missing
  group_by(origin) %>%             #  
  summarise(
    dis= mean(distance, na.rm = TRUE),
    delay = mean(dep_delay),
    count = n()) %>%
    filter(count >0)
delay_pipe
  