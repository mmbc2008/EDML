install.packages("gglplot2")
install.packages("tidyverse")

library(ggplot2)
library(tidyverse)
library(dplyr)
library(tidyr)

results <- read.csv2("/Users/mylene/EDML/Cassowary/processed data.csv", sep=";")
view(results)
map_data <- map_data("world")
view(map_data)
map_data <- left_join(map_data, results, by="region")
view(map_data)
# map_data1 <- map_data %>% filter(!is.na(map_data$subregion))
#map_data1 <- map_data[!apply(is.na(map_data) | map_data == "", 1, all),]
#map_data1 <- map_data %>% filter(!is.na(map_data$age))
#map_data1 <- map_data %>% filter(!is.na(map_data$gender))

map_data1 %>% filter_all(all_vars(!is.na(.)))
map_data1 %>% filter_all(all_vars(complete.cases(.)))  
view(map_data1)

map1 <- ggplot(map_data1, aes(x = long, y = lat, group = group)) + geom_polygon(aes(fill = education), color = "blue")
map1
