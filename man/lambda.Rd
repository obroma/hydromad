\name{lambda}
\alias{lambda}
\alias{lambda.sim}
\alias{ssg.lambda}
\alias{normalise.lambda}
\title{ Transfer function with two exponential components and variable partitioning }
\description{
  \var{Lambda} unit hydrograph.
  Transfer function with two exponential components and variable
  partitioning.
}
\usage{
lambda.sim(U, delay = 0,
           tau_s = 0, tau_q = 0,
           lambda = 0, v_s = 1,
           loss = 0,
           Xs_0 = 0, Xq_0 = 0,
           return_components = FALSE,
	   na.action = na.pass,
           epsilon = hydromad.getOption("sim.epsilon"))
}
\arguments{
  \item{U}{
    input time series.
  }
  \item{delay}{
    lag (dead time) between input and response, in time steps.
  }
  \item{tau_s, tau_q}{
    time constants for the exponential components.
  }
  \item{lambda}{
    variable partitioning parameter, see Details.
  }
  \item{v_s}{
    maximum fractional volume for the slower exponential component.
  }
  \item{loss}{
    a constant loss (or gain) term subtracted from the \emph{slow}
    (\code{s}) component.
  }
  \item{Xs_0, Xq_0}{
    initial values of the exponential components.
  }
  \item{return_components}{
    whether to return all component time series.
  }
  \item{na.action}{
    function to remove missing values,
    e.g. \code{\link[=na.omit.ts]{na.omit}}.
  }
  \item{epsilon}{
    values smaller than this will be set to zero.
  }
}
\details{

  The \var{lambda} unit hydrograph model is a variant of the
  second-order \code{\link{expuh}} model, i.e. two exponentially
  receding stores in parallel. The \var{lambda} form allows the
  partitioning of flow between quick and slow components to depend on
  the magnitude of effective rainfall. In this model, runoff from large
  rainfall events tends to be quick flow, and runoff from small events
  tends to be slow flow.

\deqn{v_s[t] = v_{s,0} U[t] ^ \lambda}
\deqn{v_q[t] = 1 - v_s[t]}

where \var{U} is the input (effective rainfall); \eqn{v_{s,0}} is the
 maximum fractional volume of the slow flow component, and is given by
 the \code{v_s} argument.

The \eqn{\lambda} parameter (\code{lambda} argument) must be between 0
and -1; the case \code{lambda = 0} corresponds to the basic
\code{\link{expuh}} model. 
  
}
\value{
  the model output as a \code{\link{ts}} object,
  with the same dimensions and time window as the input \code{U}.
  If \code{return_components = TRUE}, it will have multiple
  columns named \code{Xs} and \code{Xq}.
}
\references{
  ...
}
\author{ Felix Andrews \email{felix@nfrac.org} }
\seealso{
  \code{\link{expuh}},
  \code{\link{lambda.inverse.sim}}
}
\examples{

}
\keyword{ ts }

