\name{idcl.estimation}
\alias{idcl.estimation}
\title{Parameter estimation - DCL model reproducing the incurred reserve.}
\description{Estimate the parameters in the Double Chain Ladder model model: delay parameters, severity mean and variance. The inflation parameter is corrected using the incurred data to provide the incurred cashflow.
}
\usage{
idcl.estimation( Xtriangle , Ntriangle , Itriangle , adj = 1 , 
    Tables = TRUE , num.dec = 4 , n.cal = NA , 
    Fj.X = NA , Fj.N = NA , Fj.I = NA)
}

\arguments{
  \item{Xtriangle}{
  The paid run-off triangle: incremental aggregated payments. It should be a matrix with incremental aggregated  payments located in the upper triangle and the lower triangle  consisting in missing or zero values.}
 \item{Ntriangle}{
  The counts data triangle: incremental number of reported claims. It should be a matrix with the observed counts located in the upper triangle and the lower triangle  consisting in missing or zero values. It should has the same dimension as \code{Xtriangle} (both in the same aggregation level (quarters, years,etc.))}
  \item{Itriangle}{
  The incurred triangle. It should be a matrix with incurred data located in the upper triangle. It is an incremental run-off triangle with the same dimension as \code{Xtriangle} (both in the same aggregation level (quarters, years,etc.)) }
   \item{adj}{Method to adjust the estimated delay parameters for the distributional model. It should be 1 (default value) or 2. See more in details below.} 
  \item{Tables}{Logical. If TRUE (default) it is showed a table with the estimated parameters.}
  \item{num.dec }{Number of decimal places used to report numbers in the tables (if Tables=TRUE).} 
    \item{n.cal}{Integer specifying the number of most recent calendars which will be used to calculate the development factors. By default \code{n.cal=NA} and all the observed calendars    are used (classical chain ladder). }
  \item{Fj.X}{Optional vector with lentgth m-1 (m being the dimension of the triangles) with the development factors to calculate the chain ladder estimates from \code{Xtriangle}. See more details in \code{\link{clm}}.} 
  \item{Fj.N}{Optional vector with lentgth m-1 with the development factors to calculate the chain ladder estimates from \code{Ntriangle}. } 
  \item{Fj.I}{Optional vector with lentgth m-1 with the development factors to calculate the chain ladder estimates from \code{Itriangle}. } 
}
\details{
Two model are estimated in the double chain ladder framework as with the \code{dcl.estimation} function. In this case the DCL inflation parameter estimated by \code{dcl.estimation} from \code{Ntriangle} and \code{Xtriangle} is adjusted so that the derived predicted reserve is equal to the incurred reserve. Use this estimation method if you want the RBNS/IBNR  split the incurred reserve and the incurred full cashflow.
}
\value{
\item{pi.delay}{General delay parameters}
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
\item{CL.I.i }{Outstanding incurred numbers (row sums of the lower predicted triangle) from classical chain ladder on the incurred triangle.}

}

\references{
Martinez-Miranda, M.D., Nielsen, J.P. and Verrall, R. (2012) Double Chain Ladder. \emph{Astin Bulletin}, 42/1, 59-76.
Martinez-Miranda, M.D., Nielsen, J.P. and Verrall, R. (2013) Double Chain Ladder and Bornhuetter-Ferguson. \emph{North Americal Actuarial Journal}, 17(2), 101-113.
}
\author{
M.D. Martinez-Miranda, J.P. Nielsen and R. Verrall
}


\seealso{
\code{\link{Plot.dcl.par}}, \code{\link{dcl.predict}},
\code{\link{dcl.estimation}}, \code{\link{bdcl.estimation}}
}
\examples{
data(NtriangleBDCL)
data(XtriangleBDCL)
data(ItriangleBDCL)

my.idcl.par<-idcl.estimation(XtriangleBDCL,NtriangleBDCL,ItriangleBDCL)
# Parameters 
Plot.dcl.par(my.idcl.par,type.inflat='IDCL')
# IDCL Predictions by diagonals (future calendar years)
preds.idcl.diag<-dcl.predict(my.idcl.par,NtriangleBDCL,num.dec=0)

# Comparing with the BDCL method  
my.bdcl.par<-bdcl.estimation(XtriangleBDCL,NtriangleBDCL,ItriangleBDCL)
# Parameters shown in Table 1
Plot.dcl.par(my.bdcl.par,type.inflat='BDCL')
# BDCL Predictions by diagonals (future calendar years)
preds.bdcl.diag<-dcl.predict(my.bdcl.par,NtriangleBDCL,num.dec=0)

}
\keyword{models}
