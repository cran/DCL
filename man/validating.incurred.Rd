\name{validating.incurred}
\alias{validating.incurred}
\title{Back-test: testing against the experience
}
\description{A back-test to validate incurred reserve (IDCL) against paid reserve (DCL) or the paid with a Bornhuetter-Fergusson adjustment (BDCL). The validation strategy consists of: (1) Cut ncut=1,2,. diagonals from the observed paid triangle. (2) Apply the three methods (DCL, BDCL and IDCL), and (3) compare forecasts and actual values.
}
\usage{
validating.incurred( ncut = 0 , Xtriangle , Ntriangle , Itriangle , 
  Model = 0 , Plot.box = TRUE , Tables = TRUE , num.dec = 4 , 
  n.cal = NA , Fj.X = NA , Fj.N = NA , Fj.I = NA)
}
\arguments{
  \item{ncut }{The number of last periods (diagonals) to cut from the paid triangle. The default value is 0 (see details below).
}
  \item{Xtriangle }{
  The paid run-off triangle: incremental aggregated payments. It should be a matrix with incremental aggregated  payments located in the upper triangle and the lower triangle  consisting in missing or zero values.}
 \item{Ntriangle }{
  The counts data triangle: incremental number of reported claims. It should be a matrix with the observed counts located in the upper triangle and the lower triangle  consisting in missing or zero values. It should has the same dimension as \code{Xtriangle} (both in the same aggregation level (quarters, years,etc.))}
  \item{Itriangle }{
  The incurred triangle. It should be a matrix with incurred data located in the upper triangle. It is an incremental run-off triangle with the same dimension as \code{Xtriangle}  (both in the same aggregation level (quarters, years,etc.)) }
    \item{Model }{Possible values are 0, 1 or 2 (default). See more details below.
}
  \item{Plot.box }{Logical. If \code{TRUE} (default) it is shown a boxplot of the errors in the cells predictions. 
} 
  \item{Tables }{Logical. If \code{TRUE} (default) it is shown a table with the errors in the cells, diagonals and overall total predicion. 
} 
  \item{num.dec }{Number of decimal places used to report numbers in the tables. Used only if \code{Tables=TRUE}.
}
  \item{n.cal}{Integer specifying the number of most recent calendars which will be used to calculate the development factors. By default \code{n.cal=NA} and all the observed calendars    are used (classical chain ladder). }
  \item{Fj.X}{Optional vector with lentgth m-1 (m being the dimension of the triangles) with the development factors to calculate the chain ladder estimates from \code{Xtriangle}. See more details in \code{\link{clm}}.} 
  \item{Fj.N}{Optional vector with lentgth m-1 with the development factors to calculate the chain ladder estimates from \code{Ntriangle}. } 
  \item{Fj.I}{Optional vector with lentgth m-1 with the development factors to calculate the chain ladder estimates from \code{Itriangle}. } 
}
\details{
If \code{ncut=0} the test is not computed but a plot showing the difference among the three methods is shown. It is recommended to start with this step to have some insight about the problem. Note that the first part in the IDCL inflation is usually very volatile since no many outstanding liabitities arise from the first underwriting periods. 

The predicion errors provided through the value \code{pe.vector} are calculated as follow:

For individual cells: \code{pe.cells =  sum(ce.dif^2) / sum(ce.obs^2) }

with \code{ce.dif} being the vector with the differences between the predicted cells and the actual cells (\code{ce.obs}).

For diagonals: \code{pe.diags =  sum(ca.dif^2) / sum(ca.obs^2) }

with \code{ca.dif} being the vector with the differences between the predicted calendars and the actual calendars (\code{ca.obs}).

For the total reserve: \code{pe.tot =  sum(tot.dif^2) / sum(tot.obs^2)} 

with \code{tot.dif} the absolute difference between the predicted reserve and the actual reserve (tot.obs).

}

\value{
\item{pe.vector }{A vector (length 10) with elements being (in the following order): \code{ncut}, the averaged errors predicing cells by  DCL, BDCL and IDCL (see \code{pe.cells} in Details above), the three averaged errors by predicing diagonals (\code{pe.diags}), and the three errors by predicting the overal total (\code{pe.tot}).}
\item{Xdif }{A matrix with the individual cells errors (see \code{ce.dif} in Details above) for each method (by columns)} %Xdif<-cbind(DCLdif,BDCLdif,IDCLdif)
\item{Inflat.DCL }{The estimated underwriting DCL inflation using \code{\link{dcl.estimation}}. Only provided if \code{ncut=0}.}
\item{Inflat.BDCL }{The estimated underwriting BDCL inflation using \code{\link{bdcl.estimation}}. Only provided if \code{ncut=0}.}
\item{Inflat.IDCL }{The estimated underwriting IDCL inflation using \code{\link{idcl.estimation}}. Only provided if \code{ncut=0}.}

}

\references{
Martinez-Miranda, M.D., Nielsen, J.P. and Verrall, R. (2013) Double Chain Ladder and Bornhuetter-Ferguson. \emph{North Americal Actuarial Journal}, 17(2), 101-113.

Martinez-Miranda M.D., Nielsen, J.P., Sperlich, S., Verrall, R. (2013). Continuous Chain Ladder: Reformulating and generalizing a classical insurance problem. Experts Systems with Applications, 40(14), 5588-5603.
}
\author{
M.D. Martinez-Miranda, J.P. Nielsen and R. Verrall
}

\note{
To validate classical chain ladder on paid data against classical chain ladder on incurred data it should be used \code{Model=0} (see \code{\link{dcl.predict}}) for more details. 
}


\seealso{
\code{\link{dcl.estimation}}, \code{\link{bdcl.estimation}},  \code{\link{idcl.estimation}}, ,\code{\link{dcl.predict}}

}
\examples{
data(NtriangleBDCL)
data(XtriangleBDCL)
data(ItriangleBDCL)

Ntriangle<-NtriangleBDCL
Xtriangle<-XtriangleBDCL
Itriangle<-ItriangleBDCL
## First compare the three methods to be validated (three different inflations)
validating.incurred(ncut=0,Xtriangle,Ntriangle,Itriangle)

## Now perform a backtest cutting up to four calendars backward
test.res<-matrix(NA,4,10)
par(mfrow=c(2,2),cex.axis=0.9,cex.main=1)
par(mar=c(1.5,1.5,1.5,1.5),oma=c(1,0.5,0.5,0.2),mgp=c(3,0.5,0)) 
for (i in 1:4)
{
  res<-validating.incurred(ncut=i,Xtriangle,Ntriangle,Itriangle,Tables=FALSE)
  test.res[i,]<-as.numeric(res$pe.vector)
}
test.res<-as.data.frame(test.res)
names(test.res)<-c("num.cut","pe.point.DCL","pe.point.BDCL","pe.point.IDCL",
"pe.calendar.DCL","pe.calendar.BDCL","pe.calendar.IDCL",
"pe.total.DCL","pe.total.BDCL","pe.total.IDCL")
print(test.res)
}
\keyword{models}
