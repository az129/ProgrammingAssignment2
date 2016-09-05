## Put comments here that give an overall description of what your
## functions do

## This function creates a vector of functions to:
## 1. set the value of matrix, 2. get the value of matrix 
## 3. set the matrix inverse, 4. get the matrix inverse

makeCacheMatrix <- function(x = matrix()) {
  m <- NULL
  
  set <- function(y) {
    x <<- y
    m <<- NULL
  }
  
  get <- function() {
    x
  }
  
  setInv <- function(inv) {
    m <<- inv
  }
  
  getInv <- function() {
    m
  }
  
  list(set = set, get = get,
       setInv = setInv,
       getInv = getInv)
}


## This function returns the inverse of matrix created with the above function. 
## If the inverse is already stored in "cache", then it returns the cached value and
## skips calculation. 
## If the inverse is not in the cache, then it calculates and returns the inverse.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  inverse <- x$getInv()
  
  if(!is.null(inverse)) {
    message("getting cached data")
    return(inverse)
  }
  
  data <- x$get()
  inverse <- solve(data, ...)
  x$setInv(inverse)
  inverse
}
