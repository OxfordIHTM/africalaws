#'
#' Get Works
#'
#' A *Work* is a piece of legislation, such as an act, regulation or by-law. A
#' work may be amended over time and may even have its title changed. A work is
#' uniquely identified by a work FRBR URI which never changes.
#'
#' @param country Two-letter ISO 3166-1 alpha-2 country code.
#' @param base_url Base URL for the Laws.Africa API. Current default set to
#'   https://api.laws.africa/v3/.
#' @param flatten Logical. Should the output JSON be flattened into a tibble.
#'   Defeault is TRUE.
#'
#' @returns If `flatten = TRUE`, a tibble of works from specified country.
#'   Otherwise, a list output created from the JSON output of the request.
#'
#' @examples
#' if (Sys.getenv("LAWS_AFRICA_TOKEN") != "") al_get_countries()
#'   al_get_works(country = "za-cpt")
#'
#' @rdname al_get
#' @export
#'
al_get_works <- function(country,
                         base_url = "https://api.laws.africa/v3/",
                         flatten = TRUE) {
  ## Check token ----
  if (Sys.getenv("LAWS_AFRICA_TOKEN") == "")
    stop("Token is missing. Set token with `set_api_token()` and try again.")

  ## Setup request ----
  req <- httr2::request(base_url) |>
    httr2::req_url_path_append("akn", country) |>
    httr2::req_headers(
      Accept = "application/json",
      Authorization = paste0("Token ", Sys.getenv("LAWS_AFRICA_TOKEN")),
      .redact = "Authorization"
    )

  ## Perform request ----
  resp <- req |>
    httr2::req_perform() |>
    httr2::resp_body_json() |>
    (\(x) x$results)()

  ## Structure response ----
  #if (flatten) resp <- al_structure_works(resp)

  ## Return response ----
  resp
}
