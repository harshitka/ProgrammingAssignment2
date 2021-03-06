## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

##Caching the inverse of a matrix

##Making the functions makeCachematrix and cacheSolve.

##makeCacheMatrix: to create the "matrix" object that can cache its inverse
library(matlib)

makeCacheMatrix <- function(x = matrix()) {
m=NULL
set <- function(y1)
{
  x <<- y1
  m <<- NULL
}
get <- function() x
setinv <- function(inv) m<- inv
getinv <- function() m
list(set=set,get=get,setinv=setinv,getinv=getinv)
}


## Write a short comment describing this function

##cacheSolve: function to get the inverse of the special "matrix"

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  m <- x$getinv()
  
  if(!is.null(m))
  {
    message("getting cached data")
    return(m)
  }
  data<- x$get()
  m <- solve(data, ...)
  x$setinv(m)
  m
  }

mat<-matrix(c(1,4,9,0,-3,2,2,7,8),3,3)
m1 <- makeCacheMatrix(mat) #make cache matrix
cacheSolve(m1) # returns inverse

