make_sample <- function(orig, dest) {
  unlink(dest,force = T)
  ocon <- file(orig, open = "rt", encoding = "UTF-8")
  on.exit( close(ocon), add = T)
  dcon <- file(dest, open = "wta", encoding = "UTF-8")
  on.exit( close(dcon), add = T)
  
  current <- "OK"
  
  while (length(current) > 0) {
    current <- readLines(ocon,1)
    if (rbinom(1,1,.025) == 1) write(current, dcon)
  }
  
  return(TRUE)
}

set.seed("20170528")
make_sample("../data/en_US/en_US.twitter.txt", "../data/en_US_sample/en_US.twitter.txt")
make_sample("../data/en_US/en_US.blogs.txt", "../data/en_US_sample/en_US.blogs.txt")
make_sample("../data/en_US/en_US.news.txt", "../data/en_US_sample/en_US.news.txt")


