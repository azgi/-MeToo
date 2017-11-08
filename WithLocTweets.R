# Downloading data with rtweet package based on instructions from:
# https://www.r-bloggers.com/a-call-to-tweets-blog-posts/


library(rtweet)
library(httr)

# # this relies on you setting up an app in apps.twitter.com
# 
# twitter_token <- create_token(
#         app = Sys.getenv("MeToo Manchester"),
#         consumer_key = Sys.getenv("TIXCqhtyogWsGJvTNaHWkKaWl"), 
#         consumer_secret = Sys.getenv("ikmy6J73eLTzSIcaancrZPHm4t3UR3bYeyHOz9BIrPKD98k2oX")
# ) 
# 
# saveRDS(twitter_token, "~/.rtweet-oauth.rds")
# 
# 
# # ideally put this in ~/.Renviron
# Sys.setenv(TWITTER_PAT=path.expand("~/.rtweet-oauth.rds"))
# 
# rtweet_folks <- search_tweets("#rstats", n=300)


## Coursera codes for twitter api with httr package


# twitter_app <- oauth_app("MeToo Manchester", 
#                          key = "TIXCqhtyogWsGJvTNaHWkKaWl", 
#                          secret = "ikmy6J73eLTzSIcaancrZPHm4t3UR3bYeyHOz9BIrPKD98k2oX")
# sig = sign_oauth1.0(twitter_app,
#                     token = "89836921-DHEgPuO8JxngL794HJBI3dzpMGmMBW5fJJx2rP0U7",
#                     token_secret = "V7G0ldUMpkw55WLpdMx6AcwPRcBrBmLfcnrEKYk5BVaHG")
# 
# homeTL = GET("https://stream.twitter.com/1.1/statuses/filter.json", sig, track = "blueplanet2")
# json1 = content(homeTL)
# json2 = jsonlite::fromJSON(toJSON(json1))
# json2[1,1:4]

## httr package general use : https://cran.r-project.org/web/packages/httr/vignettes/quickstart.html
xurl <- "https://www.indeed.co.uk/jobs?q=data%20analyst&l=London%2C%20Greater%20London&ts=1509301854802&rq=1&fromage=last"#"https://www.indeed.co.uk" # "http://httpbin.org/get"
r <- GET(xurl)
r
status_code(r)
headers(r)
http_status(r)
