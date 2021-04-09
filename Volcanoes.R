#Volcanoes

file.choose()
volcano <- import("/Users/ryanclemens/Documents/Documents - RSCMacbookPro/Yale/Data Visualization/R/9/TableauWorkshop/Volcano Eruptions.xlsx")

library(ggplot2)

ggplot(volcano) +
  geom_point(aes(x = Longitude, y =  Latitude, size = volcano$`Elevation (m)`), alpha = 0.7) +
  labs(title = "Z", x = "X", y = "Y") +
  coord_flip() +
  theme_bw() +
  theme(panel.grid = element_blank(), panel.border = element_blank(), legend.position = "none")

#Below totally didn't work, histograms need continuous variables (apparently)
ggplot(volcano, aes(x = Region), stat="count") +
  geom_histogram() +
  labs(title = "Z", x = "X", y = "Y") +
  coord_flip() +
  theme_bw() +
  theme(panel.grid = element_blank(), panel.border = element_blank(), legend.position = "none")

library(viridis)

#More basic script
ggplot(volcano, aes(Country, fill = Country)) +
  geom_bar() +
  coord_flip() +
  theme_bw() +
  geom_text(aes(y=..count.., label=..count..),
              stat="count", color="white",
              hjust=2.0, size=3) +
  theme(panel.grid = element_blank(), panel.border = element_blank(), legend.position = "none") +
  labs(title = "US, Russia, and Indonesia Lead Global Volcano Explosions", x = "Region", y = "Registered Volcano Explosions")

ggsave("plot3.png",
       plot = last_plot(),
       dpi = 300)
