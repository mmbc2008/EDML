
library(ggplot2)
library(tidyverse)
library(dplyr)
library(tidyr)

results = read.csv2("/Users/mylene/EDML/Cassowary/country_text.csv")

map_data <- map_data("world")

map_data <- left_join(map_data, results, by="region")


map1 <- ggplot(map_data, aes(x = long, y = lat, group = group)) + geom_polygon(aes(fill = Population_Dispersion), color = "black")
map1

map2 <- map1 + scale_fill_gradient(name = "No of participants", low = "pink", high = "purple", na.value = "lightblue") +
    theme(axis.text.x = element_blank(),
          axis.text.y = element_blank(),
          axis.ticks = element_blank(),
          axis.title.y = element_blank(),
          axis.title.x = element_blank(),
          rect = element_blank())
map2


