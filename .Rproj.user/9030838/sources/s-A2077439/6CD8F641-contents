library(dplyr)
library(stringr)
library(glue)
library(tidytext)
library(wordcloud)
library(wordcloud2)

dir <- "/Users/azadeh/Documents/-MeToo"
setwd(dir)
dir()
source("combineDailyData.R")
metoo <- tbl_df(metoo)
head(metoo)
names(metoo)

# checking how many geo locations are available
n_withGeo <-sum(!is.na(metoo$longitude))

# checking how many distnct tweeter texts we have
xtext <- metoo %>% select(text) %>% distinct() #89K
xid <- metoo %>% select(id) %>% distinct() # 200K
xscreen <- metoo %>% select(screenName) %>% distinct() #142K

with(metoo, plot.ts(created, retweetCount))
twtTime <- metoo %>% group_by() %>% select(created) %>% summarise(n())
with(metoo, plot.ts(created))

## Top 10 tweets
table(metoo$favorited) # all false
table(metoo$retweeted) # all false

textsranked2 <- metoo %>% group_by(text) %>%
        select(text, favoriteCount, retweetCount) %>% 
        summarise(n(),fav = max(favoriteCount), retweet = max(retweetCount)) %>%
        mutate(q = quantile(retweet, probs = c(90)/100)) %>%
        arrange(desc(retweet), desc(fav))
top10 <- textsranked2[1:10,]

with(textsranked2, plot(retweet, fav))
zoomed <- textsranked2 %>% filter(retweet < 5000, fav < 10000)
with(zoomed, plot(retweet, fav))


twtTokens <- metoo %>% select(text)
twtTokens <-  unnest_tokens(twtTokens, "twtWords", "text")
head(twtTokens)
twtTokens <- twtTokens %>% count(twtWords, sort = T) 
head(twtTokens)

positives <- read.table("positive_words_en.txt")
positives <- positives %>% mutate(positive = 1)

negatives <- read.table("negative_words_en.txt")
negatives <- negatives %>% mutate(negative = 1)

# twtTokens1 <- inner_join(twtTokens, negatives, by = c("twtWords" = "V1"))
twtTokens <- merge(twtTokens, negatives, by.x = "twtWords", by.y = "V1", all.x = TRUE )
twtTokens <- merge(twtTokens, positives, by.x = "twtWords", by.y = "V1", all.x = TRUE )

letterCloud(negativeCloud, word = "MeToo")

negativeCloud <- twtTokens %>% filter( negative == 1) %>% select(twtWords, n)
wordcloud2(negativeCloud)

positiveCloud <- twtTokens %>% filter( positive == 1) %>% select(twtWords, n)
wordcloud2(positiveCloud)


twtTokens1 <- metoo %>% select(text)
twtTokens1 <-  unnest_tokens(twtTokens1, "ngrams2", "text", token = "ngrams", n = 2)
head(twtTokens)
twtTokens <- twtTokens %>% count(twtWords, sort = T) 
head(twtTokens)

