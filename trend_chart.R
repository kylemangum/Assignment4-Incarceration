library(ggplot2)

data <- read.csv("us-prison-pop.csv")
no_empty_data <- data[complete.cases(data), ]
wa_data <- no_empty_data[no_empty_data$state == "WA", ]

king_county_data <- wa_data[wa_data$county_name == "King County", ]
spokane_county_data <- wa_data[wa_data$county_name == "Spokane County", ]
pierce_county_data <- wa_data[wa_data$county_name == "Pierce County", ]
snohomish_county_data <- wa_data[wa_data$county_name == "Snohomish County", ]

top_four_county <- rbind(pierce_county_data, spokane_county_data, king_county_data, snohomish_county_data)
female_prison_graph <- ggplot(top_four_county, aes(x = year, y = female_prison_pop, color = county_name)) +
  geom_line(linewidth = 1) +
  labs(x = "Year", y = "Population", title = "Washington County's Female Prison Population (1990-2016)") +
  scale_color_manual(values = c("Pierce County" = "blue", "Spokane County" = "red", "King County" = "green", "Snohomish County" = "yellow")) +
  theme_minimal()
print(female_prison_graph)
