#' List available CSS files
#'
#' Print a list of availabe CSS files included in mayotheme
#'
#' @export
#' @examples
#' mayo_css_files()

mayo_css_files <- function() {
  css_dir <- system.file("resources/css", package = "mayotheme")
  css_file_names <- list.files(css_dir)
  css_files <- list.files(css_dir, full.names = TRUE)

  for (i in seq_along(css_files)) {
    print(usethis::ui_field(css_file_names[i]))
    con = file(css_files[i], "r")
    while ( TRUE ) {
      line = readLines(con, n = 1)

      if (startsWith(line, "/*!")) {
        # Do nothing
      } else if (startsWith(line, "===============") ) {
        break
      } else {
        print(usethis::ui_value(line))
      }
    }

    close(con)
  }

  invisible(gsub("\\.css$", "", css_file_names))
}
