# Write a program for measuring similarity among documents and detecting passages which have been reused
library(textreuse)
minhash<-minhash_generator(200,seed=235)
ats<-TextReuseCorpus(dir="Path/to/p4files",tokenizer = tokenize_ngrams,n=5,minhash_func = minhash) 
buckets<-lsh(ats,bands=50,progress=interactive()) 
candidates<-lsh_candidates(buckets)
scores<-lsh_compare(candidates,ats,jaccard_similarity,progress=FALSE) 
scores
color<-c("red","green","blue","orange","yellow","pink") 
barplot(as.matrix(scores),col=color)
