\name{NtriangleDCL}
\alias{NtriangleDCL}
\docType{data}
\title{
Number of reported claims (DCL example)
}
\description{
Real motor data from a major insurer. 
It is a yearly run-off (incremental) triangle consisting of the number of reported claims during 10 years. These data were used in the empirical illustration provided by Martinez-Miranda, Nielsen and Verrall (2012).
}
\usage{data(NtriangleDCL)}
\format{
  Matrix with dimension 10 by 10: 10 undewriting years and 10 development years.
}
\source{
Martinez-Miranda, M.D., Nielsen, J.P. and Verrall, R. (2012) Double Chain Ladder. \emph{Astin Bulletin}, 42/1, 59-76.
}


\examples{
data(NtriangleDCL)

Plot.triangle(NtriangleDCL, Histogram=TRUE)
Plot.triangle(NtriangleDCL)

# Classical chain ladder method
clm(NtriangleDCL)
}
\keyword{datasets}
