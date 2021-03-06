% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/runifsphere.R
\name{runifsphere}
\alias{runifsphere}
\title{Random number generation from unit sphere.}
\usage{
runifsphere(n, p = 2)
}
\arguments{
\item{n}{number of random samples.}

\item{p}{dimension of the unit sphere.}
}
\description{
This function generates random numbers from p-dimensional unit sphere.
}
\examples{

x <- runifsphere(n = 100)
plot(x)

}
\author{
Daniel Kosiorowski, Mateusz Bocian, Anna Wegrzynkiewicz and Zygmunt Zawadzki from Cracow University of Economics.
}
