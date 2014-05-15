no.NA <- 0
max.intv <- 0
or.data <- read.csv("activity.csv",sep = ",")


read <- function(){
        data <- read.csv("activity.csv",sep = ",")
        nt <- nrow(data)
        data <- data[!is.na(data[,1]),]
        no.NA <<- nt - nrow(data)
        as.character(data[,2])
        data
}

plot.h <- function(fill = FALSE){
        
        if(fill) data <- or.data
        else data <- read()
        s <- split(data, data$date)
        out <- lapply(s,function(x) sum(x[,1]))
        out <- as.numeric(unlist(out))
        hist(out,xlab = "Steps", main = "Histogram of total number of steps per day")
        ##stat <-c(mean(out), median(out))
        ##names(stat) <- c("Mean", "Median")
        ##stat
        invisible(out)
}


plot.f <- function(plot = TRUE,fill = FALSE, xtitle = "Interval",ytitle = "Averaged number of steps",title = NULL){
        if(fill) data <- or.data
        else data <- read()
        s <- split(data,data$interval)
        out <- lapply(s,function(x) mean(x[,1]))
        x <- as.numeric(names(out))
        y <- as.numeric(out)
        if (plot) plot(x,y,type = "l", xlab = xtitle, ylab = ytitle, main = title)
        ind <- which(y == max(y))   
        if (plot) abline(v = x[ind],col = "blue")
        max.intv <<- x[ind]
        invisible(out)
}


new.data <- function(){
        
        
        data.fill <- function(x){
                
                or.data[is.na(or.data[,1]) & (or.data[,3] == x$interval),1] <<- x$steps
        }
                    
        out <- plot.f(FALSE)
        out <- data.frame(steps = round(unlist(out)),interval = names(out))
        s <- split(out,out$interval)
        lapply(s,data.fill)
        invisible(or.data)
              
        
}


diff.pattern <- function(){
        
        new.weekdays <- function(){
                a <- weekdays(as.Date(or.data[,2]))
                a[(a == "Saturday") | (a == "Sunday")] <- "weekend"
                a[a != "weekend"] <- "weekday"
                a
        }
        new <- data.frame(new.data(),weekdays = new.weekdays())
        par(mfrow = c(2,1))
        a <- new[new[,4] == "weekend",] 
        
        s <- split(a,a$interval)
        out <- lapply(s,function(x) mean(x[,1]))
        xa <- as.numeric(names(out))
        ya <- as.numeric(out)
        
 
        b <- new[new[,4] == "weekday",] 
        s <- split(b,b$interval)
        out <- lapply(s,function(x) mean(x[,1]))
        xb <- as.numeric(names(out))
        yb <- as.numeric(out)
        
        par(mfrow = c(1,1))
        plot(xa,ya,type  = "l", col = "blue",xlab="Interval",ylab = "Number of steps")
        par(new = T)
        plot(xb,yb,axes = F, type = "l", col = "red",xlab=" ",ylab = " ")
        
        legend("topright",lty = 1, col = c("red","blue"),legend=c("weekday","weekend"))
        invisible(new)
        
}
