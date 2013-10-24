\name{XtriangleDCL}
\alias{XtriangleDCL}
\docType{data}
\title{
Paid data (DCL example)
}
\description{
Real motor data from a major insurer. 
It is a yearly run-off (incremental) triangle consisting of the aggregated payments during 10 years. These data were used in the empirical illustration provided by Martinez-Miranda, Nielsen and Verrall (2012).
}
\usage{data(XtriangleDCL)}
\format{
  Matrix with dimension 10 by 10: 10 undewriting years and 10 development years.
}
\source{
Martinez-Miranda, M.D., Nielsen, J.P. and Verrall, R. (2012) Double Chain Ladder. \emph{Astin Bulletin}, 42/1, 59-76.
}

\examples{
data(XtriangleDCL)
Plot.triangle(XtriangleDCL)
# Classical chain ladder method
clm(XtriangleDCL)
}
\keyword{datasets}

