# Exponential Moving Average (EMA)
# The first EMA value is the first input value, as specified in the assignment pseudocode.
ema <- function(data, period) {
  if (!is.numeric(data)) stop("data must be numeric")
  if (length(period) != 1 || is.na(period) || period < 1 ||
      period != as.integer(period)) stop("period must be a positive integer")
  if (length(data) < 1) stop("data must not be empty")
  period <- as.integer(period)
  multiplier <- 2 / (period + 1)
  ema_values <- numeric(length(data))

  for (i in seq_along(data)) {
    if (i == 1) {
      ema_values[i] <- data[i]
    } else {
      ema_values[i] <- (data[i] - ema_values[i - 1]) * multiplier +
        ema_values[i - 1]
    }
  }
  return(ema_values)
}
