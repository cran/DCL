\name{extract.prior}
\alias{extract.prior}
\title{Extracting information about zero-claims and severity inflation
}
\description{A way of extracting information about zero-claims and severity development inflation through the DCL method applied to two counts triangles: number of payments and number of reported claims. 
}
\usage{
extract.prior(Xtriangle, Npaid, Ntriangle, Plots = TRUE , n.cal = NA ,
  Fj.X = NA , Fj.N = NA , Fj.Npaid = NA )
}
\arguments{
 \item{Xtriangle}{
  The paid run-off triangle: incremental aggregated payments. It should be a matrix with incremental aggregated  payments located in the upper triangle and the lower triangle  consisting in missing or zero values.
  }
  \item{Npaid}{
  A run-off (incremental) triangle with the number of payments. It should be a matrix with the observed counts located in the upper triangle and the lower triangle  consisting in missing or zero values. It should has the same dimension as \code{Xtriangle} (both in the same aggregation level (quarters, years,etc.))
}
 \item{Ntriangle }{
  The counts data triangle: incremental number of reported claims. It should be a matrix with the observed counts located in the upper triangle and the lower triangle  consisting in missing or zero values. It should has the same dimension as \code{Xtriangle} (both in the same aggregation level (quarters, years,etc.))
  }
\item{Plots}{Logical. If TRUE (default) it is showed a two by one plot showing the extracted severity inflation in the development direction and the probability of zero-claims for each underwriting period.
}
  \item{n.cal}{Integer specifying the number of most recent calendars which will be used to calculate the development factors. By default \code{n.cal=NA} and all the observed calendars    are used (classical chain ladder). }
  \item{Fj.X}{Optional vector with lentgth m-1 (m being the dimension of the triangles) with the development factors to calculate the chain ladder estimates from \code{Xtriangle}. See more details in \code{\link{clm}}.} 
  \item{Fj.Npaid}{Optional vector with lentgth m-1 with the development factors to calculate the chain ladder estimates from \code{Npaid}. } 
  \item{Fj.N}{Optional vector with lentgth m-1 with the development factors to calculate the chain ladder estimates from \code{Ntriangle}. }   
}
\details{
The function implements the strategy proposed in the paper by Martinez-Miranda, Nielsen, Verrall and Wuthrich (2013) to extract information for additional triangles (see "Section 5: An example showing how other data can be used to provide prior information in practice"). The derived severity inflation \code{inflat.j} does not extend to the tail. If you want provide the tail, by using \code{\link{dcl.predict.prior}}, the vector  should be extended to have dimension 2m-1, otherwise the tail will be not provided (as was done in the cited paper).
}
\value{
\item{inflat.j }{A vector with dimension m with the extracted severity inflation in the development direction.}
\item{Qi }{A vector with dimension m with the extracted probability of zero-claims for undewriting period.}
}
\references{
Martinez-Miranda, M.D., Nielsen, J.P., Verrall, R. and Wuthrich, M.V. (2013) Double Chain Ladder, Claims Development Inflation and Zero Claims. \emph{Scandinavian Actuarial Journal}. In press.
}
\author{
M.D. Martinez-Miranda, J.P. Nielsen and R. Verrall
}

\seealso{
\code{\link{dcl.predict.prior}}, \code{\link{dcl.estimation}}
}
\examples{
## Data application in Martinez-Miranda, Nielsen, Verrall and Wuthrich (2013)
data(NtrianglePrior)
data(NpaidPrior)
data(XtrianglePrior)

extract.prior(XtrianglePrior,NpaidPrior,NtrianglePrior)

}
\keyword{Statistics}
