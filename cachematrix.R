## `makeCacheMatrix`: This function creates a special "matrix" object
that can cache its inverse.

## The first function, `makeCacheMatrix` creates a special "matrix", which is
really a list containing a function to

1.  set the value of the matrix
2.  get the value of the matrix
3.  set the value of the inverse
4.  get the value of the inverse

makeCacheMatrix <- function(x = matrix()) {
        m <- NULL
        set <- function(y) {
                x <<- y #set y to a global variable x
                m <<- NULL #set a null global variable m 
        }
        get <- function() x # get x 
        setmatrix<- function(solve) m <<- solve(x) #assign solve to m
        getmatrix <- function() m #get m
        list(set = set, get = get,
             setmatrix = setmatrix,
             getmatrix = getmatrix)
}


## `cacheSolve`: This function computes the inverse of the special
"matrix" returned by `makeCacheMatrix` above. If the inverse has
already been calculated (and the matrix has not changed), then
`cacheSolve` should retrieve the inverse from the cache.

cacheSolve <- function(x, ...) {
        m <- getmatrix()
        if(!is.null(m)) { # if m exsit
                message("getting cached data") # get the value of m
                return(m)
        }
        data <- get()#get x
        m <- solve(data, ...)
        setmatrix(m)
        m
}
