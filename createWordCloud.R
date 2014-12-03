# Function to create a word cloud

createWordCloud = function(corpus, .progress='none') {
    require(wordcloud)
    require(tm)
    require(plyr)
    progress.bar = create_progress_bar(.progress)
    progress.bar$init(6)
    doc.vec = VectorSource(corpus)
    progress.bar$step()
    doc.corpus = Corpus(doc.vec)
    progress.bar$step()
    doc.corpus <- tm_map(doc.corpus, content_transformer(tolower))
    progress.bar$step()
    doc.corpus <- tm_map(doc.corpus, removePunctuation)
    progress.bar$step()
    doc.corpus <- tm_map(doc.corpus, removeNumbers)
    progress.bar$step()
    doc.corpus <- tm_map(doc.corpus, removeWords, stopwords("english"))
    progress.bar$step()
    cloud = wordcloud(corpus, scale=c(5,0.5), max.words=100, random.order=FALSE, rot.per=0.35, use.r.layout=FALSE, colors=brewer.pal(8, "Dark2"))
    return(cloud)
}