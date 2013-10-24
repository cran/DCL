\name{get.incremental}
\alias{get.incremental}
\title{Incremental triangle
}
\description{
Switch from an cumulative to an incremental triangle
}
\usage{
get.incremental( triangle )
}
\arguments{
  \item{triangle}{
A cumulative run-off triangle
}
}
\value{
The incremental triangle
}
\author{
M.D. Martinez-Miranda, J.P. Nielsen and R. Verrall
}
\note{
The methods in this the DCL package works normally on incremental triangles 
}


\seealso{
\code{\link{get.cumulative}}
}
\examples{
data(NtriangleDCL)
Ntriangle.cum<-get.cumulative(NtriangleDCL)
get.incremental(Ntriangle.cum)
}
\keyword{manip}

