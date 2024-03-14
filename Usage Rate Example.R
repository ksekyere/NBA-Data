library(dplyr)



#upload data

nba_2022_2023  <- 
  read_csv("~/Downloads/NBA Stats 202223 All Stats  NBA Player Props Tool.csv")

#rename column headers
names(nba_2022_2023) = tolower(names(nba_2022_2023))
names(nba_2022_2023) = gsub("%", "", names(nba_2022_2023))
  


#calculate mean usage rate
mean_usage = nba_2022_2023 %>% pull(`USG%`) %>% mean

#count number of players above average usage rate for each team
#' possible questions answered 
#' which teams have the most players with above average usage rates?
nba_2022_2023 %>%
  group_by(team) %>%
  summarise(players.above.average = length(name[usg > mean_usage])) %>%
  arrange(desc(players.above.average)) %>% View
