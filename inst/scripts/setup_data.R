library(AnnotationHub)

ah <- AnnotationHub()
cgi_gr <- ah[["AH5086"]]
cgi_gr <- keepSeqlevels(cgi_gr, paste0("chr",c(10,11,20)))
save(cgi_gr, file="data/cgi_gr.rda")
