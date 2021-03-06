% Generated by roxygen2 (4.1.1): do not edit by hand
% Please edit documentation in R/MulticlassWrapper.R
\name{makeMulticlassWrapper}
\alias{makeMulticlassWrapper}
\title{Fuse learner with multiclass method.}
\usage{
makeMulticlassWrapper(learner, mcw.method = "onevsrest")
}
\arguments{
\item{learner}{[\code{\link{Learner}} | \code{character(1)}]\cr
The learner.
If you pass a string the learner will be created via \code{\link{makeLearner}}.}

\item{mcw.method}{[character(1) | function] \cr
\dQuote{onevsone} or \dQuote{onevsrest}.
You can also pass a function, with signature \code{function(task)} and which
returns a ECOC codematrix with entries +1,-1,0.
Columns define new binary problems, rows correspond to classes (rows must be named).
0 means class is not included in binary problem.
Default is \dQuote{onevsrest}.}
}
\value{
[\code{\link{Learner}}].
}
\description{
Fuses a base learner with a multi-class method.
Creates a learner object, which can be used like any other learner object.
This way learners which can only handle binary classification will be able to
handle multi-class problems, too.

We use a multiclass-to-binary reduction principle, where multiple binary
problems are created from the multiclass task. How these binary problems
are generated is defined by an error-correcting-output-code (ECOC) code book.
This also allows the simple and well-known one-vs-one and one-vs-rest
approaches. Decoding is currently done via Hamming decoding, see
e.g. here \url{http://jmlr.org/papers/volume11/escalera10a/escalera10a.pdf}.

Currently, the approach always operates on the discrete predicted labels
of the binary base models (instead of their probabilities) and the created
wrapper cannot predict posterior probabilities.
}
\seealso{
Other wrapper: \code{\link{CostSensClassifModel}},
  \code{\link{CostSensClassifWrapper}},
  \code{\link{makeCostSensClassifWrapper}};
  \code{\link{CostSensRegrModel}},
  \code{\link{CostSensRegrWrapper}},
  \code{\link{makeCostSensRegrWrapper}};
  \code{\link{makeBaggingWrapper}};
  \code{\link{makeDownsampleWrapper}};
  \code{\link{makeFeatSelWrapper}};
  \code{\link{makeFilterWrapper}};
  \code{\link{makeImputeWrapper}};
  \code{\link{makeMultilabelBinaryRelevanceWrapper}};
  \code{\link{makeOverBaggingWrapper}};
  \code{\link{makeOversampleWrapper}},
  \code{\link{makeUndersampleWrapper}};
  \code{\link{makePreprocWrapperCaret}};
  \code{\link{makePreprocWrapper}};
  \code{\link{makeSMOTEWrapper}};
  \code{\link{makeTuneWrapper}};
  \code{\link{makeWeightedClassesWrapper}}
}

