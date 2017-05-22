# makevector() function creates:
# 1. R - Object
#   a. stores a vector
#   b. stored vectors mean

makeVector <- function(x = numeric()) {

    m <- NULL
    
    set <- function(y) {
        x <<- y
        m <<- NULL
    }
    
    get <- function() x
    
    setmean <- function(mean){
        m <<- mean
    } 
    
    getmean <- function() m
    
    list(set = set, get = get,
         setmean = setmean,
         getmean = getmean)
}


# Require an argument returned by meanvector()
# Retrieve mean from cached value that is stored in makevector's object's environment

cachemean <- function(x, ...) {
    
    m <- x$getmean()
    
    if(!is.null(m)) {
        message("getting cached data")
        return(m)
    }
    
    data <- x$get()
    
    m <- mean(data, ...)
    
    x$setmean(m)
    
    m
}

# Calling the function

cachemean(makeVector(1:100))

makeVector(1:100) # This becomes an object stored in environment: environment: 0x000000004dab1830
makeVector(1:50) # This becomes an abother object stored in environemnt: 0x000000002fb1ae30
makeVector(1:200) # This becomes an abother object stored in environemnt: 0x0000000003118a40
makeVector(1:100) # This will again be  new object, old one would be garbage collected

