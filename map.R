library(ggplot2)
library(sf)
library(dplyr)

data <- read.csv("us-prison-pop.csv")
no_empty_data <- data[complete.cases(data), ]
shapefile <- st_read("states.shp")
state_mapping <- data.frame(
  state = c("AL", "AK", "AZ", "AR", "CA", "CO", "CT", "DE", "FL", "GA", "HI", "ID", "IL", "IN", "IA", "KS", "KY", "LA", "ME", "MD", "MA", "MI", "MN", "MS", "MO", "MT", "NE", "NV", "NH", "NJ", "NM", "NY", "NC", "ND", "OH", "OK", "OR", "PA", "RI", "SC", "SD", "TN", "TX", "UT", "VT", "VA", "WA", "WV", "WI", "WY"),
  full_name = c("Alabama", "Alaska", "Arizona", "Arkansas", "California", "Colorado", "Connecticut", "Delaware", "Florida", "Georgia", "Hawaii", "Idaho", "Illinois", "Indiana", "Iowa", "Kansas", "Kentucky", "Louisiana", "Maine", "Maryland", "Massachusetts", "Michigan", "Minnesota", "Mississippi", "Missouri", "Montana", "Nebraska", "Nevada", "New Hampshire", "New Jersey", "New Mexico", "New York", "North Carolina", "North Dakota", "Ohio", "Oklahoma", "Oregon", "Pennsylvania", "Rhode Island", "South Carolina", "South Dakota", "Tennessee", "Texas", "Utah", "Vermont", "Virginia", "Washington", "West Virginia", "Wisconsin", "Wyoming")
)
merged_data <- left_join(no_empty_data, state_mapping, by = "state")
final_merged_data <- left_join(shapefile, merged_data, by = c("name" = "full_name"))
map <- ggplot(final_merged_data) +
  geom_sf(aes(fill = black_prison_pop)) +
  scale_fill_gradient(name = "Black Prison Population", low = "blue", high = "red", guide = "legend") +
  labs(title = "Geographic Distribution of Black Prison Population in 2016",
       fill = "Black Prison Population") +
  theme_minimal() +
  theme(legend.position = "bottom")
print(map)