% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/capa.R
\name{capa.mv}
\alias{capa.mv}
\title{Detection of multivariate anomalous segments and points using MVCAPA.}
\usage{
capa.mv(x, beta = NULL, beta_tilde = NULL, type = "meanvar",
  min_seg_len = 10, max_seg_len = Inf, max_lag = 0,
  transform = robustscale)
}
\arguments{
\item{x}{A numeric matrix with n rows and p columns containing the data which is to be inspected.}

\item{beta}{A numeric vector of length p, giving the marginal penalties. If type ="meanvar" or if type = "mean" and maxlag > 0 it defaults to the penalty regime 2' described in 
Fisch, Eckley and Fearnhead (2019). If type = "mean" and maxlag = 0 it defaults to the pointwise minimum of the penalty regimes 1, 2, and 3 in Fisch, Eckley and Fearnhead (2019).}

\item{beta_tilde}{A numeric constant indicating the penalty for adding an additional point anomaly. It defaults to a BIC style penalty if no argument is provided.}

\item{type}{A string indicating which type of deviations from the baseline are considered. Can be "meanvar" for collective anomalies characterised by joint changes in mean and
variance (the default) or "mean" for collective anomalies characterised by changes in mean only.}

\item{min_seg_len}{An integer indicating the minimum length of epidemic changes. It must be at least 2 and defaults to 10.}

\item{max_seg_len}{An integer indicating the maximum length of epidemic changes. It must be at least the min_seg_len and defaults to Inf.}

\item{max_lag}{A non-negative integer indicating the maximum start or end lag. Default value is 0.}

\item{transform}{A function used to transform the data prior to analysis by \code{\link{capa.mv}}. This can, for example, be used to compensate for the effects of autocorrelation in the data. Importantly, the
untransformed data remains available for post processing results obtained using \code{\link{capa.mv}}. The package includes several methods that are commonly used for
the transform, (see \code{\link{robustscale}} and \code{\link{ac_corrected}}), but a user defined function can be specified. The default value is \code{transform=robust_scale}.}
}
\value{
An S4 class of type capa.mv.class.
}
\description{
This function implements MVCAPA (Multi-Variate Collective And Point Anomaly) from Fisch et al. (2019). 
It detects potentially lagged collective anomalies as well as point anomalies in multivariate time series data.  
The runtime of MVCAPA scales linearly (up to logarithmic factors) in \code{ncol(x)} and \code{maxlag}. If \code{max_seg_len} is not set, the runtime scales quadratically at worst and linearly 
at best in \code{nrow(x)}. If \code{max_seg_len} is set the runtime scales like \code{nrow(x)*max_seg_len}.
}
\examples{
library(anomaly)
data(simulated)
res<-capa.mv(sim.data,type="mean",min_seg_len=2,max_lag=5)
collective_anomalies(res)

}
\references{
\insertRef{2019MVCAPA}{anomaly}
}
