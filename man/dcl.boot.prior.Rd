\name{dcl.boot.prior}
\alias{dcl.boot.prior}
\title{Bootstrap distribution (the full cashflow) adding prior knowledge}
\description{Provide the distribution of the IBNR, RBNS and total (RBNS+IBRN) reserves by calendar years and rows using  
bootstrapping.}
\usage{
dcl.boot.prior( Xtriangle , Ntriangle , sigma2 , mu , inflat.i , inflat.j , Qi , 
    Model = 2 , adj = 1 , boot.type = 2, B = 999 ,  
    Tail = TRUE , summ.by = "diag", Tables = TRUE, num.dec = 2 , n.cal = NA ,
    Fj.X = NA , Fj.N = NA )
}
\arguments{
  \item{Xtriangle }{
  The paid run-off triangle: incremental aggregated payments. It should be a matrix with incremental aggregated  payments located in the upper triangle and the lower triangle  consisting in missing or zero values.}
  \item{Ntriangle }{
  The counts data triangle: incremental number of reported claims. It should be a matrix with the observed counts located in the upper triangle and the lower triangle  consisting in missing or zero values. It should has the same dimension as \code{Xtriangle} (both in the same aggregation level (quarters, years,etc.))}
 \item{sigma2 }{Optional. The variance of the individual payments in the first underwriting period.
}
  \item{mu }{Optional. The mean of the individual payments in the first underwriting period.
}
  \item{inflat.i }{Optional. A vector with dimension m (the dimension of the input triangles) specifying the severity inflation in the underwriting direction. % If not specified it will be estimated using \code{\link{dcl.estimation}}.
}  
  \item{inflat.j }{Optional. A vector with dimension m specifying the severity inflation in the development direction. If not specified it will be assumed to be 1 and then the severity mean not depending on the development period.
}
   \item{Qi }{Optional. A vector with dimension m specifying the probability of zero-claims for each underwriting period. If not specified then it will be assumed no zero-payments.
} 
   \item{Model }{Possible values are 0, 1 or 2 (default).  See \code{\link{dcl.estimation}} for more in details.
}
  \item{adj }{Method to adjust the estimated delay parameters for the distributional model. It should be 1 (default value) or 2. See \code{\link{dcl.estimation}} for more details.} 
   \item{boot.type }{Choose between values 1, to provide only the variance process, or 2 (default), to take into account the uncertainty of the parameters.}
 \item{B }{The number of simulations in the bootstrap algorithm. The defaul value is 999.
}
  \item{Tail }{Logical. If \code{TRUE} (default) the tail is provided.
}
  \item{summ.by }{A character value such as \code{"diag"}, \code{"row"} or \code{"cell"}. 
}
  \item{Tables }{Logical. If \code{TRUE} (default) it is showed a table with the summary (mean, standard deviation, 1\%, 5\%, 50\%, 95\%, 99\%) of the distribution of the outstanding liabilities in the future calendar periods (if \code{summ.by="diag"}) or by underwriting period (if \code{summ.by="row"}). 
} 
  \item{num.dec }{Number of decimal places used to report numbers in the tables. Used only if \code{Tables=TRUE}
  }
    \item{n.cal}{Integer specifying the number of most recent calendars which will be used to calculate the development factors. By default \code{n.cal=NA} and all the observed calendars    are used (classical chain ladder). }
  \item{Fj.X}{Optional vector with lentgth m-1 (m being the dimension of the triangles) with the development factors to calculate the chain ladder estimates from \code{Xtriangle}. See more details in \code{\link{clm}}.} 
  \item{Fj.N}{Optional vector with lentgth m-1 with the development factors to calculate the chain ladder estimates from \code{Ntriangle}. } 
}
\details{ If proper values are provided for the arguments \code{sigma2}, \code{mu}, \code{inflat.i}, \code{inflat.j} and \code{Qi} then, they will be considered fixed as prior knowledge. Otherwise, if not specified, \code{inflat.j} will be assumed to be a vector of ones, \code{Qi} a vector of zeros, and the rest will be estimated using \code{\link{dcl.estimation}}.
}
\value{
  \item{array.rbns.boot }{An array with dimensions (m,2m-1,B) (m being the dimension of the input triangles in DCL). Each \code{array.rbns.boot[,,b]} is a matrix, with m rows and 2m-1 columns, having the bootstrapped outstanding RBNS numbers as the entries (for b=1,...,B).}
  \item{Mat.rbns }{A matrix with B rows and 2m columns. Each \code{Mat.rbns[b,]} is a vector with elements being the outstanding liabilities for RBNS claims in the future calendar periods (sums by diagonals), and last value is the RBNS reserve (overall sum).}
  \item{array.ibnr.boot }{An array with dimensions (m,2m-1,B) (m being the dimension of the input triangles in DCL). Each \code{array.ibnr.boot[,,b]} is a matrix, with m rows and 2m-1 columns, having the bootstrapped outstanding IBNR numbers as the entries (for b=1,...,B).}
  \item{Mat.ibnr }{A matrix with B rows and 2m columns. Each \code{Mat.ibnr[b,]} is a vector with elements being the outstanding liabilities for IBNR claims in the future calendar periods (sums by diagonals), and last value is the RBNS reserve (overall sum).}
   \item{Mat.total }{A matrix with B rows and 2m columns. Each \code{Mat.total[b,]} is a vector with elements being the outstanding liabilities for total(=RBNS+IBNR) claims in the future calendar periods (sums by diagonals), and last value is the RBNS reserve (overall sum).}
   \item{summ.rbns }{A dataframe with the summary of the RBNS distribution. Only if \code{Tables=TRUE}.}
   \item{summ.ibnr }{A dataframe with the summary of the IBNR distribution. Only if \code{Tables=TRUE}.}
   \item{summ.total }{A dataframe with the summary of the total(=RBNS+IBNR) distribution. Only if \code{Tables=TRUE}.}
}
\references{
Martinez-Miranda, M.D., Nielsen, J.P., Verrall, R. and Wuthrich, M.V. (2013) Double Chain Ladder, Claims Development Inflation and Zero Claims. \emph{Scandinavian Actuarial Journal}. In press.
}
\author{
M.D. Martinez-Miranda, J.P. Nielsen and R. Verrall
}
\note{
If \code{boot.type=2} the function will take some time to perform the calculations. It increases with the dimension of the triangles and the specified number of simulations \code{B}.
}


\seealso{
\code{\link{Plot.cashflow}}, \code{\link{dcl.boot}}
}
\examples{
## Data application by in Martinez-Miranda, Nielsen, Verrall and Wuthrich (2013)
data(NtrianglePrior)
data(NpaidPrior)
data(XtrianglePrior)

## Extract information about zero-claims and severity dev. inflation
my.priors<-extract.prior(XtrianglePrior,NpaidPrior,NtrianglePrior,Plots=FALSE)
my.inflat.j<-my.priors$inflat.j
my.Qi<-my.priors$Qi

## Bootstrap cashflow incorporating prior knowledge about
##      severity inflation and zero claims
# Only variance process
# Below only B=200 simulations for a fast example
dist.priorC.I<-dcl.boot.prior(NtrianglePrior,XtrianglePrior,
  inflat.j=my.inflat.j,Qi=my.Qi,adj=2,Tail=FALSE,boot.type=1,B=200)
Plot.cashflow(dist.priorC.I)

## Try to compare with DCL with no prior knowledge: 
# Only variance process
# dist.dcl.I<-dcl.boot.prior(NtrianglePrior,XtrianglePrior,adj=2,
#    Tail=FALSE,boot.type=1)
# Plot.cashflow(dist.dcl.I)
}
\keyword{htest}
