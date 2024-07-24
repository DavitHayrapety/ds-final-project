library(tidyverse)
library(knitr)

vazgen <- read_csv("vazgen.csv")
maralik <- read_csv("maralik.csv")

merged<- rbind(vazgen, maralik)

vazgen_data <- vazgen |>
  select(time, pm1) |>
    arrange(desc(pm1))

library(dplyr)
vazgen2 <- vazgen %>% 
  group_by(week = week(time)) %>%
  mutate(temperature.wk.average = mean(temperature)) %>%
  ungroup() %>%
  group_by(month = month(time)) %>%
  mutate(temperature.mo.average = mean(temperature))

clim_plot <- merged |>
  ggplot(mapping = aes(x = time, y = temperature, color = device)) +
  geom_line(na.rm = TRUE, size = 0.3) +
#  coord_cartesian(xlim = c(jan, apr))
  geom_smooth(na.rm = TRUE)

print(clim_plot)

#es nuyn dzevov temp, lux, uv, pm1, pm2.5, pm10, speed hamematem yerevani u gyuxakan taracqneri het, ogtagorcelov 1 plotum mi qani graphicker, ggplot-i mej porcem time-y xmbavorem weekerov, voch te data-n poxem 
