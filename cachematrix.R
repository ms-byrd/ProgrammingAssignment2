## Created from, on: 		CV, 24/04/2014
## Examined by:			---
## Purpose of the program: 	This code is for creating a matrix and compute the inverse of the matrix.
## 				If the inverse has already been computed once, the solution is cached.
## Software, Vers.: 		R x64, 3.0.2
## Operating system:		Windows 7
## Modifications:		CV, 25/04/2014, header changed

## first function will create matrix

makeCacheMatrix <- function(x = matrix()) {
        m <- NULL
        set <- function(y) {
                x <<- y
                m <<- NULL
        }
        get <- function() x
        setInverse <- function(solve) m <<- solve
        getInverse <- function() m
        list(set = set, get = get,
             setInverse = setInverse ,
             getInverse = getInverse )
}


## second function will cache the data or compute it, depending if m is NULL or not (from above)

cacheSolve <- function(x, ...) {
        m <- x$getInverse ()
        if(!is.null(m)) {
                message("getting cached data")
                return(m)
        }
        data <- x$get()
        m <- solve(data, ...)
        x$setInverse (m)
        m
}
