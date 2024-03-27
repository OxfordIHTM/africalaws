#'
#' Retrieve countries
#'
#' @param base_url Base URL for the Laws.Africa API. Current default set to
#'   https://api.laws.africa/v3/.
#' @param flatten Logical. Should the output JSON be flattened into a tibble.
#'   Defeault is TRUE.
#'
#' @returns If `flatten = TRUE`, a named list of two tibbles the first of which
#'   is for *countries* information and the second for *localities* information.
#'   Otherwise, a list output created from the JSON output of the request.
#'
#' @examples
#' if (Sys.getenv("LAWS_AFRICA_TOKEN") != "") al_get_countries()
#'
#' @rdname al_get
#' @export
#'
al_get_countries <- function(base_url = "https://api.laws.africa/v3/",
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
  if (flatten) resp <- al_structure_countries(resp)

  ## Return response ----
  resp
}
