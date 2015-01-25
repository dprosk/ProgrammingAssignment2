## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

#makeCacheMatrix <- function(x = matrix()) {

#}


## Write a short comment describing this function

#cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
#}

#makeCacheMatrix: This function creates a special "matrix" object 
#that can cache its inverse.
makeCacheMatrix <- function(x = matrix()){
    inverse_matrx <- NULL
    set <- function(y) {
        x <<- y
        inverse_matrx <<- NULL
    }
    
    get <- function() {
        x
    }
    
    setinverse <- function(invmtrx) {
        inverse_matrx <<-invmtrx
    }
    
    getinverse <- function() {
        inverse_matrx
    }
    
    list(set = set, get = get,
         setinverse = setinverse,
         getinverse = getinverse)
}

#cacheSolve: This function computes the inverse of the special "matrix" 
#returned by makeCacheMatrix above. If the inverse has already been calculated 
#(and the matrix has not changed), then cacheSolve should retrieve 
#the inverse from the cache.
cacheSolve <- function(x, ...) {
    inverse_matrx <- x$getinverse()
    if (!is.null(inverse_matrx)) {
        message("getting cached data")
        return(inverse_matrx)
    }
    inverse_matrx <- solve(x$get())
    x$setinverse(inverse_matrx)
    inverse_matrx
}
