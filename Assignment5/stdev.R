# Standard Deviation (population standard deviation, as in assignment pseudocode)
stdev <- function(data) {
  if (!is.numeric(data)) stop("data must be numeric")
  if (length(data) == 0) stop("data must not be empty")
  mean_value <- sum(data) / length(data)
  diff_values <- numeric(length(data))
  for (i in seq_along(data)) {
    diff_values[i] <- data[i] - mean_value
  }
  squared_diff <- numeric(length(diff_values))
  for (i in seq_along(diff_values)) {
    squared_diff[i] <- diff_values[i] * diff_values[i]
  }
  variance <- sum(squared_diff) / length(squared_diff)
  standard_deviation <- sqrt(variance)
  return(standard_deviation)
}
