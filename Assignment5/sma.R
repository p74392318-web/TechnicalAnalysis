# Simple Moving Average (SMA)
# Follows the assignment template: output has length length(data)-period+1.
sma <- function(data, period) {
  if (!is.numeric(data)) stop("data must be numeric")
  if (length(period) != 1 || is.na(period) || period < 1 ||
      period != as.integer(period)) stop("period must be a positive integer")
  period <- as.integer(period)
  n <- length(data)
  if (n < period) stop("Data length should be greater than or equal to the period")

  sma_values <- numeric(n - period + 1)
  for (i in seq_len(n - period + 1)) {
    current_window <- data[i:(i + period - 1)]
    sma_values[i] <- sum(current_window) / period
  }
  return(sma_values)
}
