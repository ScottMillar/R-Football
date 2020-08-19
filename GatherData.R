Sys.setenv(R_REMOTES_NO_ERRORS_FROM_WARNINGS="true")

require(StatsBombR)

require(dplyr)

Comp <- FreeCompetitions()

Matches <- FreeMatches(Comp)

counter <- 1
for(i in 1:nrow(Matches)) {
  temp <- get.matchFree(Matches[i,])
  temp <- cleanlocations(temp)
  temp <- goalkeeperinfo(temp)
  temp <- shotinfo(temp)
  temp <- defensiveinfo(temp)
  
  if(counter==1){
    events <- temp
  } else {
    events <- bind_rows(events, temp)
  }
  counter <- 1 + counter
}
