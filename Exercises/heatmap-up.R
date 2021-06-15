#two fundamentally different categories of heat maps: 
#  the cluster heat map and the spatial heat map


#National Basketball Association player stats
nba <- read.csv("ppg2008.csv")
nba

nba <- nba[order(nba$PTS),]
nba
row.names(nba) <- nba$Name
nba <- nba[,2:19]
nba_matrix <- data.matrix(nba)
nba_heatmap <- heatmap(nba_matrix, Rowv=NA, Colv=NA, 
                       col = cm.colors(256), scale="column", margins=c(5,10),
                       xlab = "NBA Player Stats",
                       ylab = "NBA Players",
                       main = "NBA Payer Stats in 2008")

#Change the heatmap colors to heat colors
nba_heatmap <- heatmap(nba_matrix, Rowv=NA, Colv=NA, col = heat.colors(256), 
                       scale="column", margins=c(5,10),
                       xlab = "NBA Player Stats",
                       ylab = "NBA Players",
                       main = "NBA Payer Stats in 2008")

library(viridis)
nba_heatmap <- heatmap(nba_matrix, Rowv=NA, col = viridis(25, direction = -1), 
                       scale="column", margins=c(5,10),
                       xlab = "NBA Player Stats",
                       ylab = "NBA Players",
                       main = "NBA Payer Stats in 2008")


