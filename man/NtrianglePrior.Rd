\name{NtrianglePrior}
\alias{NtrianglePrior}
\docType{data}
\title{Number of reported claims (adding prior knowledge example)
}
\description{
It is a yearly run-off (incremental) triangle consisting of the number of reported claims during 14 years. These data were used in the empirical illustration provided by Martinez-Miranda, Nielsen, Verrall and Wuthrich (2013).
}
\usage{data(NtrianglePrior)}
\format{
  Matrix with dimension 14 by 14: 14 undewriting years and 14 development years.
}
\source{
Martinez-Miranda, M.D., Nielsen, J.P., Verrall, R. and Wuthrich, M.V. (2013) Double Chain Ladder, Claims Development Inflation and Zero Claims. \emph{Scandinavian Actuarial Journal}.
In press.}
\examples{
data(NtrianglePrior)

Plot.triangle(NtrianglePrior, Histogram=TRUE)
Plot.triangle(NtrianglePrior)

# Classical chain ladder method
clm(NtrianglePrior)
}
\keyword{datasets}
