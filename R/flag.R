#' insert a flag
#'
#' @param country a character, the [ISO 3166-1-alpha-2 country code](https://www.iso.org/obp/ui/#search/code/)
#' @param size an integer, the value of the `font-size` CSS parameter in pixels,
#' @param squared a logical, if FALSE (the default) use the flags with 4x3 ratio, else 1x1
#' @param width a character, the value of the `width` CSS parameter
#'
#' @importFrom htmltools span htmlDependency attachDependencies
#'
#' @export
#'
#' @examples
#'
#' flag("FR")
#'
#' flag("US", squared = TRUE)
#'
#' flag("US", squared = TRUE, width = "300px")

flag <- function(country, size = 30, squared = FALSE, width = NULL) {

  flagClass <- paste0("-", tolower(country))
  flagClass <- paste0("flag-icon", c("", flagClass), collapse = " ")
  if (squared) {
    flagClass <- paste(flagClass, "flag-icon-squared")
  }

  flagStyle <- paste0("font-size: ", size, "px;")
  if (!is.null(width)) {
    flagStyle <- paste0(flagStyle, "width: ", width, ";")
  }

  flagTag <- span(class = flagClass, style = flagStyle)

  dep <- htmlDependency(
    name = "flag-icon-css",
    version = "3.0.0",
    src = c(file = "www/flag-icon-css"),
    stylesheet = "css/flag-icon.min.css",
    package = "shinyflags"
  )

  attachDependencies(flagTag, dep)
}

#' list all available flags
#'
#' @export
flags_list <- function() {
  flags <- list.files(
    system.file("www", "flag-icon-css", "flags", "4x3", package = "shinyflags")
  )

  gsub("\\.svg", "", flags)
}
