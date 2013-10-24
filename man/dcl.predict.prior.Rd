\name{dcl.predict.prior}
\alias{dcl.predict.prior}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{Pointwise predictions (RBNS/IBNR split) adding prior knowledge}
\description{
Pointwise predictions by calendar years and rows of the outstanding liabilities. The predictions are splitted between RBNS and IBNR claims.
}
\usage{
dcl.predict.prior( Ntriangle , Xtriangle , inflat.i , inflat.j , Qi , 
  Model = 2, adj = 2, Tail = FALSE, Tables = TRUE, 
  summ.by = "diag", num.dec = 2 )
}
\arguments{
  \item{Ntriangle}{
  Optional. The counts data triangle: incremental number of reported claims. It should be a matrix with the observed counts located in the upper triangle and the lower triangle  consisting in missing or zero values. It should has the same dimension as the \code{Xtriangle} (both in the same aggregation level (quarters, years,etc.)) used to derive \code{dcl.par}
  }
  \item{Xtriangle}{
  The paid run-off triangle: incremental aggregated payments. It should be a matrix with incremental aggregated  payments located in the upper triangle and the lower triangle  consisting in missing or zero values.
  }
  \item{inflat.i }{Optional. A vector with dimension m (the dimension of the input triangles) specifying the severity inflation in the underwriting direction. If not specified it will be estimated using \code{\link{dcl.estimation}}.
}
  \item{inflat.j }{Optional. A vector with dimension m specifying the severity inflation in the development direction. If not specified it will be assumed to be 1 and then the severity mean not depending on the development period.
}
  \item{Qi }{Optional. A vector with dimension m specifying the probability of zero-claims for each underwriting period. If not specified then it will be assumed no zero-payments.
}
  \item{Model }{Possible values are 0, 1 or 2 (default).  See \code{\link{dcl.estimation}} for more in details.
}
  \item{adj }{Method to adjust the estimated delay parameters for the distributional model. It should be 1 (default value) or 2. See \code{\link{dcl.estimation}} for more in details.
} 
 
  \item{Tail }{Logical. If \code{TRUE} (default) the tail is provided.
}
  \item{Tables }{Logical. If \code{TRUE} (default) it is showed a table with the predicted outstanding liabilities in the future calendar periods (\code{summ.by="diag"}) or by underwriting period (\code{summ.by="row"}). 
}  
  \item{summ.by }{A character value such as \code{"diag"}, \code{"row"} or \code{"cell"}. 
}
  \item{num.dec }{Number of decimal places used to report numbers in the tables. Used only if \code{Tables=TRUE}
  } 
}
\details{
The predictions are calculated under the first moment assumptions in the DCL model (see M1-M3) in Martinez-Miranda, M.D., Nielsen, J.P. and Verrall, R. (2012). In this case the severity mean is specified as 

\code{ inflat.i * (1-Qi) * inflat.j * mu} 

where \code{inflat.i}, \code{Qi}, \code{inflat.j} and \code{mu} are prior information specified by the user. With this specification, the prediction formula consists of the expectation (conditional expectation -if \code{Ntriangle} is given and \code{Model=0}) of the future (RBNS/IBNR) aggregated payments. See formulas (8)-(9) in the paper.

If the prior information is not  provided the function will return the DCL predictions as \code{\link{dcl.predict}}. The information about \code{Qi}, \code{inflat.j} can be extracted through DCL using \code{\link{extract.prior}}.
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

Martinez-Miranda, M.D., Nielsen, J.P., Verrall, R. and Wuthrich, M.V. (2013) Double Chain Ladder, Claims Development Inflation and Zero Claims. \emph{Scandinavian Actuarial Journal}. In press.
}
\author{
M.D. Martinez-Miranda, J.P. Nielsen and R. Verrall
}

\seealso{
\code{\link{dcl.estimation}}, \code{\link{bdcl.estimation}}, \code{\link{idcl.estimation}}, \code{\link{dcl.predict}},\code{\link{extract.prior}}
}
\examples{
## Data application by in Martinez-Miranda, Nielsen, Verrall and Wuthrich (2013)
data(NtrianglePrior)
data(NpaidPrior)
data(XtrianglePrior)

Ntriangle<-NtrianglePrior
Xtriangle<-XtrianglePrior
Npaid<-NpaidPrior

## Extract information about zero-claims and severity dev. inflation
my.priors<-extract.prior(Xtriangle,Npaid,Ntriangle)
my.inflat.j<-my.priors$inflat.j
my.Qi<-my.priors$Qi

# Reproducing the poinwise predicions (tables 3,4,5) in the paper
# Note: in the paper we did not use Ntriangle in the predictions 
# when modelling the predictions are slightly different

## Prior A: only using development year inflation
m<-nrow(Ntriangle)
preds.prior.A.gen<-dcl.predict.prior(Ntriangle,Xtriangle,
          inflat.j=my.inflat.j,Qi=rep(0,m),Model=0,adj=1,
          Tail=FALSE,Tables=TRUE,summ.by="diag",num.dec=2)

preds.prior.A.mod<-dcl.predict.prior(Ntriangle,Xtriangle,
          inflat.j=my.inflat.j,Qi=rep(0,m),Model=2,adj=2,
          Tail=FALSE,Tables=TRUE,summ.by="diag",num.dec=2)

## Prior B: only using zero claims inflation
preds.prior.B.gen<-dcl.predict.prior(Ntriangle,Xtriangle,
          inflat.j=rep(1,m),Qi=my.Qi,Model=0,adj=1,
          Tail=FALSE,Tables=TRUE,summ.by="diag",num.dec=2)

preds.prior.B.mod<-dcl.predict.prior(Ntriangle,Xtriangle,
          inflat.j=rep(1,m),Qi=my.Qi,Model=2,adj=2,
          Tail=FALSE,Tables=TRUE,summ.by="diag",num.dec=2)

## Prior C: only using development inflation and zero claims inflation
preds.prior.C.gen<-dcl.predict.prior(Ntriangle,Xtriangle,
          inflat.j=my.inflat.j,Qi=my.Qi,Model=0,adj=1,
          Tail=FALSE,Tables=TRUE,summ.by="diag",num.dec=2)

preds.prior.C.mod<-dcl.predict.prior(Ntriangle,Xtriangle,
          inflat.j=my.inflat.j,Qi=my.Qi,Model=2,adj=2,
          Tail=FALSE,Tables=TRUE,summ.by="diag",num.dec=2)
}
\keyword{htest}
