\name{DCL-package}
\alias{DCL-package}
\alias{DCL}
\docType{package}
\title{
Claims Reserving under the Double Chain Ladder Model
}
\description{This package provides functions for statistical modelling and forecasting in claims reserving in 
non-life insurance under the Double Chain Ladder framework by Martinez-Miranda, Nielsen and Verrall (2012).  
Using specific functions, the user will be able generate plots to visualize and gain intuition about the data (run-off triangles), 
break down classical chain ladder under the DCL model, visualize the underlying delay function and the inflation, 
introduce expert knowledge about the severity inflation, the zero-claims etc. Besides a validation exercise can be performed through a back-test on the data.  
}
\details{
\tabular{ll}{
Package: \tab DCL\cr
Type: \tab Package\cr
Version: \tab 0.1.0\cr
Date: \tab 2013-10-24\cr
License: \tab GPL-2
\cr
}
}
\author{
M.D. Martinez-Miranda, J.P. Nielsen and R. Verrall

Maintainer: Maria Dolores Martinez-Miranda <mmiranda@ugr.es>
}
\references{
Martinez-Miranda M.D., Nielsen B, Nielsen J.P and Verrall, R. (2011) Cash flow simulation for a model of outstanding liabilities based on claim amounts and claim numbers. \emph{Astin Bulletin}, 41/1, 107-129.

Martinez-Miranda, M.D., Nielsen, J.P. and Verrall, R. (2012) Double Chain Ladder. \emph{Astin Bulletin}, 42/1, 59-76.

Martinez-Miranda, M.D., Nielsen, J.P. and Verrall, R. (2013) Double Chain Ladder and Bornhuetter-Ferguson. \emph{North American Actuarial Journal}, 17(2), 101-113.

Martinez-Miranda, M.D., Nielsen, J.P., Verrall, R. and Wuthrich, M.V. (2013) Double Chain Ladder, Claims Development Inflation and Zero Claims. \emph{Scandinavian Actuarial Journal}. In press.

See more at http://www.cassknowledge.com/research/article/double-chain-ladder-cass-knowledge
}
\keyword{ package }

\examples{
data(NtriangleDCL)
data(XtriangleDCL)

# Classical chain ladder parameters
my.clm.par<-clm(XtriangleDCL)
Plot.clm.par(my.clm.par)

# Estimation of the DCL parameters (break-down of the chain ladder parameters)
my.dcl.par<-dcl.estimation(XtriangleDCL,NtriangleDCL)
Plot.dcl.par(my.dcl.par)

# DCL Predictions by diagonals (future calendar years)
# Splitting the chain ladder reserve into RBNR and IBNR claims (ignoring the tail)
preds.dcl.diag<-dcl.predict(my.dcl.par,Model=0,Tail=FALSE,num.dec=0)

# Full cashflow considering the tail (only the variance process)
# Below only B=200 simulations for faster calculations in the example
boot1<-dcl.boot(dcl.par=my.dcl.par,Ntriangle=NtriangleDCL,boot.type=1,B=200)
Plot.cashflow(boot1)

}
\keyword{package}
