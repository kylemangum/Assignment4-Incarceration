library(ggplot2)

data <- read.csv("us-prison-pop.csv")
no_empty_data <- data[complete.cases(data), ]
wa_data <- no_empty_data[no_empty_data$state == "WA", ]
king_county_data <- wa_data[wa_data$county_name == "King County", ]
king_county_line_graph <- ggplot(king_county_data, aes(x = year)) +
  geom_line(aes(y = black_prison_pop, color = "Black Prison Population"), linewidth = 1) +
  geom_line(aes(y = black_pop_15to64, color = "Black Population 15-64"), linewidth = 1) +
  labs(x = "Year", y = "Population", title = "Trend: Black Prison Population vs. Black Population (15-64) in King County") +
  scale_color_manual(values = c("Black Prison Population" = "blue", "Black Population 15-64" = "red")) +
  theme_minimal()
print(king_county_line_graph)