## Functions created for Programming Assignment 2
## Coursera R Programming Course beginning 1/5/2015
## by Bill Creager (william.creager@gmail.com)
##
## makeCacheMatrix and cacheSolve are functions that compute the inverse of
## a matrix, but also store the inverse for future use so
## that it need not be recalculated if used in code that requires use of the 
## inverse more than once.

## makeCacheMatrix: This function creates a special "matrix" object that can 
## cache its inverse. It doesn't return a matrix: it returns a list of 
## four functions:
##      set (called with makeCacheMatrix$set) -- it stores the "original matrix"
##              supplied to makeCacheMatrix into a "local copy" within
##              the environment of makeCacheMatrix, which is the parent
##              environment of the set function. It also sets the inverse, again
##              in the makeCacheMatrix environment, to NULL. Note that the
##              "deep assignment operator", or <<-, is used to store the copy
##              within the parent environment. I found 
##              http://adv-r.had.co.nz/Environments.html
##              to be a useful reference to help explain how this worked.
##      get -- retrieves the "local copy" of the matrix
##      setinv -- this function is given the a matrice's inverse and stores a
##              "local copy" in its parent environment (which is  
##              makeCacheMatrix). It's called from within cacheSolve the first
##              time that the inverse is calculated.
##      getinv -- retrieves the "local copy" of the inverse.

makeCacheMatrix <- function(x = matrix()) {
        inv <- NULL
        set <- function(y) {
                x <<- y
                inv <<- NULL
        }
        get <- function() x
        setinv <- function(inverse) inv <<- inverse
        getinv <- function() inv
        list(set = set, get = get,
             setinv = setinv,
             getinv = getinv)

}

## cacheSolve: This function computes the inverse of the special "matrix" 
## returned by makeCacheMatrix above. If the inverse has already been calculated
## (and the matrix has not changed), then the cachesolve should retrieve 
## the inverse from the cache.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        ## But it's a bit more complicated than that.
        ## It's given a list of four functions: the x$get() function
        ## returns a cached copy of the "original matrix" x
        ## The x$getinv() function returns a cached copy of the inverse of x,
        ## if it's already been calculated (and cacheSolve then passes this
        ## onward as its return value).
        ## But if the inverse has not previously
        ## been calculated, cacheSolve calculates the inverse of the original
        ## matrix, stores a cache copy of the inverse via x$setinv(),
        ## then returns the inverse as its return value.
        inv <- x$getinv()
        if(!is.null(inv)) {
                message("getting cached data")
                return(inv)
        }
        data <- x$get()
        inv <- solve(data, ...)
        x$setinv(inv)
        inv
}
