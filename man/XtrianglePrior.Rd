\name{XtrianglePrior}
\alias{XtrianglePrior}
\docType{data}
\title{Paid data (adding prior knowledge example)
}
\description{
It is a run-off (incremental) triangle consisting of the aggregated payments during 19 years. These data were used in the empirical illustration provided by Martinez-Miranda, Nielsen, Verrall and Wuthrich (2013).
}
\usage{data(XtrianglePrior)}
\format{
  Matrix with dimension 14 by 14: 14 undewriting years and 14 development years.
}
\source{
Martinez-Miranda, M.D., Nielsen, J.P., Verrall, R. and Wuthrich, M.V. (2013) Double Chain Ladder, Claims Development Inflation and Zero Claims. \emph{Scandinavian Actuarial Journal}.
In press.}
\examples{
data(XtrianglePrior)

Plot.triangle(XtrianglePrior)
# Classical chain ladder method
clm(XtrianglePrior)
}
\keyword{datasets}
