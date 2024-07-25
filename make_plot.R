library(tidyverse)
library(knitr)

vazgen <- read_csv("vazgen.csv") 
maralik <- read_csv("maralik.csv") 
artik <- read_csv("artik.csv") 
panik <- read_csv("panik.csv") |>
  filter(temperature>-12)
azatan <- read_csv("azatan.csv")




temp_merged<- rbind(azatan, vazgen, artik, panik, maralik) |>
  select(time, temperature, device)

temp_plot <- temp_merged |>
  drop_na()|>
  ggplot(mapping = aes(x = time, y = temperature, color = device)) +
  geom_smooth(na.rm = TRUE) +
  labs(title = "Temperature measurements over the time",
       subtitle = "The data is from Yerevan and rural areas of Shirak",
       x = "Time",
       y = "Temperature",
       color = "Device")

#ggsave(temp_plot, file = "temp_plot.png")
#print(temp_plot)




pres_merged<- rbind(azatan, vazgen, artik, panik, maralik) |>
  select(time, pressure, device)

pres_plot <- pres_merged |>
  drop_na()|>
  ggplot(mapping = aes(x = time, y = pressure, color = device)) +
  geom_line(na.rm = TRUE)  +
  labs(title = "Pressure measurements over the time",
       subtitle = "The data is from Yerevan and rural areas of Shirak",
       x = "Time",
       y = "Pressure",
       color = "Device")
#ggsave(pres_plot, file = "pres_plot.png")
#print(pres_plot)




lux_uv_merged<- rbind(azatan, vazgen, artik, panik, maralik) |>
  select( device, lux, uv)

lux_uv_plot <- lux_uv_merged |>
  drop_na()|>
  ggplot(mapping = aes(x = lux, y = uv)) +
  geom_boxplot(na.rm = TRUE, aes(group = cut_width(lux, 3000))) +
  coord_cartesian(ylim = c(0, 4.5)) +
  labs(title = "Correlation between the level of illumination and ultraviolet radiation",
       subtitle = "The data is from Yerevan and rural areas of Shirak",
       x = "Illumination (lux)",
       y = "Ultraviolet Radiation")
#ggsave(lux_uv_plot, file = "lux_uv_plot.png")
#print(lux_uv_plot)




lux_merged<- rbind(azatan, vazgen, artik, panik, maralik)|>
  select(time, lux, device)

lux_plot <- lux_merged |>
  ggplot(mapping = aes(x = time, y = lux, color = device)) +
  geom_smooth(na.rm = TRUE)  +
  labs(title = "Illumination measurements over the time",
       subtitle = "The data is from Yerevan and rural areas of Shirak",
       x = "Time",
       y = "Illumination (lux)",
       color = "Device") 
#ggsave(lux_plot, file = "lux_plot.png")
#print(lux_plot)






pm1_false_merged<- rbind(azatan, vazgen, artik, panik, maralik) |>
  select(time, pm1, device)

pm1_false_plot <- pm1_false_merged |>
  ggplot(mapping = aes(x = time, y = pm1, color = device)) +
  geom_smooth(na.rm = TRUE)  +
  labs(title = "Air quality (pm1) measurements over the time",
       subtitle = "The data from Maralik is not valid becuse of device malfunction",
       x = "Time",
       y = "PM1",
       color = "Device")
ggsave(pm1_false_plot, file = "pm1_false_plot.png")
#print(pm1_false_plot)




pm1_merged<- rbind(azatan, vazgen, artik, panik) |>
  select(time, pm1, device)

pm1_plot <- pm1_merged |>
  ggplot(mapping = aes(x = time, y = pm1, color = device)) +
  geom_smooth(na.rm = TRUE) +
  coord_cartesian(ylim = c(0, 60))  +
  labs(title = "Air quality (pm1) measurements over the time",
       subtitle = "The data is from Yerevan and rural areas of Shirak",
       x = "Time",
       y = "PM1",
       color = "Device")
ggsave(pm1_plot, file = "pm1_plot.png")
#print(pm1_plot)




pm2_5_merged<- rbind(azatan, vazgen, artik, panik) |>
  select(time, pm2_5, device)

pm2_5_plot <- pm2_5_merged |>
  ggplot(mapping = aes(x = time, y = pm2_5, color = device)) +
  geom_smooth(na.rm = TRUE) +
  coord_cartesian(ylim = c(0, 60))  +
  labs(title = "Air quality (pm2.5) measurements over the time",
       subtitle = "The data is from Yerevan and rural areas of Shirak",
       x = "Time",
       y = "PM2.5",
       color = "Device")
ggsave(pm2_5_plot, file = "pm2_5_plot.png")
#print(pm2_5_plot)





pm10_merged<- rbind(azatan, vazgen, artik, panik) |>
  select(time, pm10, device)

pm10_plot <- pm10_merged |>
  ggplot(mapping = aes(x = time, y = pm10, color = device)) +
  geom_smooth(na.rm = TRUE) +
  coord_cartesian(ylim = c(0, 60))  +
  labs(title = "Air quality (pm10) measurements over the time",
       subtitle = "The data is from Yerevan and rural areas of Shirak",
       x = "Time",
       y = "PM10",
       color = "Device")
ggsave(pm10_plot, file = "pm10_plot.png")
#print(pm10_plot)







#  scale_x_date(date_labels="%b %Y", breaks = unique(merged$time))
# coord_cartesian(ylim = c(0, 500))
#  geom_smooth(na.rm = TRUE)


#es nuyn dzevov temp, lux, uv, pm1, pm2.5, pm10, speed hamematem yerevani u gyuxakan taracqneri het, ogtagorcelov 1 plotum mi qani graphicker, ggplot-i mej porcem time-y xmbavorem weekerov, voch te data-n poxem 
