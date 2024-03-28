#'
#' Retrieve various available information from Laws.Africa
#'
#' @section On Works: #' A *Work* is a piece of legislation, such as an act,
#'   regulation or by-law. A work may be amended over time and may even have its
#'   title changed. A work is uniquely identified by a work FRBR URI which never
#'   changes.
#'
#' @param base_url Base URL for the Laws.Africa API. Current default set to
#'   https://api.laws.africa/v3/.
#' @param flatten Logical. Should the output JSON be flattened into a tibble.
#'   Defeault is TRUE.
#' @param area A character identifier for an area of interest for which
#'   information is to be retrieved from the Laws.API. For countries, this will
#'   be an alpha-2 ISO 3166-1 country code. For other areas, this can take
#'   many formats.
#
#' @returns If `flatten = TRUE`, a named list of two tibbles the first of which
#'   is for *countries* information and the second for *localities* information.
#'   Otherwise, a list output created from the JSON output of the request.
#'
#' @examples
#' if (Sys.getenv("LAWS_AFRICA_TOKEN") != "") al_get_areas()
#'
#' @rdname al_get
#' @export
#'
al_get_areas <- function(base_url = "https://api.laws.africa/v3/",
                         flatten = TRUE) {
  ## Check token ----
  if (Sys.getenv("LAWS_AFRICA_TOKEN") == "")
    stop("Token is missing. Set token with `set_api_token()` and try again.")

  ## Setup request ----
  req <- httr2::request(base_url) |>
    httr2::req_url_path_append("countries") |>
    httr2::req_headers(
      Accept = "application/json",
      Authorization = paste0("Token ", Sys.getenv("LAWS_AFRICA_TOKEN")),
      .redact = "Authorization"
    )

  ## Perform request ----
  resp <- req |>
    httr2::req_perform() |>
    httr2::resp_body_json() |>
    (\(x) x$result)()

  ## Structure response ----
  if (flatten) resp <- al_structure_areas(resp)

  ## Return response ----
  resp
}


#'
#' @rdname al_get
#' @export
#'
al_get_works <- function(area,
                         base_url = "https://api.laws.africa/v3/",
                         flatten = TRUE) {
  ## Check token ----
  if (Sys.getenv("LAWS_AFRICA_TOKEN") == "")
    stop("Token is missing. Set token with `set_api_token()` and try again.")

  ## Setup request ----
  req <- httr2::request(base_url) |>
    httr2::req_url_path_append("akn", area) |>
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
