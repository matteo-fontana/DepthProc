% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/fncFunctions.R
\name{fncGetBand}
\alias{fncGetBand}
\title{Functional bands}
\usage{
fncGetBand(obj, band = 0.5)
}
\arguments{
\item{obj}{object that inherits from FunctionalDepth.}

\item{band}{single numeric value.}
}
\description{
Extract bands from functional depth object.
}
\examples{

x <- matrix(rnorm(600), nc = 20)
obj <- fncDepth(x, method = "FM", dep1d = "Mahalanobis")
fncGetBand(obj)

}
