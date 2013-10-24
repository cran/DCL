\name{dcl.estimation}
\alias{dcl.estimation}
\title{Parameter estimation - Double Chain Ladder model}
\description{Compute the estimated parameters in the model (delay parameters, severity underwriting inflation, severity mean and variance) using the Double Chain Ladder method. 
}
\usage{
dcl.estimation( Xtriangle , Ntriangle , adj = 1 , Tables = TRUE , 
   num.dec = 4 , n.cal = NA , Fj.X=NA , Fj.N=NA )
}

\arguments{
  \item{Xtriangle }{
  The paid run-off triangle: incremental aggregated payments. It should be a matrix with incremental aggregated  payments located in the upper triangle and the lower triangle  consisting in missing or zero values.}
 \item{Ntriangle }{
  The counts data triangle: incremental number of reported claims. It should be a matrix with the observed counts located in the upper triangle and the lower triangle  consisting in missing or zero values. It should has the same dimension as \code{Xtriangle} (both in the same aggregation level (quarters, years,etc.))}
  \item{adj }{Method to adjust the estimated delay parameters for the distributional model. It should be 1 (default value) or 2. See more in details below.} 
  \item{Tables }{Logical. If \code{TRUE} (default) it is showed a table with the estimated parameters.}
  \item{num.dec }{Number of decimal places used to report numbers in the tables (if \code{Tables=TRUE}).}
    \item{n.cal}{Integer specifying the number of most recent calendars which will be used to calculate the development factors. By default \code{n.cal=NA} and all the observed calendars    are used (classical chain ladder). }
  \item{Fj.X}{Optional vector with lentgth m-1 (m being the dimension of the triangles) with the development factors to calculate the chain ladder estimates from \code{Xtriangle}. See more details in \code{\link{clm}}.} 
  \item{Fj.N}{Optional vector with lentgth m-1 with the development factors to calculate the chain ladder estimates from \code{Ntriangle}. }  
}
\details{
Two models are estimated in the double chain ladder framework (Martinez-Miranda, Nielsen and Verrall 2012). 

The basic DCL model only makes assumption on the first moments  (see assumptions M1-M3 in Section 2 of the paper). From the two input triangles (\code{Ntriangle},\code{Xtriangle}) the parameters involved in this model are estimated: \code{pi.delay} (delay parameters  that could be negative values and/or sum up above 1, by solving the linear system (7) in Section 3), \code{mu} (mean of the individual payments in the first underwriting period,  from expression (9)), \code{inflat} (the underwriting severity mean inflation, from expression (8)), \code{alpha.N} and \code{beta.N} (the chain ladder parameters in the (OD)Poisson model for \code{Ntriangle} from expressions (10)-(12)). Using the estimated parameters in this simpler model the predicted outstanding numbers (calculated from equations (14) and (15)) are exactly the classical chain ladder predictions (see Theorem 1 in pp. 67). 

The second model is a distributional model (assumptions D1-D4 in Section 5) which allows to provide the full cash-flow. In this model the parameters are adjusted to match with the assumptions: \code{pj} are delay probabilities resulting from adjusting the general parameters \code{pi.delay} (defined in expressions (21)-(22)), \code{mu.adj} is the corresponding adjusted mean factor and \code{sigma2} is the variance factor (in expression (24)). The function \code{dcl.estimation} suggest two different adjustments of the general \code{pi.delay}, the user should choose the adjustment which does not modify substantially the IBNR/RBNS split in the basic model (M1-M3), see Martinez-Miranda, Nielsen, Verrall and W|thrich (2013) for a discussion.
}
\value{
\item{pi.delay}{General delay parameters}
\item{mu}{Mean severity factor}
\item{inflat}{Underwriting severity inflation}
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


}

\references{
Martinez-Miranda, M.D., Nielsen, J.P. and Verrall, R. (2012) Double Chain Ladder. \emph{Astin Bulletin}, 42/1, 59-76.

Martinez-Miranda, M.D., Nielsen, J.P., Verrall, R. and W|thrich, M.V. (2013) Double Chain Ladder, Claims Development Inflation and Zero Claims. \emph{Scandinavian Actuarial Journal}.

}
\author{
M.D. Martinez-Miranda, J.P. Nielsen and R. Verrall
}

\seealso{
\code{\link{Plot.dcl.par}}, \code{\link{dcl.predict}},
\code{\link{bdcl.estimation}}, \code{\link{idcl.estimation}},  \code{\link{clm}}
}
\examples{
data(NtriangleDCL)
data(XtriangleDCL)
# Estimation of the DCL parameters described in Martinez-Miranda, Nielsen and Verrall (2012)
est1<-dcl.estimation(XtriangleDCL,NtriangleDCL)
Plot.dcl.par(est1)
# Compare two possible adjustmets to get distributional parameters
# est1 with adj=1
pj.1<-est1$pj
pi.delay<-est1$pi.delay
est2<-dcl.estimation(XtriangleDCL,NtriangleDCL,adj=2,Tables=FALSE)
pj.2<-est2$pj
data.frame(pi.delay=pi.delay,pj.adj.1=pj.1,pj.adj.2=pj.2)
}
\keyword{models}
