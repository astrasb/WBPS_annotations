##Geneious_to_WBPS is a script that will parse a .gff file exported from Geneious to identify updated gene annotations and manually curate a WBPS .gff3 file. 

library(tidyverse)
library(magrittr)
library(rtracklayer)
library(biomaRt)

# Import GFF3 data from WBPS version
WBPS_gff <- readGFF("GFF3s/strongyloides_stercoralis.PRJEB528.WBPS16.annotations.gff3",
               version = 3)
WBPS_tbl <- as_tibble(WBPS_gff)


# Import GFF file from Geneious, loading just the manual edits
Edits_filter <- list(source = "Hallem_Lab")
Gen_gff <- readGFF("GFF3s/strongyloides_stercoralis.PRJEB528.WBPS16.genomic ASBedits.gff",
                   filter = Edits_filter)
Gen_tbl <- as_tibble(Gen_gff)

# Locate elements in WBPS that will require updating


# Export GFF3 file
rtracklayer::export.gff3(Gen_gff , 
                         "test.gff3",
                         source = "HallemLabAnnotations")
