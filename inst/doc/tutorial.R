## ---- include = FALSE---------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

load("my_googleanalytics_data.RData")

## ----setup--------------------------------------------------------------------
library(fetchGoogleAnalyticsR)

library(dplyr)
library(ggplot2)

## ---- eval = FALSE------------------------------------------------------------
#  
#  my_googleanalytics_data <-
#    fetch_googleanalytics(api_key = "your api key",
#             date_from = Sys.Date()-100,
#             date_to = Sys.Date(),
#             fields = c("campaign", "clicks",
#                        "spend", "impressions", "date"))

## -----------------------------------------------------------------------------
str(my_googleanalytics_data)

## -----------------------------------------------------------------------------
ggplot(my_googleanalytics_data, aes(y = clicks, fill = campaign)) + geom_boxplot()

## -----------------------------------------------------------------------------
lmod <- glm(clicks ~ campaign, data = my_googleanalytics_data, family = "poisson")
summary(lmod)

