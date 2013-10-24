\name{dcl.predict}
\alias{dcl.predict}
\title{
Pointwise predictions (RBNS/IBNR split)}
\description{
Pointwise predictions by calendar years and rows of the outstanding liabilities. The predictions are splitted between RBNS and IBNR claims.}
\usage{
dcl.predict( dcl.par , Ntriangle , Model = 2 , Tail = TRUE , 
  Tables = TRUE , summ.by="diag", num.dec = 2 )                     
}                      
\arguments{
  \item{dcl.par }{A list object with the estimated parameters: the value returned by the functions \code{dcl.estimation}, \code{bdcl.estimation} or \code{idcl.estimation}.
}
  \item{Ntriangle}{
  Optional. The counts data triangle: incremental number of reported claims. It should be a matrix with the observed counts located in the upper triangle and the lower triangle  consisting in missing or zero values. It should has the same dimension as the \code{Xtriangle} (both in the same aggregation level (quarters, years,etc.)) used to derive \code{dcl.par}}
  
  \item{Model }{Possible values are 0, 1 or 2 (default). See more details below.
}
  \item{Tail }{Logical. If \code{TRUE} (default) the tail is provided.
}
  \item{Tables }{Logical. If \code{TRUE} (default) it is shown a table with the predicted outstanding liabilities in the future calendar periods (\code{summ.by="diag"}) or by underwriting period (\code{summ.by="row"}). 
}  
  \item{summ.by }{A character value such as \code{"diag"}, \code{"row"} or \code{"cell"}. 
%%     ~~Describe \code{\dots} here~~
}
  \item{num.dec }{Number of decimal places used to report numbers in the tables. Used only if \code{Tables=TRUE}
  } 
}
\details{
If \code{Model=0} or \code{Model=1} then the predictions are calculated using the DCL model parameters in assumptions M1-M3 (general delay parameters, see Martinez-Miranda, Nielsen and Verrall 2012). If \code{Model=2} the adjusted delay probabilities (distributional model D1-D4) are considered. By choosing \code{Model=0} the predictions are calculated ignoring the observed counts in \code{Ntriangle} (also if the \code{Ntriangle} is not specified). It should be specified to reproduce get the IBNR/RBNS split of classical paid chain ladder. 

Choose \code{summ.by="diag"} to calculate the predicted outstanding liabilities in the future calendar periods (diagonal sums), \code{summ.by="row"} for sums by underwriting periods (row sums);  or \code{summ.by="cell"} to get only the the individual cell predictions.  
}
\value{
  \item{Xrbns }{A matrix with dimension m by 2m-1 (m being the dimension of the input triangles in DCL) having the outstanding RBNS numbers as the entries.}
  \item{Drbns }{A vector with dimension 2m-1 with elements being the outstanding liabilities for RBNS claims in the future calendar periods (sums by diagonals). The last value is the RBNS reserve (overall sum).}
  \item{Rrbns }{A vector with dimension m with elements being the outstanding liabilities for RBNS claims at each underwriting period (sums by rows). The last value is the RBNS reserve (overall sum).}
  \item{Xibnr }{A matrix with dimension m by 2m-1 (m being the dimension of the input triangles in DCL) having the outstanding IBNR numbers as the entries.}
  \item{Dibnr }{A vector with dimension 2m-1 with elements being the outstanding liabilities for IBNR claims in the future calendar periods (sums by diagonals). The last value is the IBNR reserve (overall sum).}
  \item{Ribnr }{A vector with dimension m with elements being the outstanding liabilities for IBNR claims at each underwriting period (sums by rows). The last value is the RBNS reserve (overall sum).}
  \item{Xtotal }{A matrix with dimension m by 2m-1 (m being the dimension of the input triangles in DCL) having the outstanding total (=RBNS+IBNR) numbers as the entries.}
  \item{Dtotal }{A vector with dimension 2m-1 with elements being the outstanding liabilities for  all  claims in the future calendar periods (sums by diagonals). The last value is the  total (=RBNS+IBNR) reserve (overall sum).}
  \item{Rtotal }{A vector with dimension m with elements being the outstanding liabilities for all claims at each underwriting period (sums by rows). The last value is the total (=RBNS+IBNR)  reserve (overall sum).}  
}
\references{
Martinez-Miranda, M.D., Nielsen, J.P. and Verrall, R. (2012) Double Chain Ladder. \emph{Astin Bulletin}, 42/1, 59-76.

Martinez-Miranda, M.D., Nielsen, J.P., Verrall, R. and W|thrich, M.V. (2013) Double Chain Ladder, Claims Development Inflation and Zero Claims. \emph{Scandinavian Actuarial Journal}.
}
\author{
M.D. Martinez-Miranda, J.P. Nielsen and R. Verrall
}


\seealso{
\code{\link{dcl.estimation}}, \code{\link{bdcl.estimation}}, \code{\link{idcl.estimation}}, \code{\link{dcl.predict.prior}}
}
\examples{
## Data application by in Martinez-Miranda, Nielsen and Verrall (2012)

data(NtriangleDCL)
data(XtriangleDCL)

# Estimation of the DCL parameters described 
est<-dcl.estimation(XtriangleDCL,NtriangleDCL)

# with general delay parameters and ignoring Ntriangle to reproduce exactly chain ladder
pred1<-dcl.predict(dcl.par=est,Model=1,Tail=FALSE)

# with Modeled parameters (distributional Model) and ignoring Ntriangle
pred2<-dcl.predict(dcl.par=est,Model=2,Tail=FALSE)

# with Modeled parameters (distributional Model) using observed Ntriangle
pred3<-dcl.predict(dcl.par=est,Ntriangle=NtriangleDCL,Model=2,Tail=FALSE)

# providing the Tail, with Modeled parameters (distributional Model)
pred4<-dcl.predict(dcl.par=est,Ntriangle=NtriangleDCL,Model=2,Tail=TRUE)

}
\keyword{htest}
