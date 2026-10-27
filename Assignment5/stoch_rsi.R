# Stochastic RSI: %K is SMA of normalized RSI; %D is SMA of %K.
# Requires rsi.R and sma.R to be sourced first.
stoch_rsi <- function(data, period, k_period, d_period) {
  rsi_values <- rsi(data, period)
  if (length(k_period) != 1 || is.na(k_period) || k_period < 1 ||
      k_period != as.integer(k_period)) stop("k_period must be a positive integer")
  if (length(d_period) != 1 || is.na(d_period) || d_period < 1 ||
      d_period != as.integer(d_period)) stop("d_period must be a positive integer")

  k_period <- as.integer(k_period)
  d_period <- as.integer(d_period)
  valid_rsi <- rsi_values[!is.na(rsi_values)]
  k_values <- rep(NA_real_, length(rsi_values))
  if (length(valid_rsi) > 0) {
    min_rsi <- min(valid_rsi)
    max_rsi <- max(valid_rsi)
    if (max_rsi == min_rsi) {
      k_values[!is.na(rsi_values)] <- 0
    } else {
      k_values[!is.na(rsi_values)] <-
        (rsi_values[!is.na(rsi_values)] - min_rsi) / (max_rsi - min_rsi)
    }
  }

  k_line <- rep(NA_real_, length(k_values))
  if (length(k_values) >= k_period) {
    for (i in seq.int(k_period, length(k_values))) {
      window <- k_values[(i - k_period + 1):i]
      if (all(!is.na(window))) k_line[i] <- sum(window) / k_period
    }
  }
  d_line <- rep(NA_real_, length(k_line))
  if (length(k_line) >= d_period) {
    for (i in seq.int(d_period, length(k_line))) {
      window <- k_line[(i - d_period + 1):i]
      if (all(!is.na(window))) d_line[i] <- sum(window) / d_period
    }
  }
  return(list(k_line = k_line, d_line = d_line))
}
