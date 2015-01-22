## Functions created for Programming Assignment 2
## Coursera R Programming Course beginning 1/5/2015
## by Bill Creager (william.creager@gmail.com)
##
## makeCacheMatrix and cacheSolve are functions that compute the inverse of
## a matrix, but also stores the inverse for future use so that it need
## not be recalculated if used in code that requires use of the inverse
## more than once.

## makeCacheMatrix: This function creates a special "matrix" object that can 
## cache its inverse.

makeCacheMatrix <- function(x = matrix()) {

}


## cacheSolve: This function computes the inverse of the special "matrix" 
## returned by makeCacheMatrix above. If the inverse has already been calculated
## (and the matrix has not changed), then the cachesolve should retrieve 
## the inverse from the cache.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
}
