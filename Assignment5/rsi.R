# Relative Strength Index (RSI) using Wilder's smoothing method.
rsi <- function(data, period) {
  if (!is.numeric(data)) stop("data must be numeric")
  if (length(period) != 1 || is.na(period) || period < 1 ||
      period != as.integer(period)) stop("period must be a positive integer")
  period <- as.integer(period)
  n <- length(data)
  rsi_values <- rep(NA_real_, n)
  if (n <= period) return(rsi_values)

  diff_values <- diff(data)
  gains <- numeric(length(diff_values))
  losses <- numeric(length(diff_values))
  for (i in seq_along(diff_values)) {
    if (diff_values[i] > 0) {
      gains[i] <- diff_values[i]
      losses[i] <- 0
    } else {
      gains[i] <- 0
      losses[i] <- abs(diff_values[i])
    }
  }

  avg_gain <- sum(gains[1:period]) / period
  avg_loss <- sum(losses[1:period]) / period
  if (avg_loss == 0 && avg_gain == 0) rsi_values[period + 1] <- 50
  else if (avg_loss == 0) rsi_values[period + 1] <- 100
  else rsi_values[period + 1] <- 100 - (100 / (1 + avg_gain / avg_loss))

  if (n > period + 1) {
    for (i in (period + 2):n) {
      j <- i - 1
      avg_gain <- (avg_gain * (period - 1) + gains[j]) / period
      avg_loss <- (avg_loss * (period - 1) + losses[j]) / period
      if (avg_loss == 0 && avg_gain == 0) rsi_values[i] <- 50
      else if (avg_loss == 0) rsi_values[i] <- 100
      else rsi_values[i] <- 100 - (100 / (1 + avg_gain / avg_loss))
    }
  }
  return(rsi_values)
}
