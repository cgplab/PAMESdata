library(dplyr)
all_sites <- readRDS("data-raw/cpg_sites.RDS")
all_islands <- readRDS("data-raw/cpg_islands.RDS")
tumors <- sort(names(sites))
for (tumor in tumors){
    hyper <- all_sites[[tumor]] %>%
        filter(type=="hyper" & n <= 10) %>%
        select(index) %>%
        unlist(use.names=F)
    hypo <- all_sites[[tumor]] %>%
        filter(type=="hypo" & n <= 10) %>%
        select(index) %>%
        unlist(use.names=F)
    site <- list(hyper, hypo)
    assign(sprintf("%s_sites", tumor), site)

    hyper <- all_islands[[tumor]] %>%
        filter(type=="hyper" & n <= 10) %>%
        select(index) %>%
        unlist(use.names=F)
    hypo <- all_islands[[tumor]] %>%
        filter(type=="hypo" & n <= 10) %>%
        select(index) %>%
        unlist(use.names=F)
    site <- list(hyper, hypo)
    assign(sprintf("%s_islands", tumor), site)
}
devtools::use_data(overwrite=T,
    BLCA_sites,
    BRCA_sites,
    COAD_sites,
    ESCA_sites,
    HNSC_sites,
    KIRC_sites,
    KIRP_sites,
    LIHC_sites,
    LUAD_sites,
    LUSC_sites,
    PAAD_sites,
    PRAD_sites,
    THCA_sites,
    UCEC_sites,
    BLCA_islands,
    BRCA_islands,
    COAD_islands,
    ESCA_islands,
    HNSC_islands,
    KIRC_islands,
    KIRP_islands,
    LIHC_islands,
    LUAD_islands,
    LUSC_islands,
    PAAD_islands,
    PRAD_islands,
    THCA_islands,
    UCEC_islands
)
