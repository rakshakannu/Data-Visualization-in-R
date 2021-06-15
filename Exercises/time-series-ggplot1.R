library(ggplot2)
library(tidyr)
library(dplyr)
theme_set(theme_minimal())


"
economics dataset

A data frame with 574 rows and 6 variables:

date - Month of data collection
pce - personal consumption expenditures, in billions of dollars
pop - total population, in thousands
psavert - personal savings rate
uempmed - median duration of unemployment, in weeks
unemploy - number of unemployed in thousands
"
# Demo dataset
head(economics)


# Basic line plot- bivariate  
ggplot(data = economics, aes(x = date, y = pop))+
   geom_line(color = "#00AFBB", size = 2)

# Plot a subset of the data
ss <- subset(economics, date > as.Date("2006-1-1"))
ggplot(data = ss, aes(x = date, y = pop)) +
  geom_line(color = "#FC4E07", size = 2)

ggplot(data = economics, aes(x = date, y = pop)) +
  geom_line(aes(size = unemploy/pop), color = "#FC4E07")

#Plot trivariate time series data
df <- economics %>%
  select(date, psavert, uempmed) %>%
  gather(key = "variable", value = "value", -date)
head(df, 3)
tail(df,3)


ggplot(df, aes(x = date, y = value)) + 
  geom_line(aes(color = variable), size = 1) +
  scale_color_manual(values = c("#00AFBB", "#E7B800")) +
  theme_minimal()

# Multiple line plot
ggplot(df, aes(x = date, y = value)) + 
  geom_line(aes(color = variable), size = 1) +
  scale_color_manual(values = c("#00AFBB", "#E7B800")) +
  theme_minimal()


# Base plot with date axis
p <- ggplot(data = economics, aes(x = date, y = psavert)) + 
  geom_line(color = "#00AFBB", size = 1)
p

# Set axis limits c(min, max)
min <- as.Date("2002-1-1")
max <- as.Date("2005-1-1")
p + scale_x_date(limits = c(min, max))

# Format : month/year
p + scale_x_date(date_labels = "%b/%Y")

p + stat_smooth(
  color = "#FC4E07", fill = "#FC4E07",
  method = "loess"
)

# Area plot
ggplot(df, aes(x = date, y = value)) + 
  geom_area(aes(color = variable, fill = variable), 
            alpha = 0.5, position = position_dodge(0.8)) +
  scale_color_manual(values = c("#00AFBB", "#E7B800")) +
  scale_fill_manual(values = c("#00AFBB", "#E7B800"))



