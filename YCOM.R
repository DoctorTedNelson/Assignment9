#Yale Climate Opinion Maps

file.choose()
YCOM <- import("/Users/ryanclemens/Documents/Documents - RSCMacbookPro/Yale/Data Visualization/R/9/TableauWorkshop/YCOM-2018-Data.csv")

library(ggplot2)

#Create subset
states <- YCOM %>%
  filter(GeoType == "State")

ggplot(states, aes(x = personal, y = futuregen)) +
  geom_point() +
  xlim(0, 100) +
  ylim(0, 100) +
  geom_smooth(method=lm , color="red", se=FALSE) +
  labs(title = "American Belief in Personal Climate Change Effects Corresponds to Belief in Future Generation Effects", x = "Percent which believe climate change will affect them personally", y = "Percent which believe climate change will affect future generations") +
  theme_bw() +
  theme(panel.grid = element_blank(), panel.border = element_blank())

ggsave("plot4.png",
       plot = last_plot(),
       dpi = 300)
