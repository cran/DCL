\name{Plot.clm.par}
\alias{Plot.clm.par}
\title{Plotting the estimated chain ladder parameters
}
\description{Show a plot with the estimates of the chain ladder parameters and the development factors 
}
\usage{
Plot.clm.par( clm.par )
}
\arguments{
  \item{clm.par }{A list object with the estimated chain ladder parameters: the value returned by the functions \code{clm}.
}
}
\value{ No returned value
}

\references{
Martinez-Miranda, M.D., Nielsen, J.P. and Verrall, R. (2012) Double Chain Ladder. \emph{Astin Bulletin}, 42/1, 59-76.

}
\author{
M.D. Martinez-Miranda, J.P. Nielsen and R. Verrall
}

\seealso{
\code{\link{clm}}, \code{\link{dcl.estimation}}, \code{\link{Plot.triangle}}
}

\examples{
data(NtriangleDCL)
my.clm.par<-clm(NtriangleDCL)

Plot.clm.par(my.clm.par)
}
\keyword{Graphics}
