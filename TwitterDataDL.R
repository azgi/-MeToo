
install.packages("twitteR")
library("twitteR")
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

tweets10 <- searchTwitter(needle, n = 25000, since = "2017-10-9", until = "2017-10-10")
tweets11 <- searchTwitter(needle, n = 25000, since = "2017-10-10", until = "2017-10-13")
tweets14 <- searchTwitter(needle, n = 25000, since = "2017-10-13", until = "2017-10-14")
tweets15 <- searchTwitter(needle, n = 5000, since = "2017-10-14", until = "2017-10-15" )
tweets16_1 <- searchTwitter(needle, n = 25000, since = "2017-10-15", until = "2017-10-16" )
tweets17 <- searchTwitter(needle, n = 5000, since = "2017-10-16", until = "2017-10-17" )
tweets18 <- searchTwitter(needle, n = 5000, since = "2017-10-17", until = "2017-10-18" )
tweets19 <- searchTwitter(needle, n = 5000, since = "2017-10-18", until = "2017-10-19" )
tweets20 <- searchTwitter(needle, n = 15000, since = "2017-10-19", until = "2017-10-20" )

tweets2 <- searchTwitter(needle, n = 5000, since = "2017-10-20", until = "2017-10-21" )

tweets14 <- twListToDF(tweets14)
tweets15 <- twListToDF(tweets15)
tweets16 <- twListToDF(tweets16)
tweets16_1 <- twListToDF(tweets16_1)

tweets17 <- twListToDF(tweets17)
tweets18 <- twListToDF(tweets18)
tweets19 <- twListToDF(tweets19)
tweets20 <- twListToDF(tweets20)

getwd()
setwd("/Users/azadeh/Documents/-MeToo")
saveRDS(tweets14,"tweets13-14Oct.rds")
saveRDS(tweets15,"tweets14-15Oct.rds")
saveRDS(tweets16,"tweets15-16Oct.rds")
saveRDS(tweets16_1,"tweets15-16Oct.rds")
saveRDS(tweets17,"tweets16-17Oct.rds")

saveRDS(tweets18,"tweets17-18Oct.rds")
saveRDS(tweets19,"tweets18-19Oct.rds")

saveRDS(tweets20,"tweets19-20Oct.rds")


names(tweets)
