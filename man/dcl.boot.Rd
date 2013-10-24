\name{dcl.boot}
\alias{dcl.boot}
\title{Bootstrap distribution: the full cashflow}
\description{Provide the distribution of the IBNR, RBNS and total (RBNS+IBRN) reserves by calendar years and rows using  
bootstrapping.}
\usage{
dcl.boot( dcl.par , sigma2 , Ntriangle , boot.type = 2 , B = 999 , 
  Tail = TRUE , summ.by = "diag" , Tables = TRUE , num.dec = 2 , n.cal = NA)
}
\arguments{
  \item{dcl.par }{A list object with the estimated parameters: the value returned by the functions \code{\link{dcl.estimation}}, \code{\link{bdcl.estimation}} or \code{\link{idcl.estimation}}.
}
 \item{sigma2 }{Optional. The variance of the individual payments in the first underwriting period.
}
 \item{Ntriangle }{
  The counts data triangle: incremental number of reported claims. It should be a matrix with the observed counts located in the upper triangle and the lower triangle  consisting in missing or zero values. It should be the same triangle used to get the value passed by the argument  \code{dcl.par}.
}
  \item{boot.type }{Choose between values 1, to provide only the variance process, or 2 (default), to take into account the uncertainty of the parameters.
  }
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
}
\details{
If the calculated severity variance using the function \code{\link{dcl.estimation}} is not a valid estimate then it is recommended to provide directly this value through the argument \code{sigma2}. It can be calculated using the function \code{\link{var}} applied to a pilot sample of individual payments observed in the first underwriting period.
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
Martinez-Miranda, M.D., Nielsen, J.P. and Verrall, R. (2012) Double Chain Ladder. \emph{Astin Bulletin}, 42/1, 59-76.

Martinez-Miranda, M.D., Nielsen, J.P. and Verrall, R. (2013) Double Chain Ladder and Bornhuetter-Ferguson. \emph{North Americal Actuarial Journal}.
}
\author{
M.D. Martinez-Miranda, J.P. Nielsen and R. Verrall
}
\note{
If \code{boot.type=2} the function will take some time to perform the calculations. It increases with the dimension of the triangles and the specified number of simulations \code{B}.
}

\seealso{
\code{\link{Plot.cashflow}}, \code{\link{dcl.boot.prior}}
}
\examples{
# Results described in the data application by Martinez-Miranda, Nielsen and Verrall (2012)
data(NtriangleDCL)
data(XtriangleDCL)

# Estimation of the DCL parameters
est<-dcl.estimation(XtriangleDCL,NtriangleDCL)

# Full cashflow considering the tail (only the variance process)
# Below only B=200 simulations to be faster in the example
boot1<-dcl.boot(dcl.par=est,Ntriangle=NtriangleDCL,boot.type=1,B=200)
Plot.cashflow(boot1)

# Full cashflow with tail and taking into account the parameters uncertainty
# and B=999 simulations. Do not run it unless you can wait about one minute
# boot2<-dcl.boot(dcl.par=est,Ntriangle=NtriangleDCL,boot.type=2)
# Plot.cashflow(boot2)
}
\keyword{htest}
