#Directors

file.choose()
directors <- import("/Users/ryanclemens/Documents/Documents - RSCMacbookPro/Yale/Data Visualization/R/9/TableauWorkshop/Movies - Top Directors.xlsx")

#Unordered
ggplot(directors) +
  geom_col(aes(x = Director, y = `Lifetime Gross`, fill = Genre)) +
  labs(title = "Science Fiction and Thriller Earn More the Most Among Successful Directors", x = "Director", y = "Lifetime Gross (USD)") +
  coord_flip() +
  theme_bw() +
  theme(panel.grid = element_blank(), panel.border = element_blank())

#Ordering attempt
library(tidyverse)
library(tidytext)
?tidytext
?scale_x_reordered

ggplot(directors) +
  geom_col(aes(reorder(Director, `Lifetime Gross`), `Lifetime Gross`)) +
  scale_x_reordered() +
  coord_flip() +
  labs(x="Millions USD",title="X Films are Y")
  
ggsave("plot2.png",
       plot = last_plot(),
       dpi = 300)
