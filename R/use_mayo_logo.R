#' Use Mayo Logo
#'
#' Returns location or data uri of a Mayo logo
#'
#' @param logo Logo type
#' @param data_uri Logical.  Should a data uri be returned?
#'     If FALSE, file location is returned.
#' @export

use_mayo_logo <- function(logo = c("black", "white", "secondary"),
                          data_uri = FALSE) {
  logo <- match.arg(logo)
  logo <- paste0("logo_", logo, ".png")
  res <- system.file(paste0("resources/images/", logo), package = "mayotheme")
  if (data_uri) {
    res <- knitr::image_uri(res)
  }
  res
}
