#'
#' Structure countries output
#'
#' @param countries_list A countries list output produced from a request for
#'   countries JSON to the Laws.Africa API.
#'
#' @returns A named list of two tibbles the first of which is for *countries*
#'   information and the second for *localities* information.
#'
#' @rdname al_structure
#' @export
#'
al_structure_countries <- function(countries_list) {
  ## Flatten list ----
  countries_df <- dplyr::bind_rows(countries_list)

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
#'
#'
al_structure_works <- function(works_list) {
  set1 <- dplyr::bind_cols(works_list[1:16])

  set2 <- dplyr::bind_cols(works_list[17]) |>
    dplyr::rename_with(.fn = ~paste0("publication_document_", .x))

  set3 <- dplyr::bind_cols(works_list[18:26])

  set4 <- dplyr::bind_rows(works_list[27]) |>
    (\(x)
      {
        tibble::tibble(
          date = x$date,
          dplyr::bind_rows(x$expressions)
        )
      }
    )() |>
    dplyr::rename_with(.fn = ~paste0("points_in_time_", .x))

  set5 <- dplyr::bind_rows(works_list[28]) |>
    dplyr::rename_with(.fn = ~paste0("amendments_", .x))

  set6 <- dplyr::bind_rows(works_list[29]) |>
    dplyr::rename_with(.fn = ~paste0("work_amendments_", .x))

  set7 <- dplyr::bind_cols(works_list[30:32])


}
