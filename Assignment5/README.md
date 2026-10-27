# BDA400 Assignment 5 — Technical Analysis Using R

## Contents
This folder contains separate base-R implementations for the nine functions required in Assignment 5:

- `sma.R` — Simple Moving Average
- `ema.R` — Exponential Moving Average
- `macd.R` — MACD line, signal line, and histogram
- `stdev.R` — population standard deviation, using the assignment pseudocode
- `linreg.R` — linear regression slope, intercept, and predicted values
- `rsi.R` — Relative Strength Index using Wilder's smoothing
- `stoch_rsi.R` — Stochastic RSI %K and %D
- `crossover.R` — crossover labels (`Up`, `Down`, `None`) as described in the assignment pseudocode
- `crossunder.R` — crossunder labels (`True`, `False`) as described in the assignment pseudocode
- `test_all.R` — simple example run and basic checks

## Run in RStudio
1. Download or clone the `TechnicalAnalysis` repository.
2. Open RStudio and set the working directory to this `Assignment5` folder.
3. Open `test_all.R`.
4. Click **Source**, or run `source("test_all.R")` in the Console.
5. Review the output and resolve any errors before submission.

No technical-analysis or indicator libraries are used. The scripts use base R only.

## Important
The assignment pseudocode specifies different output conventions for the crossover functions. This implementation follows the supplied pseudocode: `crossover()` returns `Up`, `Down`, or `None`; `crossunder()` returns `True` or `False`. Please compare the scripts with any instructor-provided test file before final submission.

## Student details
Update the PDF cover page with your full name and the URL of your GitHub repository. Submit the PDF and repository work through the course LMS.
