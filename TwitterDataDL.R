
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

hashtags <- c("#MeToo", "#metoo")
needle <- paste(hashtags, collapse = " OR ")
tweets <- searchTwitter(needle, n = 5000)
tweets <- twListToDF(tweets)

names(tweets)
