### combining the daily tweets
setwd("/Users/azadeh/Documents/-MeToo")
xdir <- dir()
xfile <- grep("\\.rds", xdir)
metoodata <- read_rds(xdir[xfile[1]])[-(53:1),]
for(i in xfile){
        xdata <- read_rds(xdir[xfile[i]])
        dim(xdata)
        metoodata <- rbind(xdata, metoodata)
}
rm(xdata)
