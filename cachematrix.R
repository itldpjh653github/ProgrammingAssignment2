## Put comments here that give an overall description of what your
## functions do
## Data Science Specialization, Course 2, R Programming, Week 3
## Note: per instructions, "assume that the matrix supplied is 
## always invertible". Therefore, there is no checking of arguments,
## nor is there any handling of errors.

## Create an object (or whatever R calls it) with various methods
## to store a matrix and an inverse.

makeCacheMatrix <- function(x = matrix()) {
  the_inverse <- NULL
  
  set <- function(y) {
    x <<- y
    the_inverse <<- NULL
  }
  
  get <- function() x
  ##Based off provided example; in particular casing is not consistent,
  ##but it matches provided example
  setinverse <- function(inverse){
    the_inverse <<- inverse
  }
  getinverse <- function() {
    the_inverse
  }
  
  list(set = set, get = get, 
       getinverse = getinverse, setinverse = setinverse)
}


## Write a short comment describing this function
## Calculate the inverse of a matrix, using a
## cached value if available
## ex: 
##   m = makeCacheMatrix( matrix( c(1,2,3,4),nrow=2,ncol=2))
##   cacheSolve(m)
cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  the_inverse <- x$getinverse()
  if(!is.null(the_inverse)) {
    message("getting cached data")
    return(the_inverse)
  }
  
  data <- x$get()
  the_inverse <- solve(data)
  x$setinverse(the_inverse)  
  the_inverse
}
