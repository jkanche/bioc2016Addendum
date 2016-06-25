## the cgi data
library(AnnotationHub)

ah <- AnnotationHub()
cgi_gr <- ah[["AH5086"]]
cgi_gr <- keepSeqlevels(cgi_gr, paste0("chr",c(10,11,20)))
save(cgi_gr, file="data/cgi_gr.rda")

## the expression data
destfile <- paste0(tempfile(),".rda")
download.file("ftp://ftp.cbcb.umd.edu/pub/data/hcorrada/apData_gpl570.rda", destfile=destfile)
load(destfile)

pd <- pData(apData_gpl570)
fac <- paste0(pd$Tissue,":",pd$SubType)
lvs <- c("colon:normal","lung:normal","breast:normal","breast:tumor")

keep <- fac %in% lvs
eset <- apData_gpl570[,keep]
pd <- pData(eset)
indices <- split(seq_len(ncol(mat)), paste0(pd$Tissue,":",pd$SubType))
bcode <- mat > 2.54
ps <- sapply(indices, function(ind) rowMeans(bcode[,ind]))

tmp <- strsplit(colnames(ps), split = ":")
tissue <- sapply(tmp, `[[`, 1)
subtype <- sapply(tmp, `[[`, 2)
newpd <- data.frame(tissue=tissue, subtype=subtype)
rownames(newpd) <- colnames(ps)
newpd <- AnnotatedDataFrame(newpd)

bcode_eset <- ExpressionSet(featureData=featureData(eset),
                          phenoData=newpd,
                          assayData=ps,
                          annotation=annotation(eset))

save(bcode_eset, "data/bcode_eset.rda")
