
R version 3.2.3 (2015-12-10) -- "Wooden Christmas-Tree"
Copyright (C) 2015 The R Foundation for Statistical Computing
Platform: x86_64-w64-mingw32/x64 (64-bit)

R is free software and comes with ABSOLUTELY NO WARRANTY.
You are welcome to redistribute it under certain conditions.
Type 'license()' or 'licence()' for distribution details.

  Natural language support but running in an English locale

R is a collaborative project with many contributors.
Type 'contributors()' for more information and
'citation()' on how to cite R or R packages in publications.

Type 'demo()' for some demos, 'help()' for on-line help, or
'help.start()' for an HTML browser interface to help.
Type 'q()' to quit R.

[Previously saved workspace restored]

> makeCacheMatrix <- function(x = numeric()) 
+   {
+ # holds the cached value/NULL 
+ # initial value = NULL
+     cache <- NULL
+ # new matrix
+     setMatrix <- function(newValue) 
+      {
+       x <<- newValue
+ #flush the cache
+       cache <<- NULL
+       }
+ # returns matrix
+      getMatrix <- function() 
+        {
+         x
+        }
+ # cache of argument 
+ cacheInverse <- function(solve) 
+   {
+    cache <<- solve
+    }
+ # get cache value
+ getInverse <- function() 
+   {
+    cache
+   }
+ # return a list
+ list(setMatrix = setMatrix, getMatrix = getMatrix, cacheInverse = cacheInverse, getInverse = getInverse)
+  }
>  # makeCacheMatrix
>  cacheSolve <- function(y, ...)
+     {
+ # get cache
+                inverse <- y$getInverse()
+ # if a cached value is there return that
+                   if(!is.null(inverse)) 
+              {
+                 message("getting cached data")
+                 return(inverse)
+                }
+ # otherwise get the matrix, caclulate the inverse & store in cache
+ data <- y$getMatrix()
+ inverse <- solve(data)
+ y$cacheInverse(inverse)
+ # return inverse
+ inverse
+ }
>   
> 
