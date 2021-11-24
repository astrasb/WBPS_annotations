## WBPS_to_GenSAS GFF3 converter
# This code tidies WBPS GFF3 files for upload into GenSAS
# 

library(tidyverse)
library(magrittr)

# Import GFF3 data, then find columns containing no values and fill them. This fixes an issue with the WBPS GFF3 file where some of the rows have empty columns, which triggers a fault in the GenSAS GFF import process.
gff <- read.delim("strongyloides_stercoralis.PRJEB528.WBPS16.annotations.gff3", 
                  header=F, 
                  comment.char="#", 
                  colClasses = "character")
gff[gff==""]<-"."
write_tsv(gff, 
          "strongyloides_stercoralis.PRJEB528.WBPS16.annotations.GenSAS.gff3",
          col_names = F)

gene <- filter(gff, 
               V3 == "gene" | V3 == "transcript" | V3 == "mRNA" | V3 == "CDS" | V3 == "exon" | V3 == "five_prime_UTR" | V3 == "three_prime_UTR")

write_tsv(gene, 
          "strongyloides_stercoralis.PRJEB528.WBPS16.genepredictions.GenSAS.gff3",
          col_names = F)


