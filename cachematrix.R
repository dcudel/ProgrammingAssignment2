## Matrix inversion is usually a costly computation and their may be some 
## benefit to caching the inverse of a matrix rather than compute it repeatedly
## (there are also alternatives to matrix inversion that we will not discuss 
## here). Your assignment is to write a pair of functions that cache the inverse
## of a matrix

## This function creates a special "matrix" object that can cache its inverse.
makeCacheMatrix <- function(x = matrix()) {
    inv <- NULL
    
    set <- function(y) {
        x <<-y
        inv <<- NULL
    }
    get <- function() x
    getinv <- function() inv
    setinv <- function(invmatrix) inv <<- invmatrix
    list(set = set,
         get = get,
         getinv = getinv,
         setinv = setinv)
}


## This function computes the inverse of the special "matrix" returned 
## by makeCacheMatrix above. If the inverse has already been calculated
## (and the matrix has not changed), then the cachesolve should retrieve
## the inverse from the cache
cacheSolve <- function(x, ...) {
    ## Return a matrix that is the inverse of 'x'
    inv <- x$getinv()
    if (!is.null(inv)) {
        message("getting cached inverse")
        return (inv)
    }
    
    m <- x$get()
    inv <- solve(m, diag(dim(m)[1]))
    x$setinv(inv)
    inv
}
