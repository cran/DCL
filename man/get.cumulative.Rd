\name{get.cumulative}
\alias{get.cumulative}
\title{Cumulative triangle
}
\description{
Switch from an incremental to a cumulative triangle
}
\usage{
get.cumulative( triangle )
}
\arguments{
  \item{triangle}{
An incremental run-off triangle
}
}
\value{
The cumulative triangle
}
\author{
M.D. Martinez-Miranda, J.P. Nielsen and R. Verrall
}
\note{
The methods in this the DCL package works normally on incremental triangles 
}


\seealso{
\code{\link{get.incremental}}
}
\examples{
data(NtriangleDCL)
get.cumulative(NtriangleDCL)
}
\keyword{manip}
