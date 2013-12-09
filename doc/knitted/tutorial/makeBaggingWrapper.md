Bagging Wrapper
========================================================

One reason why *Random Forrests* perform so well ist that they are using Bagging as a technique to gain more stability.
But why do you want to limit yourself to the classificators already implemented in well known *Random Forrests* when it is realy easy to build your one with *mlr*?

Just bag one learner already supported by *mlr* with `makeBaggingWrapper()`.

Here is how you do it:
Like in a *Random Forrests* we need a Learner which is trained on each *Bagging* iteration with a subsample of the training dataset.
The subsamples are choosen according to the following parameters used in `makeBaggingWrapper()`:
* `bag.iters` On how many subsamples do we want to train our learner?
* `bag.replace` Sample bags with replacement? (Also known as *bootstrapping*)
* `bag.size` Percentage size of the sampled bags. (*Note: When `bag.replace=TRUE`, `bag.size=1` is default which does not mean, that one bag contains all the observations as observations will occur multiple times in each bag*)
* `bag.feats` Percentage size of randomy selected features for each iteration. 

Of course we also need a `learner` which we have to pass to `makeBaggingWrapper()`.


```r
library(mlr)
data(Sonar)
tsk = makeClassifTask(data = Sonar, target = "Class")
lrn = makeLearner("classif.PART")
rsmpl = makeResampleDesc("CV", iters = 10)
bagLrn = makeBaggingWrapper(lrn, bag.iters = 50, bag.replace = TRUE, bag.size = 0.8, 
    bag.feats = 3/4)
```

No as we have set up everything we are curious how good the bagging performs.
First let's try it without bagging:

```r
result = resample(learner = lrn, task = tsk, resampling = rsmpl)
```

```
## [Resample] cross-validation iter: 1
## [Resample] cross-validation iter: 2
## [Resample] cross-validation iter: 3
## [Resample] cross-validation iter: 4
## [Resample] cross-validation iter: 5
## [Resample] cross-validation iter: 6
## [Resample] cross-validation iter: 7
## [Resample] cross-validation iter: 8
## [Resample] cross-validation iter: 9
## [Resample] cross-validation iter: 10
## [Resample] Result: mmce.test.mean=0.235
```

Can we improve using *mlrs bagging Wrapper*?

```r
resultBagging = resample(learner = bagLrn, task = tsk, resampling = rsmpl)
```

```
## [Resample] cross-validation iter: 1
## [Resample] cross-validation iter: 2
## [Resample] cross-validation iter: 3
## [Resample] cross-validation iter: 4
## [Resample] cross-validation iter: 5
## [Resample] cross-validation iter: 6
## [Resample] cross-validation iter: 7
## [Resample] cross-validation iter: 8
## [Resample] cross-validation iter: 9
## [Resample] cross-validation iter: 10
## [Resample] Result: mmce.test.mean=0.187
```

It conusmes more time but can outperform not bagged learners on noisy data with many variables.

