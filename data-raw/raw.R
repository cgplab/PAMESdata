library(dplyr)
load("data-raw/cpg_islands_indexes.rda")
all_sites <- readRDS("data-raw/cpg_sites.RDS")
tumors <- sort(names(all_sites))
tumor <- "BRCA"
for (tumor in tumors){
    hyper_sites <- all_sites[[tumor]] %>%
        dplyr::filter(type=="hyper" & n <= 10) %>%
        dplyr::select(index) %>%
        unlist(use.names=F)
    hypo_sites <- all_sites[[tumor]] %>%
        filter(type=="hypo" & n <= 10) %>%
        select(index) %>%
        unlist(use.names=F)
    sites <- list(hyper=hyper_sites, hypo=hypo_sites)
    assign(sprintf("%s_sites", tumor), sites)

    assign(sprintf("%s_islands", tumor), cpg_islands_indexes[[tumor]])
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
