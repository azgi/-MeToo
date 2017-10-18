# Code Source: https://stackoverflow.com/questions/36173472/twitter-how-to-search-for-two-hashtags

hashtags <- c("#MeToo", "#metoo")
needle <- paste(hashtags, collapse = " OR ")
tweets <- searchTwitter(needle, n = 10)
df <- twListToDF(tweets)
for (hashtag in hashtags) {
        write.csv(df[grep(hashtag, tolower(df$text), fixed = TRUE), ], paste0(hashtag, ".csv"))
}