#Sea Ice Data Exploration

library(rio)
file.choose()
seaice <- import("/Users/ryanclemens/Documents/Documents - RSCMacbookPro/Yale/Data Visualization/R/9/TableauWorkshop/Arctic Sea Ice Extent.xlsx")

library(ggplot2)
plot(seaice)
?ggplot
?geom_abline
#Fit average line, first need m and b
coef(lm(`Extent (million sq km)` ~ Date, data = seaice))
#Then plot
ggplot(seaice) +
  geom_line(mapping = aes(x = Date, y = `Extent (million sq km)`)) +
  labs(title = "Sea Ice Steadily Declining Over Past Thirty Years", x = "Year", y = "Million Square Kilometers") +
  geom_abline(aes(intercept = 1.311722e+01, slope = -1.803206e-09, colour = "green")) +
  theme_bw() +
  theme(panel.grid = element_blank(), panel.border = element_blank(), legend.position = "none")

ggsave("plot1.png",
       plot = last_plot(),
       dpi = 300)
