% Generated by roxygen2 (4.1.1): do not edit by hand
% Please edit documentation in R/performance.R
\name{performance}
\alias{performance}
\title{Measure performance of prediction.}
\usage{
performance(pred, measures, task = NULL, model = NULL, feats = NULL)
}
\arguments{
\item{pred}{[\code{\link{Prediction}}]\cr
Prediction object.}

\item{measures}{[\code{\link{Measure}} | list of \code{\link{Measure}}]\cr
Performance measure(s) to evaluate.
Default is the default measure for the task, see here \code{\link{getDefaultMeasure}}.}

\item{task}{[\code{\link{Task}}]\cr
Learning task, might be requested by performance measure, usually not needed except for clustering.}

\item{model}{[\code{\link{WrappedModel}}]\cr
Model built on training data, might be requested by performance measure, usually not needed.}

\item{feats}{[\code{data.frame}]\cr
Features of predicted data, usually not needed except for clustering.
If the prediction was generated from a \code{task}, you can also pass this instead and the features
are extracted from it.}
}
\value{
[named \code{numeric}]. Performance value(s), named by measure(s).
}
\description{
Measures the quality of a prediction w.r.t. some performance measure.
}
\examples{
training.set = seq(1, nrow(iris), by = 2)
test.set = seq(2, nrow(iris), by = 2)

task = makeClassifTask(data = iris, target = "Species")
lrn = makeLearner("classif.lda")
mod = train(lrn, task, subset = training.set)
pred = predict(mod, newdata = iris[test.set, ])
performance(pred, measures = mmce)

# Compute multiple performance measures at once
ms = list("mmce" = mmce, "acc" = acc, "timetrain" = timetrain)
performance(pred, measures = ms, task, mod)
}
\seealso{
Other performance: \code{\link{G1}}, \code{\link{G2}},
  \code{\link{acc}}, \code{\link{auc}}, \code{\link{bac}},
  \code{\link{ber}}, \code{\link{brier}},
  \code{\link{cindex}}, \code{\link{db}},
  \code{\link{dunn}}, \code{\link{f1}}, \code{\link{fdr}},
  \code{\link{featperc}}, \code{\link{fn}},
  \code{\link{fnr}}, \code{\link{fp}}, \code{\link{fpr}},
  \code{\link{gmean}}, \code{\link{gpr}},
  \code{\link{hamloss}}, \code{\link{mae}},
  \code{\link{mcc}}, \code{\link{mcp}},
  \code{\link{meancosts}}, \code{\link{measureACC}},
  \code{\link{measureAUC}}, \code{\link{measureBAC}},
  \code{\link{measureBrier}}, \code{\link{measureFDR}},
  \code{\link{measureFN}}, \code{\link{measureFNR}},
  \code{\link{measureFP}}, \code{\link{measureFPR}},
  \code{\link{measureGMEAN}}, \code{\link{measureGPR}},
  \code{\link{measureHAMLOSS}}, \code{\link{measureMAE}},
  \code{\link{measureMCC}}, \code{\link{measureMEDAE}},
  \code{\link{measureMEDSE}}, \code{\link{measureMMCE}},
  \code{\link{measureMSE}}, \code{\link{measureNPV}},
  \code{\link{measurePPV}}, \code{\link{measureRMSE}},
  \code{\link{measureSAE}}, \code{\link{measureSSE}},
  \code{\link{measureTN}}, \code{\link{measureTNR}},
  \code{\link{measureTP}}, \code{\link{measureTPR}},
  \code{\link{measures}}, \code{\link{medae}},
  \code{\link{medse}}, \code{\link{mmce}},
  \code{\link{mse}}, \code{\link{multiclass.auc}},
  \code{\link{npv}}, \code{\link{ppv}}, \code{\link{rmse}},
  \code{\link{sae}}, \code{\link{silhouette}},
  \code{\link{sse}}, \code{\link{timeboth}},
  \code{\link{timepredict}}, \code{\link{timetrain}},
  \code{\link{tn}}, \code{\link{tnr}}, \code{\link{tp}},
  \code{\link{tpr}}; \code{\link{Measure}},
  \code{\link{makeMeasure}};
  \code{\link{estimateRelativeOverfitting}},
  \code{\link{estimateRelativeOverfitting.ResampleDesc}};
  \code{\link{makeCostMeasure}};
  \code{\link{makeCustomResampledMeasure}}
}

