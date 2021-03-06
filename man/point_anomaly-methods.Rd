% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/capa.R
\docType{methods}
\name{point_anomalies}
\alias{point_anomalies}
\alias{point_anomalies,capa.class-method}
\alias{point_anomalies,capa.uv.class-method}
\alias{point_anomalies,capa.mv.class-method}
\title{Point anomaly location and strength.}
\usage{
\S4method{point_anomalies}{capa.class}(object)

\S4method{point_anomalies}{capa.uv.class}(object)

\S4method{point_anomalies}{capa.mv.class}(object)
}
\arguments{
\item{object}{An S4 class produced by \code{\link{capa}}, \code{\link{capa.uv}}, and \code{\link{capa.mv}}.}
}
\value{
A data frame.
}
\description{
Creates a data frame containing point anomaly locations and strengths as detected by \code{\link{capa}}, \code{\link{capa.uv}}, and \code{\link{capa.mv}}.


For an object produced by \code{\link{capa.uv}}, the output is a data frame  with columns containing the position and
strength of the anomaly. 

For an object produced by \code{\link{capa.mv}}, \code{point_anomalies} returns a data frame with columns containing the position, variate, and
strength of the anomaly. 


For an object produced by \code{\link{capa}}, \code{point_anomalies} returns the same results as \code{\link{capa.uv}} when the data is univariate, and the same results as
\code{\link{capa.uv}} when the data is multivariate.
}
\seealso{
\code{\link{capa}}, \code{\link{capa.uv}}, \code{\link{capa.mv}}.
}
