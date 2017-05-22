## Put comments here that give an overall description of what your

## functions do



## Write a short comment describing this function



makeCacheMatrix <- function(x = matrix()) {
    
    i <- NULL
    
    set <- function(y) {
        
        x <<- y
        
        i <<- NULL
        
    }
    
    get <- function() x
    
    setinverse <- function(inverse) i <<- inverse
    
    getinverse <- function() i
    
    list(set = set, get = get,
         
         setinverse = setinverse,
         
         getinverse = getinverse)
    
}





## Write a short comment describing this function



cacheSolve <- function(x, ...) {
    
    ## Return a matrix that is the inverse of 'x'
    
    
    
    i <- x$getinverse()
    
    if(!is.null(i)) {
        
        message("getting cached data")
        
        return(i)
        
    }
    
    data <- x$get()
    
    i <- solve(data, ...)
    
    x$setinverse(i)
    
    i
    
}


x1=c(4,2,6,6)
x2=c(5,-5,6,0)
x3=c(-5,-3,-4,4)
x4=c(5,1,6,-5)
m=rbind(x1,x2,x3,x4)

cacheSolve(makeCacheMatrix(m))