# Basic test script for Assignment 5.
# Run from the Assignment5 folder in RStudio.
source("sma.R")
source("ema.R")
source("macd.R")
source("stdev.R")
source("linreg.R")
source("rsi.R")
source("stoch_rsi.R")
source("crossover.R")
source("crossunder.R")

sample_data <- c(10, 12, 15, 20, 18, 22, 25, 24, 21)
cat("SMA:\n"); print(sma(sample_data, period = 3))
cat("EMA:\n"); print(ema(sample_data, period = 3))
cat("MACD:\n"); print(macd(sample_data, short_period = 3,
                            long_period = 5, signal_period = 2))
cat("Population standard deviation:\n"); print(stdev(sample_data))
cat("Linear regression:\n"); print(linreg(sample_data,
  regressionLength = 5, regressionOffset = 0))
cat("RSI:\n"); print(rsi(sample_data, period = 3))
cat("Stochastic RSI:\n"); print(stoch_rsi(sample_data,
  period = 3, k_period = 2, d_period = 2))

arr1 <- c(10, 12, 15, 20, 18, 22, 25, 24, 21)
arr2 <- c(18, 20, 22, 18, 15, 12, 10, 11, 13)
cat("Crossover:\n"); print(crossover(arr1, arr2))
cat("Crossunder:\n"); print(crossunder(arr1, arr2))

# Simple validation checks
stopifnot(length(sma(sample_data, 3)) == length(sample_data) - 2)
stopifnot(length(ema(sample_data, 3)) == length(sample_data))
stopifnot(abs(stdev(c(1, 2, 3)) - sqrt(2/3)) < 1e-10)
stopifnot(length(rsi(sample_data, 3)) == length(sample_data))
stopifnot(length(crossover(arr1, arr2)) == length(arr1))
stopifnot(length(crossunder(arr1, arr2)) == length(arr2))
cat("Basic checks completed. Review the output and fix any errors before submission.\\n")
