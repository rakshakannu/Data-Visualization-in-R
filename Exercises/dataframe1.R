"A data frame is a table or a two-dimensional array-like structure in which
each column contains values of one variable and each row contains one set
of values from each column.
Following are the characteristics of a data frame.
??? The column names should be non-empty.
??? The row names should be unique.
??? The data stored in a data frame can be of numeric, factor or character
type.
??? Each column should contain same number of data items."

# Create the data frame.
emp.data <- data.frame(
  emp_id = c (1:5),
  emp_name = c("Ram","Alex","Raj","Ryan","siva"),
  salary = c(623.3,515.2,611.0,729.0,843.25),
  start_date = as.Date(c("2012-01-01", "2013-09-23", "2014-11-15", "2014-05-11","2015-03-27")),
  stringsAsFactors = FALSE
)
# Print the data frame.
print(emp.data)


# Get the structure of the data frame.
str(emp.data)

# Extract Specific columns.
result <- data.frame(emp.data$emp_name,emp.data$salary)
print(result)

# Extract first two rows.
result <- emp.data[1:2,]
print(result)

# Extract 3rd and 5th row with 2nd and 4th column.
result <- emp.data[c(3,5),c(2,4)]
print(result)

# Add the "dept" coulmn.
emp.data$dept <- c("IT","Operations","IT","HR","Finance")
v <- emp.data
print(v)

# Bind the two data frames.
emp.finaldata <- rbind(emp.data,emp.newdata)
print(emp.finaldata)

#check dataframe
print(is.data.frame(emp.data))
print(ncol(emp.data))
print(nrow(emp.data))

#null
sum(is.na(emp.data$start_date))
sum(is.na(emp.data))

#sort
print(emp.data[order(emp.data$salary),])

# Get the max salary from data frame.
sal <- max(emp.data$salary)
print(sal)

# Get the person detail having max salary.
retval <- subset(emp.data, salary == max(salary))
print(retval)

retval <- subset(emp.data, dept == "IT")
print(retval)

info <- subset(emp.data, salary > 600 & dept == "IT")
print(info)

retval <- subset(emp.data, as.Date(start_date) > as.Date("2014-01-01"))
print(retval)

write.csv(retval,"E:/COURSE/Data-Visualization/R-Lan/Prog/output.csv")
newdata <- read.csv("E:/COURSE/Data-Visualization/R-Lan/Prog/output.csv", nrows=2)
print(newdata)

data <- data.frame(
  EMPID = c ('E001','E002','E003','E004','E005','E006','E007','E008','E009','E010'),
  Gender = c('M','F','F','M','F','M','M','F','M','M'),
  Age = c(34,40,37,30,44,36,32,26,32,36),
  Sales = c(123,144,135,139,117,121,133,140,133,133),
  BMI = c('Normal','Overweight','Obesity','Underweight','Underweight','Normal','Obesity','Normal','Normal','Underweight'),
  Income = c(350,450,169,189,183,80,166,120,75,40),
  stringsAsFactors = FALSE
)

print(data)

hist(data)

as.numeric(as.character(data$BMI))
as.numeric(as.character(data$Gender))

dataf <- data$Sales
hist(dataf)

ggplot(data=data, aes(x=EMPID, y=Sales,group=1)) +
  geom_line(color="#aa0022", size=1.75) + ggtitle("LINE PLOT EMPID VS INCOME") 

hist(data$BMI, main="Histogram",xlab='MPG',col="blue")

ggplot(data=data, aes(BMI)) + 
  geom_histogram()

qplot(data$Sales,
      geom="histogram",
      binwidth = 5,  
      main = "Histogram for Age", 
      xlab = "Age",  
      fill=I("blue"), 
      col=I("red"), 
      alpha=I(.2),
      xlim=c(20,50))

plot(data,type = "o", col = "red", xlab = "EMPID", ylab = "Sales",
     main = "LINE CHART")

ggplot(data, aes(x=EMPID, y=Sales)) + geom_line(color="#69b3a2", size=2, alpha=0.9, linetype=)

counts <- table(data$Sales, data$Income)
barplot(counts, main="stacked bar plot",
        xlab="Sales vs Income", col=c("darkblue","red"),
        legend = rownames(counts))

hist(data$BMI, main="Histogram",xlab='MPG',col="blue",ylim=c(0,30))

ggplot(data, aes(x=BMI)) + geom_histogram()

boxplot(Income~Gender,data=data, main="BOXPLOT",
        xlab="Income", ylab="Boxplot")

p = plot_ly(data=data,
            x=~EMPID,
            y=~Sales,
            type = "scatter",
            mode = "markers",
            color = ~as.factor(BMI),
            marker = list(size=2)
)
p

