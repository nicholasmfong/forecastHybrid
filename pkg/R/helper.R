#' Combine multiple sequential time series
#'
#' Combine multiple ts objects into a single ts object. It is assumed that the ts objects provided
#' are sequential. In other words, it is assumed that a valid time series object can actually 
#' be constructed from the provided objects. The start time and frequency of the combined object 
#' will correspond to the start time and frequency of the first provided object
#' 
#' @export
#' @param ... ts objects to combine
#' 
#' @return A combined ts object generated from the individual ts objects
#' 
#' @details Combine sequential time series objects into a single time series object. This might
#' be useful, for example, when you want to combine the training and validation time series objects
#' for plotting. The function assumes that the provided objects have no overlap.
#' For example, a valid argument set would have two time series with periods from Jan-Dec 2015
#' and Jan-Dec 2016. An invalid set would be two time series t1 and t2 with periods from 
#' Jan-Dec 2015 and Aug 2015-Dec 2016 respectively. In that case, there is overlap between 
#' t1 and t2. The return value will depend on the order in which the arguments are provided. 
#' If the function call is tsCombine(t1, t2), the overlapping portion of t1 and t2 
#' (Aug-Dec 2015 in this example), would have values from t1 as long as they are not NA. 
#' If the call is tsCombine(t2, t1), it will have values from t2 as long as they are not NA. 
#' 
#' @examples 
#' tsCombine(window(AirPassengers, end = c(1951, 12)), window(AirPassengers, start = c(1952, 1)))
tsCombine <- function(...) {
   combined_df <- ts.union(..., dframe = TRUE)
   combined_ts <- ts.union(..., dframe = FALSE)
   coalesced <- apply(combined_df, 1, function(x) {
      if (all(is.na(x))) 
         return(NA)
      else return(x[min(which(!is.na(x)))])
   })
   ret <- ts(coalesced, start = start(combined_ts), frequency = frequency(combined_ts))
   return(ret)
}