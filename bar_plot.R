library(tidyverse)
library(ggplot2)

valence <-
  fresults %>%
    select(c(valence_E_low_1, valence_D_low_1, valence_M_low_1, valence_H_low_1, valence_E_mid_1, valence_D_mid_1, valence_M_mid_1, valence_H_mid_1, valence_E_high_1, valence_D_high_1, valence_M_high_1, valence_H_high_1)) %>%
      pivot_longer(c("valence_E_low_1", "valence_D_low_1",
                     "valence_M_low_1", "valence_H_low_1",
                     "valence_E_mid_1", "valence_D_mid_1",
                     "valence_M_mid_1", "valence_H_mid_1",
                     "valence_E_high_1", "valence_D_high_1",
                     "valence_M_high_1", "valence_H_high_1"),
                   names_to = "Languages",
                   values_to = "values_mean") %>%
        group_by(Languages) %>% 
          summarise(Values = mean(values_mean))

valence['Valence_degree'] <- c("high", "low", "mid", "high", "low", "mid",
                      "high", "low", "mid", "high", "low", "mid")

valence[1, 1] = "Dutch"
valence[2, 1] = "Dutch"
valence[3, 1] = "Dutch"
valence[4, 1] = "English"
valence[5, 1] = "English"
valence[6, 1] = "English"
valence[7, 1] = "Hindi"
valence[8, 1] = "Hindi"
valence[9, 1] = "Hindi"
valence[10, 1] = "Mandarin"
valence[11, 1] = "Mandarin"
valence[12, 1] = "Mandarin"

ggplot(valence, aes(fill=Languages, y=Values, x=Valence_degree)) + 
geom_bar(position="dodge", stat="identity") + ggtitle("Valence") +
scale_fill_manual(values=c("#4019FF", "#D400FF", "#FF1919", "#FF9933"))