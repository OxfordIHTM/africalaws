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
