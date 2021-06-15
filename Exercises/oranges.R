Orange

str(Orange)

summary(Orange)

plot(Orange)

hist(Orange$age, main="Histogram",xlab='age',col="red",ylim=c(0,30))

plot(Orange$circumference, mtcars$mpg, main="Scatterplot Example",
     xlab="Orange circumference ", ylab="Miles Per Gallon ", pch=1,
     col=c("blue", "green"))

counts <- table(Orange$age)
barplot(counts, main="Orange",xlab="age",horiz=TRUE)

counts <- table(Orange$age, Orange$circumference)
barplot(counts, main="Oranges",
        xlab="Age", col=c("darkblue","red"),
        legend = rownames(counts))

boxplot(age~circumference,data=Orange, main="Oranges",
        xlab="age", ylab="oranges")
