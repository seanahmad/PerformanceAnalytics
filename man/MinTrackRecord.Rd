% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/MinTRL.R
\name{MinTrackRecord}
\alias{MinTrackRecord}
\title{Minimum Track Record Length}
\usage{
MinTrackRecord(R = NULL, Rf = 0, refSR, p = 0.95, weights = NULL,
  n = NULL, sr = NULL, sk = NULL, kr = NULL,
  ignore_skewness = FALSE, ignore_kurtosis = TRUE)
}
\arguments{
\item{R}{an xts, vector, matrix, data frame, timeSeries or zoo object of the returns input}

\item{Rf}{the risk free rate}

\item{refSR}{a single value or a vector when R is multicolumn. It defines the reference Sharpe Ratio and should be in the same periodicity as the returns (non-annualized).}

\item{p}{the confidence level}

\item{weights}{(if R is multicolumn and the underlying assets form a portfolio) the portfolio weights}

\item{n}{(if R is NULL) the track record length of the returns}

\item{sr}{(if R is NULL) the sharpe ratio of the returns}

\item{sk}{(if R is NULL) the skewness of the returns}

\item{kr}{(if R is NULL) the kurtosis of the returns}

\item{ignore_skewness}{If TRUE, it ignores the effects of skewness in the calculations}

\item{ignore_kurtosis}{If TRUE, it ignores the effects of kurtosis in the calculations}
}
\value{
A list containing the below
\itemize{  \item min_TRL:           the minimum track record length value (periodicity follows R)
 \item IS_SR_SIGNIFICANT:           TRUE if the sharpe ratio is statistically significant, FALSE otherwise 
 \item num_of_extra_obs_needed:     If the sharpe ratio is not statistically significant, how many more observations are needed so as to achieve this}
}
\description{
The Minimum Track Record Length responds to the following question: "How long should a track record be in 
order to have a p-level statistical confidence that its Sharpe ratio is above a given threshold?".
Obviously, the main assumption is the returns will continue displaying the same statistical properties out-of-sample.
For example, if the input contains fifty observations and the Minimum Track Record is forty, then for the next ten observations the relevant measures (sharpe ratio,
skewness and kyrtosis) need to remain the same as the input so to achieve statistical significance after exactly ten time points.
}
\examples{

data(edhec)
MinTrackRecord(edhec[,1],refSR = 0.23) 
MinTrackRecord(refSR = 1/12^0.5,Rf = 0,p=0.95,sr = 2/12^0.5,sk=-0.72,kr=5.78,n=59)

### Higher moments are data intensive, kurtosis shouldn't be used for short timeseries
MinTrackRecord(edhec[,1:2],refSR = c(0.28,0.24), ignore_skewness = FALSE, ignore_kurtosis = FALSE)
MinTrackRecord(edhec[,1:2],refSR = c(0.28,0.24), ignore_skewness = FALSE, ignore_kurtosis = TRUE)
MinTrackRecord(edhec[,1:2],refSR = c(0.28,0.24), ignore_skewness = TRUE, ignore_kurtosis = TRUE)

MinTrackRecord(edhec[,1:2],refSR = 0.26,weights = c(0.5,0.5), ignore_skewness = FALSE, ignore_kurtosis = FALSE)

}
\references{
Bailey, David H. and Lopez de Prado, Marcos, The Sharpe Ratio Efficient Frontier (July 1, 2012).
Journal of Risk, Vol. 15, No. 2, Winter 2012/13
}
\seealso{
\code{\link{ProbSharpeRatio}}
}
\author{
Tasos Grivas <tasos@openriskcalculator.com>, Pulkit Mehrotra
}
