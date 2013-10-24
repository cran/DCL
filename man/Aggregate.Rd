\name{Aggregate}
\alias{Aggregate}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{Switch to a higher level of aggregation
}
\description{ From the input run-off triangle (weekly, monthly, quarterly, etc.) the function creates another triangle on a higher level of aggregation.
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
Aggregate(triangle, freq = 4)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{triangle }{The original run-off (incremental) triangle. It should be a squared matrix (let denote by m its dimension m).
%%     ~~Describe \code{triangle} here~~
}
  \item{freq }{The frequency to be considered in the aggregation. The default value is 4, to be used to construct a yearly run-off triangle from a quarterly \code{triangle}}. 
%%     ~~Describe \code{freq} here~~
}
\details{If the input triangle does not consist of complete periods (for example a quarterly triangle with only three quarters in the last year), then the last (lower level) periods will been removed to get full aggregated periods.
}
\value{A run-off triangle in the specified higher level of aggregation.
}
%\references{
%% ~put references to the literature/web site here ~
%}
\author{
M.D. Martinez-Miranda, J.P. Nielsen and R. Verrall
}
%\note{
%%  ~~further notes~~
%}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
%% ~~objects to See Also as \code{\link{help}}, ~~~
\code{\link{get.incremental}},\code{\link{get.cumulative}},\code{\link{Plot.triangle}}
}
\examples{
## A dummy example: a run-off triangle with 5*4=20 quarters
m<-20
my.square<-matrix(1,m,m)
# Now my.triangle is a quarterly triangle (the upper left triangle from my.square)
my.triangle<-my.square
my.triangle[row(my.square)+col(my.square)>(m+1)]<-NA
my.yearly.triangle<-Aggregate(my.triangle)
list(original=my.triangle,yearly=my.yearly.triangle)

}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{manip}
%\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
