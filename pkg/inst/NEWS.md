# Version 1.1.9 [unreleased]
* Fixed a bug in `forecast.hybridModel()` when for models where `xreg` was not supplied to all of arima/nnetar models
* Fixes in unit tests and better documentation of unit tests
* `ts` objects created with the "timekt" package can now be used in `hybridModel()`
* The `doParallel` and `forecast` packages are now imported instead of loading their entire namespaces.

# Version 1.0.8 [2017-07-10]
* `cvts()` now supports parallel fitting through the `num.cores` argument.
Note that if the model that you are fitting also utilizes parallelization,
the number of cores used by each model multiplied by `num.cores` passed to
`cvts()` should not exceed the number of cores on your machine.
* The package versioning now follows [semantic versioning](http://semver.org/) more closely; however, the convention used will be `MAJOR.MINOR.RELEASE_NUM`.
* Instead of loading the entire `ggplot2` namespace, only specific functions are now imported.

# Version 0.4.1 [2017-06-18]
* The "forecast" package v8.1 now declares the S3 method `accuracy()`, so this is imported and no longer declared in "forecastHybrid".

# Version 0.4.0 [2017-03-31]
* Import the "zoo" package 
* Fixed a bug in `cvts()` when using `rolling = TRUE` whereby the incorrect number of periods were calulated. Thanks to Ganesh Krishnan for the bugfix.
  * The `cvts()` function now allows additional arguments to be passed with `...`. Thanks to Ganesh Krishnan.
* Additional `...` arguments can be passed to the individual component models in `forecast.hybridModel()`.
* Documentation fixes and improvements, particularly for the `cvts()` function.
* Unit tests were optimized for speed, and the package tests in half the previous time.
* The behavior of the `forecast()` function from the "forecast" package when multiple or single prediction intervals are passed has changed. The prediction inervals are now consistently returned as matrices. This change fixes a bug in `forecast.hybridModel()` when multiple prediction intervals are used.
* Fixed a bug with `forecast.hybridModel()` for `ets`, `nnetar`, and `stlm` component models when the `level` argument was set to a single value instead of a vector of values.
* Fixed warning message for superfluous lists passed to base models in `hybridModel()`

# Version 0.3.0 [2016-12-18]
* Prediction intervals are now created for `nnetar` objects in the ensemble. This should address one aspect of incorrect prediction intervals (e.g. issue #37).
* theta models can be added (by including "`f`" in the `models =` argument for `hybridModel()`) and are indeed part of the default - so by default, hybridModel() will now fit six models
* `accuracy.cvts()` is now exported
* `plot.hybridModel()` now supports `ggplot2` graphics when the argument `ggplot = TRUE` is passed.
* Time series must be at least four observations long
* Fixed an error where e.args was passed to tbats instead of t.args

# Version 0.2.0 [2016-09-23]
* Add timeseries cross validation with `cvts()`
* Add support for `weights = "cv.errors"` in `hybridModel()`
* Fix model weights when `weights = "insample.errors"` and one or more component models perfectly fit the time series
* Fixed erroneous warning message when `xreg` is included in `n.args` but a `nnetar` model is not included in the model list
* Clean up titles in `plot.hybridModel()`
* Enable passing `...` arguments to `plot()` from `plot.hybridModel()`
* Round weights in `print.hybridModel()` to three digits for cleaner display
* Add `verbose` argument and enable by default in `hybridModel()` to display fitting/cross validation progress

# Version 0.1.7 [2016-06-04]
* Build vignette with `knitr rmarkdown` engine
* Build vignette with travis

# Version 0.1.6 [2016-05-31]
* Fix broken S3 generic `accuracy()` and `hybridModel.accuracy()`
* Add vignette
* Add NEWS
* Remove "fpp" from dependencies
* Fix warning for unimplemented parameter `weights = "cv.errors"`
* Fix error with `nnetar` and `stlm` models when `2 * frequency(y) >= length(y)`
* Documentation improvements MORE TODO
* Migrate unit tests away from deprecated `not()` function from "testthat" package
* Add additional unit tests for bugfixes (accuracy fix, nnetar/stlm `2 * frequency(y) >= length(y)`, `weights = "cv.errors"`)

# Version 0.1.5 [2016-04-16]
* First CRAN release
