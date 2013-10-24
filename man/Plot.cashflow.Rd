\name{Plot.cashflow}
\alias{Plot.cashflow}
\title{Plotting the full cashflow (bootstrap distribution)
}
\description{Provide histograms and boxplots of the RBNS, IBNR and total(=RBNS+IBNR) cashflows. The boxplots corresponds to the distribution of the outstanding liabities in the future calendar periods. The histograms show the distribution of the reserve (overall total).
}
\usage{
Plot.cashflow( cashflow )
}
\arguments{
  \item{cashflow }{A list object returned by the function \code{\link{dcl.boot}} or \code{\link{dcl.boot.prior}}.
}
}

\details{
The cashflow should be derived by specifying the parameter \code{summ.by="diag"} in the function \code{\link{dcl.boot}} or \code{\link{dcl.boot.prior}}.
}
\value{ No returned value.}
\references{
Martinez-Miranda, M.D., Nielsen, J.P. and Verrall, R. (2012) Double Chain Ladder. \emph{Astin Bulletin}, 42/1, 59-76.

Martinez-Miranda, M.D., Nielsen, J.P. and Verrall, R. (2013) Double Chain Ladder and Bornhuetter-Ferguson. \emph{North Americal Actuarial Journal}, 17(2), 101-113.

Martinez-Miranda, M.D., Nielsen, J.P., Verrall, R. and Wuthrich, M.V. (2013) Double Chain Ladder, Claims Development Inflation and Zero Claims. \emph{Scandinavian Actuarial Journal}. In press.
}
\author{
M.D. Martinez-Miranda, J.P. Nielsen and R. Verrall
}

\seealso{
\code{\link{dcl.boot}}, \code{\link{dcl.boot.prior}}, \code{\link{dcl.estimation}}
}
\examples{
# Results described in the data application by Martinez-Miranda, Nielsen and Verrall (2012)
data(NtriangleDCL)
data(XtriangleDCL)

# Estimation of the DCL parameters
est<-dcl.estimation(XtriangleDCL,NtriangleDCL)
# Full cashflow considering the tail (only variance process)
# Below only B=200 simulations for a fast example
boot1<-dcl.boot(dcl.par=est,Ntriangle=NtriangleDCL,boot.type=1,B=200)
Plot.cashflow(boot1)
}
\keyword{Graphics}
