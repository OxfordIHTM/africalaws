#'
#' Structure list outputs
#'
#' @param areas_list A countries list output produced from a request for
#'   countries JSON to the Laws.Africa API.
#' @param works_list A works list outputs produced from a request for works
#'   JSON to the Laws.Africa API.
#'
#' @returns A named list of two tibbles the first of which is for *countries*
#'   information and the second for *localities* information.
#'
#' @rdname al_structure
#' @export
#'
al_structure_areas <- function(areas_list) {
  ## Flatten list ----
  countries_df <- dplyr::bind_rows(areas_list)

  ## Main unit ----
  countries_info <- countries_df |>
    dplyr::select(.data$code, .data$name) |>
    tibble::tibble(
      lapply(countries_df$links, dplyr::bind_cols) |> dplyr::bind_rows()
    )

  ## Process localities ----
  localities_info <- countries_df$localities |>
    lapply(FUN = dplyr::bind_cols) |>
    dplyr::bind_rows()

  ## Return countries and localities info ----
  list(
    countries = countries_info,
    localities = localities_info
  )
}

#'
#' @rdname al_structure
#' @export
#'
al_structure_work <- function(works_list) {
  works_list <- works_list[[1]]

  set1 <- dplyr::bind_cols(works_list[1:16])

  set2 <- tibble::as_tibble_col(
    works_list[17], column_name = "publication_document"
  )

  set3 <- dplyr::bind_cols(works_list[18:26])

  set4 <- tibble::as_tibble_col(works_list[27], column_name = "points_in_time")

  set5 <- tibble::as_tibble_col(works_list[27], column_name = "amendments")

  set6 <- tibble::as_tibble_col(works_list[29], column_name = "work_amendments")

  set7 <- dplyr::bind_cols(works_list[30:32])

  set8 <- works_list[33] |>
    tibble::as_tibble_col(column_name = "taxonomy_topics")

  set9 <- dplyr::bind_cols(works_list[34])

  set10 <- tibble::as_tibble_col(
    works_list[35], column_name = "custom_properties"
  )

  set11 <- dplyr::bind_cols(works_list[36])

  set12 <- tibble::as_tibble_col(
    works_list[37], column_name = "amendments_made"
  )

  set13 <- dplyr::bind_cols(works_list[38]) |>
    tibble::as_tibble_col(column_name = "enacted_as")


  set14 <- tibble::as_tibble_col(
    works_list[39], column_name = "repeals_made"
  )

  set15 <- tibble::as_tibble_col(
    works_list[40], column_name = "commencements_made"
  )

  set16 <- tibble::as_tibble_col(works_list[41], column_name = "links")

  set17 <- tibble::as_tibble_col(works_list[42], column_name = "disclaimer")

  set18 <- tibble::as_tibble_col(works_list[43], column_name = "aliases")

  tibble::tibble(
    set1, set2, set3, set4, set5, set6, set7, set8, set9, set10, set11, set12,
    set13, set14, set15, set16, set17, set18,
    .name_repair = "unique"
  )
}


#'
#' @rdname al_structure
#' @export
#'
al_structure_works <- function(works_list) {
  lapply(
    X = works_list,
    FUN = al_structure_work
  ) |>
    dplyr::bind_rows()
}
