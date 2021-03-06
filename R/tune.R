#' A placeholder function for argument values that are to be tuned.
#'
#' [tune()] is used when a parameter will be specified at a later date.
#'
#' @param id A single character value that can be used to differentiate
#'   parameters that are used in multiple places but have the same name, or if
#'   the user wants a note associated with the parameter.
#' @return A call object that echos the user input.
#' @examples
#' tune()
#' class(tune())
#' tune("your name here")
#'
#' # How `tune()` is used in practice:
#'
#' library(parsnip)
#' nearest_neighbor(
#'   neighbors = tune("K"),
#'   weight_func = tune(),
#'   dist_power = tune()
#' )
#' @seealso [tune_grid()], [tune_bayes()]
#' @export
tune <- function(id = "") {
  if (!is.character(id) || length(id) != 1) {
    stop("The `id` should be a single character string.", call. = FALSE)
  }
  if (is.na(id)) {
    stop("The `id` cannot be NA.", call. = FALSE)
  }
  if (id != "") {
    res <- rlang::call2("tune", id)
  } else {
    res <- rlang::call2("tune")
  }
  res
}
