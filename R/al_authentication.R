#'
#' Set a Laws.Africa API token
#'
#' @param api_token Laws.Africa user account API token.
#'
#' @returns User's API token recorded into system environment as
#'   *LAWS_AFRICA_TOKEN*.
#'
#' @examples
#' if (FALSE) {
#'   set_api_token(api_token = "abcd")
#' }
#'
#' @rdname al_authenticate
#' @export
#'

set_api_token <- function(api_token = NULL) {
  if (is.null(api_token))
    api_token <- askpass::askpass(
      prompt = "Please enter your API token"
    )

  Sys.setenv("LAWS_AFRICA_TOKEN" = api_token)
}
