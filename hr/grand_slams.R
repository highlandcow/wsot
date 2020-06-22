# Exploring Grand Slams

expandNumRunners <- function(eventData) {
  #' Returns vector with numbers of runners on during a play
  events <- eventData[, c("BASE1_RUN_ID", "BASE2_RUN_ID", "BASE3_RUN_ID")]
  runnersOn <- (eventData$BASE1_RUN_ID != "") + (eventData$BASE2_RUN_ID != "") + (eventData$BASE3_RUN_ID != "")
  return(runnersOn)
}

expandIsGrandSlam <- function(eventData, numRunnersOnVarName) {
  #' Returns vector indicating whether or not a grand slam was hit
  isGrandSlam <- ifelse(eventData$EVENT_CD == 23 & eventData$runnersOn2019 == 3, 1, 0)
  return(isGrandSlam)
}

# Add count of runners on for each event
runnersOn2019 <- expandNumRunners(events2019)
events2019 <- cbind(events2019, runnersOn2019) 
rm(runnersOn2019)

# Add isGrandSlam flag
isGrandSlam <- expandIsGrandSlam(events2019, runnersOn2019)
events2019 <- cbind(events2019, isGrandSlam)

# Get count of rows where a grand slam happened (isGrandSlam == 1)
nrow(events2019[events2019$isGrandSlam == 1, ])



# Data can be validated with https://www.baseball-almanac.com/hitting/higs5.shtml
