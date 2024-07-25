library(tidyverse)
library(knitr)

#invalid data

#azatan speed, rain


vazgen <- read_csv("vazgen.csv") 

maralik <- read_csv("maralik.csv")

artik <- read_csv("artik.csv") 

panik <- read_csv("panik.csv") |>
  filter(temperature>-12)

azatan <- read_csv("azatan.csv")
  
  
  
#  mutate(new_time= as.Date(time, format= "%d.%m.%Y"))




temp_merged<- rbind(azatan, vazgen, artik, panik, maralik)

temp_plot <- temp_merged |>
  ggplot(mapping = aes(x = time, y = temperature, color = device)) +
  geom_smooth(na.rm = TRUE) +
  scale_x_date(date_breaks="1 month", date_labels="%m-%Y") 
#print(temp_plot)




pres_merged<- rbind(azatan, vazgen, artik, panik, maralik)

pres_plot <- pres_merged |>
  ggplot(mapping = aes(x = time, y = pressure, color = device)) +
  geom_line(na.rm = TRUE) +
  scale_x_date(date_breaks="1 month", date_labels="%m-%Y") 
#print(pres_plot)




merged<- rbind(azatan, vazgen, artik, panik, maralik) |>
  select( device, lux, uv)

plot <- merged |>
  ggplot(mapping = aes(x = lux, y = uv, color = device)) +
  geom_line(na.rm = TRUE) +
  scale_x_date(date_breaks="1 month", date_labels="%m-%Y") 
print(plot)




#merged<- rbind(azatan, vazgen, artik, panik, maralik)
#
#plot <- merged |>
#  ggplot(mapping = aes(x = time, y = uv, color = device)) +
#  geom_line(na.rm = TRUE) +
#  scale_x_date(date_breaks="1 month", date_labels="%m-%Y") 
#print(plot)





#  scale_x_date(date_labels="%b %Y", breaks = unique(merged$time))
# coord_cartesian(ylim = c(0, 500))
#  geom_smooth(na.rm = TRUE)


#es nuyn dzevov temp, lux, uv, pm1, pm2.5, pm10, speed hamematem yerevani u gyuxakan taracqneri het, ogtagorcelov 1 plotum mi qani graphicker, ggplot-i mej porcem time-y xmbavorem weekerov, voch te data-n poxem 
