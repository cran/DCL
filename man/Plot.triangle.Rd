\name{Plot.triangle}
\alias{Plot.triangle}
\title{Plotting an incremental run-off triangle
}
\description{Graphical representaion of an incremental run-off triangle.
}
\usage{
Plot.triangle( triangle , Histogram = FALSE , tit='' )
}
\arguments{
  \item{triangle}{
  The loss incremental triangle. It should be a matrix with the observed counts (number of reported claims, number of payments etc.), payments or incurred data, located in the upper triangle. The lower triangle consisting in missing or zero values.}
  \item{Histogram }{Logical. If TRUE then a histogram representing the triangle is shown. If FALSE (default) then a classical representation of the triangle is shown, this is, a matplot of the row sums from both incremental and cummulative triangle. }
   \item{tit }{Character. Title to be added to the plot}
}
\details{ A histogram representation of the histogram is consistent with the run-off triangles of counts such as the number of reported claims, number of payments, etc. See Martinez-Miranda, Nielsen, Sperlich and Verrall (2013) for a further explanation.
}
\value{No returned value}

\references{
Martinez-Miranda, M.D., Nielsen, J.P. and Verrall, R. (2012) Double Chain Ladder. \emph{Astin Bulletin}, 42/1, 59-76.

Martinez-Miranda M.D., Nielsen, J.P., Sperlich, S., Verrall, R. (2013). Continuous Chain Ladder: Reformulating and generalizing a classical insurance problem. Experts Systems with Applications, 40(14), 5588-5603.
}
\author{
M.D. Martinez-Miranda, J.P. Nielsen and R. Verrall
}

\seealso{
\code{\link{get.incremental}}, \code{\link{clm}}
}
\examples{
## Plotting a counts triangle (number of reported claims)
data(NtriangleDCL)
Plot.triangle(NtriangleDCL, Histogram=TRUE,tit=expression(paste('Counts: ',N[ij])))
# Classical CL predictions
clm.N<-clm(NtriangleDCL)
Nhat<-clm.N$triangle.hat
# Compare the original histogram with the CL projections
Plot.triangle(Nhat, Histogram=TRUE,tit='CL Predictions')

## Plotting a paid triangle (number of reported claims)
data(XtriangleDCL)
Plot.triangle(XtriangleDCL)
}

\keyword{Graphics}
