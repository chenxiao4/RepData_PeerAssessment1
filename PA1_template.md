Assignment
========================================================
## **1. What is mean total number of steps taken per day?**
- Make a histogram of the total number of steps taken each day

```r
source("~/Desktop/DataScienceCoursera/Reproducible_Rsearch/pa1.R")
a <- plot.h()
```

![plot of chunk unnamed-chunk-1](figure/unnamed-chunk-1.png) 

- Calculate and report the mean and median total number of steps taken per day

```r
a <- c(mean(a), median(a))
names(a) <- c("Mean", "Median")
a
```

```
##   Mean Median 
##   9354  10395
```


## **2. What is the average daily activity pattern?**
- Make a time series plot (i.e. type = "l") of the 5-minute interval (x-axis) and the average number of steps taken, averaged across all days (y-axis)

```r
b <- plot.f()
```

![plot of chunk unnamed-chunk-3](figure/unnamed-chunk-3.png) 

- Which 5-minute interval, on average across all the days in the dataset, contains the maximum number of steps?

```r
max.intv
```

```
## [1] 835
```


## **3. Imputing missing values**
- Calculate and report the total number of missing values in the dataset (i.e. the total number of rows with NAs)

```r
no.NA
```

```
## [1] 2304
```


- Devise a strategy for filling in all of the missing values in the dataset. The strategy does not need to be sophisticated. For example, you could use the mean/median for that day, or the mean for that 5-minute interval, etc.


```r
## fill NA with the average steps, across all days
new <- new.data()
```


- Create a new dataset that is equal to the original dataset but with the missing data filled in.

```r
head(new)
```

```
##   steps       date interval
## 1     2 2012-10-01        0
## 2     0 2012-10-01        5
## 3     0 2012-10-01       10
## 4     0 2012-10-01       15
## 5     0 2012-10-01       20
## 6     2 2012-10-01       25
```


- Make a histogram of the total number of steps taken each day and Calculate and report the mean and median total number of steps taken per day. Do these values differ from the estimates from the first part of the assignment? What is the impact of imputing missing data on the estimates of the total daily number of steps?


```r
a <- plot.h(fill = TRUE)
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8.png) 

```r
a <- c(mean(a), median(a))
names(a) <- c("Mean", "Median")
a
```

```
##   Mean Median 
##  10766  10762
```

```r
## we get a higher mean and median value for the new data due to filled-in
## missing values
```


## **4. Are there differences in activity patterns between weekdays and weekends?**
- Create a new factor variable in the dataset with two levels – “weekday” and “weekend” indicating whether a given date is a weekday or weekend day.


- Make a panel plot containing a time series plot (i.e. type = "l") of the 5-minute interval (x-axis) and the average number of steps taken, averaged across all weekday days or weekend days (y-axis). The plot should look something like the following, which was creating using simulated data:


```r
a <- diff.pattern()
```

![plot of chunk unnamed-chunk-9](figure/unnamed-chunk-9.png) 

```r
head(a)
```

```
##   steps       date interval weekdays
## 1     2 2012-10-01        0  weekday
## 2     0 2012-10-01        5  weekday
## 3     0 2012-10-01       10  weekday
## 4     0 2012-10-01       15  weekday
## 5     0 2012-10-01       20  weekday
## 6     2 2012-10-01       25  weekday
```








