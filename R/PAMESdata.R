#' Precomputed sets of informative CpG sites and CpG islands
#'
#' Exploiting pulic data from from \href{https://portal.gdc.cancer.gov/}{TCGA},
#' we computed sets of informative
#' CpG sites and CpG islands for 14 cancer types.
#'
#' After gathering data from different samples (see <paper waiting for publication>
#' for details) into a single matrix, CpG sites sets were created using
#' \code{\link[PAMES]{select_informative_sites}}.
#' To create CpG islands sets, the same matrixes were first remapped to CpG
#' islands using \code{\link[PAMES]{map_to_islands}} and then processed with
#' \code{\link[PAMES]{select_informative_islands}}.
#'
#' @docType package
#' @name PAMESdata
#' @seealso \url{https://github.com/cgplab/PAMES}
NULL
