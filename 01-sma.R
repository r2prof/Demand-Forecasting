# Simple Moving Average----
#***************************************************************
# Step 01: Load necessary package----

# Run only if not already installed
# install.packages("TTR") 
# install.packages("forecast")
# install.packages("tibble")    # For clean table display
library(TTR)
library(tibble)
library(forecast)

#***************************************************************

# Step 02: Sample data----
data <- c(39, 62, 88, 109, 136, 148, 175, 202, 153, 129)

#***************************************************************

# Step 03: Compute 3-period Simple Moving Average----
ma_3 <- SMA(data, n = 3)

#***************************************************************

# Step 04: Remove NAs when computing y-axis limits----
y_range <- range(c(data, ma_3), na.rm = TRUE)

#***************************************************************

# Step 05: Plot original data and moving average----
plot(data, type = "o", col = "#1f77b4", pch = 16, lwd = 2, ylim = y_range,
     ylab = "Data", xlab = "Time", main = "3-Period Moving Average Forecast")

lines(ma_3, type = "o", col = "#ff7f0e", pch = 17, lwd = 2)

# Add a smaller and nicer legend
legend("topleft", 
       legend = c("Original Data", "MA(3)"), 
       col = c("#1f77b4", "#ff7f0e"), 
       pch = c(16, 17), 
       lty = 1, 
       lwd = 2,
       pt.cex = 0.9,      # point size in legend
       cex = 0.8,         # overall legend size
       bty = "n",         # no box around legend
       bg = rgb(1, 1, 1, 0.6))  # semi-transparent background

#***************************************************************

# Step 06: Display forecasted values as tibble----
forecast_tbl <- tibble(
    Time = 1:length(data),
    Original = data,
    MA_3 = round(ma_3, 2)  # round for cleaner display
)
print(forecast_tbl)

#***************************************************************