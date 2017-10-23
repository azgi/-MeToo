
install.packages("twitteR")
library("twitteR")
library(lubridate)
library(readr)
# Help on API & Tokens: https://dev.twitter.com/oauth/overview/application-owner-access-tokens
# To register your own API go to https://apps.twitter.com
# and get the access and consumer token/secret (you will need a Twitter Account to do this).
# 
consumer_key <- Omitted1
consumer_secret <- Omitted2
access_token <- Omitted3
access_secret <- Omitted4

#TwitteR authentication for each session - unique to each user
setup_twitter_oauth(consumer_key,consumer_secret,access_token,access_secret)

# Code Source: https://stackoverflow.com/questions/36173472/twitter-how-to-search-for-two-hashtags
#tehran lat and long 35.715298, 51.404343
# Manchester lat and long 53.483959, -2.244644.
longLat <- '53.483959, -2.244644,1mi'
hashtags <- c("#MeToo", "#metoo")
needle <- paste(hashtags, collapse = " OR ")

n1 <- 25000
# xdate <- ymd(xdate) + 1:5
# xdate <- "2017-10-11"
# xdate <- "2017-10-13"
# xdate <- "2017-10-14"
# xdate <- "2017-10-15"
# xdate <- "2017-10-16"
# xdate <- "2017-10-17"
# xdate <- "2017-10-18"
# xdate <- "2017-10-19"
# xdate <- "2017-10-20"
# xdate <- "2017-10-21"
# xdate <- "2017-10-22"
tweets <- searchTwitter(needle, n = n1, since = xdate, until = as.character(ymd(xdate) + 1), lang = "en")
tweets <- twListToDF(tweets)


file_name <- paste("tweets", as.character(day(ymd(xdate))),"-",as.character(day(ymd(xdate) + 1)),as.character( month(ymd(xdate), label = TRUE, abbr = TRUE)),".rds")
setwd("/Users/azadeh/Documents/-MeToo")
saveRDS(tweets, file_name)
rm(tweets)

