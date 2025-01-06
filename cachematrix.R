## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {

}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
}

## This function creates a special "matrix" object that can cache its inverse.
makeCacheMatrix <- function(x = matrix()) {
  inv <- NULL  # Initialize the inverse property as NULL
  
  # Function to set the matrix
  set <- function(y) {
    x <<- y       # Assign the new matrix to x
    inv <<- NULL  # Reset the cached inverse
  }
  
  # Function to get the matrix
  get <- function() x
  
  # Function to set the inverse of the matrix
  setInverse <- function(inverse) inv <<- inverse
  
  # Function to get the inverse of the matrix
  getInverse <- function() inv
  
  # Return a list of functions to interact with the cache
  list(set = set, get = get, setInverse = setInverse, getInverse = getInverse)
}

## This function computes the inverse of the special "matrix" returned by makeCacheMatrix.
## If the inverse has already been calculated and the matrix has not changed,
## it retrieves the inverse from the cache.
cacheSolve <- function(x, ...) {
  inv <- x$getInverse()  # Retrieve the cached inverse, if it exists
  
  # If the inverse is already cached, return it
  if (!is.null(inv)) {
    message("Getting cached inverse")
    return(inv)
  }
  
  # Otherwise, compute the inverse
  mat <- x$get()  # Get the matrix from the cache
  inv <- solve(mat, ...)  # Compute the inverse
  x$setInverse(inv)  # Cache the inverse
  inv  # Return the inverse
}
