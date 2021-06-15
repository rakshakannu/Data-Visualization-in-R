library(wordcloud2)
library(readr)
library(dplyr)
library(e1071)
library(mlbench)

library(tm)
library(SnowballC)
library("wordcloud")
library("RColorBrewer")

t1 <- read_csv("Downloads/biden_data.csv")
glimpse(t1)  

# Create corpus
corpus = Corpus(VectorSource(t1$text))
corpus = tm_map(corpus, PlainTextDocument)
corpus = tm_map(corpus, tolower)
corpus = tm_map(corpus, removePunctuation)
corpus = tm_map(corpus, removeWords, c("cloth", stopwords("english")))
corpus = tm_map(corpus, stemDocument)
corpus = tm_map(corpus, stripWhitespace)

#Create Document Term Matrix
DTM <- TermDocumentMatrix(corpus)
mat <- as.matrix(DTM)
f <- sort(rowSums(mat),decreasing=TRUE)
dat <- data.frame(word = names(f),freq=f)
head(dat, 5)

#WordCloud 1
set.seed(100)
wordcloud(words = dat$word, freq = dat$freq, random.order=TRUE)

#WordCloud 2
set.seed(100)
wordcloud(words = dat$word, freq = dat$freq, random.order=FALSE)

#WordCloud 3
set.seed(100)
wordcloud(words = dat$word, freq = dat$freq, min.freq = 15, max.words=2000, random.order=FALSE, rot.per=0.30, colors=brewer.pal(8, "Spectral"), shape = 'star')

wordcloud2(data = dat, size = 2, shape = 'diamond')

