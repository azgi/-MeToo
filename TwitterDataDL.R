
install.packages("twitteR")
library("twitteR")
# Go to https://dev.twitter.com/oauth/overview/application-owner-access-tokens
# and get the access and consumer token/secret (you will need a Twitter Account to do this).
consumer_key <- ''
consumer_secret <- ''
access_token <- ''
access_secret <- ''

#TwitteR authentication for each session - unique to each user
setup_twitter_oauth(consumer_key,consumer_secret,access_token,access_secret)

# Code Source: https://stackoverflow.com/questions/36173472/twitter-how-to-search-for-two-hashtags

hashtags <- c("#MeToo", "#metoo")
needle <- paste(hashtags, collapse = " OR ")
tweets <- searchTwitter(needle, n = 10)
df <- twListToDF(tweets)
for (hashtag in hashtags) {
        write.csv(df[grep(hashtag, tolower(df$text), fixed = TRUE), ], paste0(hashtag, ".csv"))
}
