\name{clm}
\alias{clm}
\title{Classical Chain Ladder Method}
\description{Provide the classical chain ladder output consisting of the development (forward) factors and the predictions in the full square. Besides it provides the estimated parameters under the (over-dispersion) Poisson model for the double chain ladder estimation.
}
\usage{
clm( triangle , n.cal = NA , Fj = NA )
}

\arguments{
  \item{triangle}{
  The loss triangle. It should be a matrix with the observed counts (number of reported claims, number of payments etc.), aggregated payments or incurred data, located in the upper triangle. The lower triangle should consist of missing (NA) or zero values.}
  \item{n.cal}{Integer specifying the number of most recent calendars which will be used to calculate the development factors. By default \code{n.cal=NA} and all the observed calendars    are used (classical chain ladder). }
  \item{Fj}{Optional. A vector with lentgth m-1 (m being the dimension of the triangle) with the development factors to calculate the chain ladder estimates. See more details below. }
}

\details{
By default \code{Fj=NA} and then classical chain ladder with the common calculation of the development factors (or using the most recent calendars -if 0<\code{n.cal}<m is provided), is performed. By specifying a valid vector with the development factors (it should has lenght equal to m-1), the user is allowed to use his own values in the algorithm. If valid values are specified for both \code{n.cal} and \code{Fj}, the first one (\code{n.cal}) will be ignored and the given development factors will be used in the calculations.
}
\value{
\item{triangle.hat }{A matrix with dimension m having the chain ladder predictions in the future (lower triangle) and the fitted values in the past (upper triangle).}
\item{alpha }{Underwriting chain ladder parameter in the (OD)-Poisson model (see for example Verrall (1991) for a formal definition)}
\item{beta }{Underwriting chain ladder parameter in the (OD)-Poisson model (Verrall 1991)}
\item{Fj }{Development (forward) factors}
}

\references{
Martinez-Miranda, M.D., Nielsen, J.P. and Verrall, R. (2012) Double Chain Ladder. \emph{Astin Bulletin}, 42/1, 59-76.

Verrall, R. (1991) Chain ladder and Maximum Likelihood. \emph{Journal of the Institute of Actuaries} 118, 489-499.
}
\author{
M.D. Martinez-Miranda, J.P. Nielsen and R. Verrall
}
\seealso{ 
\code{\link{get.incremental}}, \code{\link{Plot.clm.par}}, \code{\link{Plot.triangle}}
}
\examples{
data(NtriangleDCL)
clm.N<-clm(NtriangleDCL)
# The alpha's
clm.N$alpha
# The beta's
clm.N$beta
# The development factors
clm.N$Fj
# Plotting the parameters and the dev. factors
Plot.clm.par(clm.N)
# The predictions
Nhat<-clm.N$triangle.hat
Plot.triangle(Nhat,Histogram=TRUE)

## Trying variations from classical chain ladder
# Try CLM only using the more recent 2 calendars in the development
# factors calculation
clm(NtriangleDCL,n.cal=2)

# Try CLM providing a vector with given development factors
my.Fj<-c(1.4,1.1,1.0,1.1,1.1,1.0,1.0,1.0,1.1)
clm(NtriangleDCL,Fj=my.Fj)

}
\keyword{models}
