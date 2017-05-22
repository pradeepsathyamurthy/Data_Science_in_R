

## This function give you the invesre of an input matrix. 

## Note: In case, inverse of the input metrics exists in the cache, from computation in past, the function will return the 

## inverse from cache, rather than computing it again.

## cacheSolve will need makeCacheMatrix object as input. Only if makeCacheMatrix address is same as used in 

## past, inverse will be returned from teh cache





## Builds set of fucntions and returns a list. It sets the address space to the inverse of the matrix when setinv function is called. 

makeCacheMatrix <- function(x = matrix()) {
    
    ## Initialize the object matrix and X in makeCacheMatrix environment
    
    matrix <- NULL
    
    ## Assign the input argument to the x object in the parent environment, and
    
    ## Assign the value of NULL to the matrix object in the parent environment.
    
    set <- function(y) {
        
        x <<- y
        
        matrix <<- NULL
        
    }
    
    ## get the input matrix
    
    get <- function() x
    
    ## set the inverse of the matrix , which in input (inv) to this function, to a parent variable (matrix)
    
    setinv <- function(inv) matrix <<- inv
    
    ## get the inverse matric stored in the memory
    
    getinv <- function() matrix
    
    ## list of functions with 'elementName = value' syntax example: gives the name 'set' to the set() function defined above
    
    list(set = set, get = get,
         
         setinv = setinv,
         
         getinv = getinv)
    
}





## Inout of the object type makeCacheMatrix

cacheSolve <- function(x, ...) {
    
    ## Get the inverse of a matrix stored in the memory
    
    matrix <- x$getinv()
    
    ## It checks if the value returned by getinv() function is null or not, If not null it returns the value
    
    if(!is.null(matrix)) {
        
        message("getting cached data")
        
        return(matrix)
        
    }
    
    ## it gets the input data passed to makeCacheMatrix function and computes the inverse and set the address space with the inverse and returns the inverse
    
    data <- x$get()
    
    matrix <- solve(data, ...)
    
    x$setinv(matrix)
    
    matrix
    
}


x1=c(4,2,6,6)
x2=c(5,-5,6,0)
x3=c(-5,-3,-4,4)
x4=c(5,1,6,-5)
m=rbind(x1,x2,x3,x4)

cachesolve(makeCacheMatrix(m))
cacheSolve(makeCacheMatrix(m))