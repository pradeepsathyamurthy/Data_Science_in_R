# method-2
corr <- function(directory,threshold=0){
    
    file.list <- list.files(path = directory, full.names = TRUE)
    data.complete <- data.frame()
    final.vector <- vector(mode="numeric")
    k <- 0
    for(i in seq_along(file.list)){
        
        data <- read.csv(file.list[i])
        good <- complete.cases(data)
        data.complete <- data[good,]
        num.rows <- nrow(data.complete)
        if(num.rows > threshold){
            corr.calc <- cor(data.complete$sulfate,data.complete$nitrate)
            k <- k+1
            final.vector[k] <- corr.calc
        }
    }
    print(final.vector)
}



cr <- corr("specdata", 400)
head(cr)
summary(cr)

cr <- corr("specdata", 5000)
summary(cr)
length(cr)

cr <- corr("specdata")
summary(cr)
length(cr)


cr <- corr("specdata")                
cr <- sort(cr)                
set.seed(868)                
out <- round(cr[sample(length(cr), 5)], 4)
print(out)
# 0.2688  0.1127 -0.0085  0.4586  0.0447

cr <- corr("specdata", 129)                
cr <- sort(cr)                
n <- length(cr)                
set.seed(197)                
out <- c(n, round(cr[sample(n, 5)], 4))
print(out)
# 243.0000   0.2540   0.0504  -0.1462  -0.1680   0.5969

cr <- corr("specdata", 2000)                
n <- length(cr)                
cr <- corr("specdata", 1000)                
cr <- sort(cr)
print(c(n, round(cr, 4)))
# 0.0000 -0.0190  0.0419  0.1901

