\name{Plot.dcl.par}
\alias{Plot.dcl.par}
\title{Plotting the estimated parameters in the DCL model
}
\description{Show a two by two plot with the estimated parameters in the Double Chain Ladder model 
}
\usage{
Plot.dcl.par( dcl.par , type.inflat = 'DCL' )
}
\arguments{
  \item{dcl.par }{A list object with the estimated parameters: the value returned by the functions \code{dcl.estimation}, \code{bdcl.estimation} or \code{idcl.estimation}.
}
  \item{type.inflat }{Method used to estimate the inflation . Possible values are: 'DCL' (default) if it was used \code{dcl.estimation}, 'BDCL' if  \code{bdcl.estimation}, and
  'IDCL' if \code{idcl.estimation} }
}
\value{ No returned value
}
\references{
Martinez-Miranda, M.D., Nielsen, J.P. and Verrall, R. (2012) Double Chain Ladder. \emph{Astin Bulletin}, 42/1, 59-76.

Martinez-Miranda, M.D., Nielsen, J.P. and Verrall, R. (2013) Double Chain Ladder and Bornhuetter-Ferguson. \emph{North Americal Actuarial Journal}, 17(2), 101-113.
}
\author{
M.D. Martinez-Miranda, J.P. Nielsen and R. Verrall
}

\seealso{
\code{\link{dcl.estimation}}, \code{\link{bdcl.estimation}}, \code{\link{idcl.estimation}}
}
\examples{
data(NtriangleDCL)
data(XtriangleDCL)

# Estimation of the DCL parameters described in Martinez-Miranda, Nielsen and Verrall (2012)
my.dcl.par<-dcl.estimation(XtriangleDCL,NtriangleDCL)
Plot.dcl.par(my.dcl.par)
}
\keyword{Graphics}
