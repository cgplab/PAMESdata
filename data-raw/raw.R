library(dplyr)
library(rlang)
library(tibble)

load("cpg_islands_indexes.rda")
all_sites <- readRDS("cpg_sites.RDS")
tumors <- sort(names(all_sites))
tumor <- "BRCA"
for (tumor in tumors){
    hyper_sites <- all_sites[[tumor]] %>%
        tibble::rownames_to_column("probe") %>%
        dplyr::filter(type=="hyper" & n <= 10) %>%
        dplyr::select(probe, index)
    hypo_sites <- all_sites[[tumor]] %>%
        tibble::rownames_to_column("probe") %>%
        filter(type=="hypo" & n <= 10) %>%
        select(probe, index)

    sites <- list(hyper=set_names(hyper_sites$index, hyper_sites$probe),
                  hypo=set_names(hypo_sites$index, hypo_sites$probe))
    assign(sprintf("%s_sites", tumor), sites)

    assign(sprintf("%s_islands", tumor), cpg_islands_indexes[[tumor]])
}
usethis::use_data(overwrite=TRUE,
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
