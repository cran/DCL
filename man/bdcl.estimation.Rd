\name{bdcl.estimation}
\alias{bdcl.estimation}
\title{Parameter estimation - DCL model using the BDCL method}
\description{Estimate the parameters in the Double Chain Ladder model (delay parameters, severity mean and variance) using the Double Chain Ladder method with a Bornhuetter-Ferguson adjustment. The Bornhuetter-Ferguson tecnhique is applied to stabilise the underwriting inflation parameters using incurred data
}
\usage{
bdcl.estimation( Xtriangle , Ntriangle , Itriangle , adj = 1 , 
   Tables=TRUE , num.dec=4 , n.cal=NA , Fj.X=NA , Fj.N=NA , Fj.I=NA) 
}
\arguments{
  \item{Xtriangle}{
  The paid run-off triangle: incremental aggregated payments. It should be a matrix with incremental aggregated  payments located in the upper triangle and the lower triangle  consisting in missing or zero values.}
 \item{Ntriangle}{
  The counts data triangle: incremental number of reported claims. It should be a matrix with the observed counts located in the upper triangle and the lower triangle  consisting in missing or zero values. It should has the same dimension as \code{Xtriangle} (both in the same aggregation level (quarters, years,etc.))}
  \item{Itriangle}{
  The incurred triangle. It should be a matrix with incurred data located in the upper triangle. It is an incremental run-off triangle with the same dimension as \code{Xtriangle}  (both in the same aggregation level (quarters, years,etc.)) }
   \item{adj}{Method to adjust the estimated delay parameters for the distributional model. It should be 1 (default value) or 2. See more in details below.} 
  \item{Tables}{Logical. If TRUE (default) it is showed a table with the estimated parameters.}
  \item{num.dec }{Number of decimal places used to report numbers in the tables (if Tables=TRUE).}
    \item{n.cal}{Integer specifying the number of most recent calendars which will be used to calculate the development factors. By default \code{n.cal=NA} and all the observed calendars    are used (classical chain ladder). }
  \item{Fj.X}{Optional vector with lentgth m-1 (m being the dimension of the triangles) with the development factors to calculate the chain ladder estimates from \code{Xtriangle}. See more details in \code{\link{clm}}.} 
  \item{Fj.N}{Optional vector with lentgth m-1 with the development factors to calculate the chain ladder estimates from \code{Ntriangle}. } 
  \item{Fj.I}{Optional vector with lentgth m-1 with the development factors to calculate the chain ladder estimates from \code{Itriangle}. } 
}
\details{
Two model are estimated in the double chain ladder framework as with the \code{dcl.estimation} function. In this case the inflation parameter (\code{inflat}) is estimated from the incurred triangle (see BF adjustment in the description of the BDCL method in Martinez-Miranda, Nielsen and Verrall 2013). The predicted reserve using these estimates 
  is different from the incurred reserve. If you want to
  reproduce exactly the incurred reserve (by splitting it into its RBNS and IBNR components) then use the function \code{idcl.estimation}.
}
\value{\item{pi.delay}{General delay parameters}
\item{mu}{Mean severity factor}
\item{inflat}{Underwriting severity inflation (BDCL inflation)}
\item{inflat.DCL}{Underwriting severity inflation  (DCL inflation)}
\item{pj}{Delay probabilities (under a Multinomial assumption)}
\item{mu.adj}{Adjusted mean factor corresponding to the \code{pj} parameters}
\item{sigma2}{Variance severity factor}
\item{phi}{Overdispersion parameter used to derive the estimate \code{sigma2}}
\item{Ey}{Severity mean for each underwriting period}
\item{Vy}{Severity variance for each underwriting period}
\item{adj}{Type of adjusted used to derive the \code{pj} probabilities}
\item{alpha.N }{Underwriting chain ladder parameter in the (OD)-Poisson model. Counts triangle (Ntriangle)}
\item{beta.N }{Underwriting chain ladder parameter in the (OD)-Poisson model. Counts triangle (Ntriangle)}
\item{Nhat }{The chain ladder preditions (counts triangle). It is a matrix having the chain ladder predictions in the future (lower triangle) and the fitted values in the past (upper triangle).}
\item{alpha.X }{Underwriting chain ladder parameter in the (OD)-Poisson model. Paid triangle (Xtriangle)}
\item{beta.X }{Underwriting chain ladder parameter in the (OD)-Poisson model. Paid triangle (Xtriangle)}
\item{Xhat }{The chain ladder preditions (paid triangle). It is a matrix having the chain ladder predictions in the future (lower triangle) and the fitted values in the past (upper triangle).}
\item{alpha.I }{Underwriting chain ladder parameter in the (OD)-Poisson model. Incurred triangle (Itriangle)}
\item{beta.I }{Underwriting chain ladder parameter in the (OD)-Poisson model. Incurred triangle (Itriangle)}

}

\references{
Martinez-Miranda, M.D., Nielsen, J.P. and Verrall, R. (2012) Double Chain Ladder. \emph{Astin Bulletin}, 42/1, 59-76.

Martinez-Miranda, M.D., Nielsen, J.P. and Verrall, R. (2013) Double Chain Ladder and Bornhuetter-Ferguson. \emph{North Americal Actuarial Journal}.

}
\author{
M.D. Martinez-Miranda, J.P. Nielsen and R. Verrall
}

\seealso{
\code{\link{get.incremental}}, \code{\link{Plot.dcl.par}}, \code{\link{dcl.predict}}, 
\code{\link{dcl.estimation}}, \code{\link{idcl.estimation}},  \code{\link{clm}}
}
\examples{
# Reproducing the data analysis in the paper by Martinez-Miranda, Nielsen and Verrall (2013) 
data(NtriangleBDCL)
data(XtriangleBDCL)
data(ItriangleBDCL)

my.bdcl.par<-bdcl.estimation(XtriangleBDCL,NtriangleBDCL,ItriangleBDCL)
# Parameters shown in Table 1
Plot.dcl.par(my.bdcl.par,type.inflat='BDCL')
# BDCL Predictions by diagonals (future calendar years)
preds.bdcl.diag<-dcl.predict(my.bdcl.par,NtriangleBDCL,num.dec=0)
}
\keyword{models}
