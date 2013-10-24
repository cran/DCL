\name{NtriangleBDCL}
\alias{NtriangleBDCL}
\docType{data}
\title{
Number of reported claims (BDCL example)
}
\description{
Real motor data from a major insurer. 
It is a yearly run-off (incremental) triangle consisting of the number of reported claims during 19 years. These data were used in the empirical illustration provided by Martinez-Miranda, Nielsen and Verrall (2013).
}
\usage{data(NtriangleBDCL)}
\format{
  Matrix with dimension 19 by 19: 19 undewriting years and 19 development years.
}
\references{
Martinez-Miranda, M.D., Nielsen, J.P. and Verrall, R. (2013) Double Chain Ladder and Bornhuetter-Fergusson. \emph{North American Actuarial Journal}, 17(2), 101-113.
}

\examples{
data(NtriangleBDCL)

Plot.triangle(NtriangleBDCL, Histogram=TRUE)
Plot.triangle(NtriangleBDCL)

# Classical chain ladder method
clm(NtriangleBDCL)
}
\keyword{datasets}
