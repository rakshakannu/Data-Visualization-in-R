#A treemap is a space-filling visualization of hierarchical structures. 
install.packages("treemap")

library("treemap")
library("tidyverse")

library(RColorBrewer)
data <- read.csv("post-data.txt")
head(data)


#index-vector of column names in dtf 
#       that specify the aggregation indices.
#vSize-name of the column in dtf that specifies 
#     the sizes of the rectangles
#vColor&type-determines the colors of the rectangles
#      "value", "comp", "dens", and "manual"
treemap(data, index="category", vSize="views", 
        vColor="comments", type="value", 
        palette="RdYlBu")

#Use RColorBrewer to change the palette to RdYlBu
treemap(data, index="category", vSize="views", 
        vColor="comments", type="manual", 
        palette="RdYlBu")

#Use manual
treemap(data, index="category", vSize="views", 
        vColor="comments", type="manual", 
        palette="Blues",
        algorithm = "squarified",
        title="Tree map of Views",
        title.legend = "COMMENTS")

