DepthProc
========================

*DepthProc* project consist of a set of statistical procedures based on so called statistical depth functions. The project involves free available R package and its description.

### Versions

#### CRAN release version

[![CRAN version](http://www.r-pkg.org/badges/version/DepthProc)](http://cran.rstudio.com/web/packages/DepthProc/index.html)
[![Downloads](http://cranlogs.r-pkg.org/badges/DepthProc)](http://cran.rstudio.com/package=DepthProc)
[![](http://cranlogs.r-pkg.org/badges/grand-total/DepthProc)](http://cran.rstudio.com/web/packages/DepthProc/index.html)
[![Build Status](https://travis-ci.org/zzawadz/DepthProc.svg?branch=master)](https://travis-ci.org/zzawadz/DepthProc)
[![AppVeyor Build Status](https://ci.appveyor.com/api/projects/status/github/zzawadz/DepthProc?branch=master&svg=true)](https://ci.appveyor.com/project/zzawadz/DepthProc)
[![Coverage Status](https://img.shields.io/codecov/c/github/zzawadz/DepthProc/master.svg)](https://codecov.io/github/zzawadz/DepthProc?branch=master)

## Installation


*DepthProc* is avaiable on CRAN:

```r
install.packages("DepthProc")
```

You can also install it from GitHub with *devtools* package:

```r
library(devtools)
install_github("zzawadz/DepthProc")
```

## Main features:

### Speed and multithreading

Most of the code is written in C++ for additional efficiency. We also use OpenMP to speedup computations with multithreading:


```r
library(DepthProc)

# Tested on Intel Core i7 3770K
d <- 10
x <- mvrnorm(1000, rep(0, d), diag(d))
# Default - utilize as many threads as possible
system.time(depth(x, x, method = "LP"))
```

```
##    user  system elapsed 
##    0.83    0.01    0.12
```

```r
# Only single thread - 4 times slower:
system.time(depth(x, x, method = "LP", threads = 1))
```

```
##    user  system elapsed 
##     0.5     0.0     0.5
```

```r
# Two threads - 2 times slower:
system.time(depth(x, x, method = "LP", threads = 2))
```

```
##    user  system elapsed 
##    0.46    0.00    0.23
```

## Available depth functions

```r
x <- mvrnorm(100, c(0, 0), diag(2))

depthEuclid(x, x)
depthMah(x, x)
depthLP(x, x)
depthProjection(x, x)
depthLocal(x, x)
depthTukey(x, x)

## Base function to call others:
depth(x, x, method = "Projection")
depth(x, x, method = "Local", depth1 = "LP")

## Get median
depthMedian(x, method = "Local")
```

## Basic plots

### Contour plot

```r
library(mvtnorm)
y <- rmvt(n = 200, sigma = diag(2), df = 4, delta = c(3, 5))
depthContour(y, points = TRUE, lwd = 2)
```
![plot of chunk contour](figure/contour.png) 

### Perspective plot
 
```r
depthPersp(y, method = "Mahalanobis")
```
![plot of chunk persp](figure/persp.png) 


## Functional depths:

There are two functional depths implemented - modified band depth (MBD), and Frainman-Muniz depth (FM):

```r
x <- matrix(rnorm(60), nc = 20)
fncDepth(x, method = "MBD")
fncDepth(x, method = "FM", dep1d = "Mahalanobis")
```

### Functional BoxPlot

```r
x <- matrix(rnorm(200), ncol = 10)
fncBoxPlot(x, bands = c(0, 0.5, 1), method = "FM")
```
![plot of chunk contour](figure/fncBoxPlot.png) 




