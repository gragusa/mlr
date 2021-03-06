#' @export
makeRLearner.classif.binomial = function() {
  makeRLearnerClassif(
    cl = "classif.binomial",
    package = "stats",
    par.set = makeParamSet(
      makeDiscreteLearnerParam("link", values = c("logit", "probit", "cloglog", "cauchit", "log"),
        default = "logit"),
      makeLogicalLearnerParam("model", default = TRUE, tunable = FALSE)
    ),
    properties = c("twoclass", "numerics", "factors", "prob", "weights"),
    name = "Binomial Regression",
    short.name = "binomial",
    note = "Delegates to glm with freely choosable binomial link function via learner param 'link'."
  )
}

#' @export
trainLearner.classif.binomial = function(.learner, .task, .subset, .weights = NULL, link = "logit", ...) {
  f = getTaskFormula(.task)
  stats::glm(f, data = getTaskData(.task, .subset), model = FALSE,
    family = binomial(link = link), ...)
}

#' @export
predictLearner.classif.binomial = function(.learner, .model, .newdata, ...) {
  x = predict(.model$learner.model, newdata = .newdata, type = "response", ...)
  levs = .model$task.desc$class.levels
  if (.learner$predict.type == "prob") {
    propVectorToMatrix(x, levs)
  } else {
    levs = .model$task.desc$class.levels
    p = as.factor(ifelse(x > 0.5, levs[2L], levs[1L]))
    unname(p)
  }
}


