library(tm)
docs <- Corpus(DirSource("../data/en_US/"))

toSpace <- content_transformer(function(x, pattern) {return (gsub(pattern, " ", x))})
docs <- tm_map(docs, toSpace, "-")
