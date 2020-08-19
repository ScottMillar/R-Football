library(tidyverse)
library(StatsBombR) 
Comp <- FreeCompetitions() %>%
  filter(competition_id==11 & season_name=="2005/2006") 
Matches <- FreeMatches(Comp) 
StatsBombData <- StatsBombFreeEvents(MatchesDF = Matches, Parallel = T) 
StatsBombData = allclean(StatsBombData)


library(SBpitch)
passes = StatsBombData %>%
  filter(type.name=="Pass" & is.na(pass.outcome.name) & player.id==5503)  %>%
  filter(pass.end_location.x>=102 & pass.end_location.y<=62 & pass.end_location.y>=18) 
create_Pitch() +
  geom_segment(data = passes, aes(x = location.x, y = location.y,
                                  xend = pass.end_location.x, yend = pass.end_location.y),
               lineend = "round", size = 0.6, arrow = arrow(length = unit(0.08, "inches"))) +
  labs(title = "Lionel Messi, Completed Box Passes", subtitle = "La Liga, 2005/2006") +
  scale_y_reverse()+
  coord_fixed(ratio = 105/100)

