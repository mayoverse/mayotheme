#' Generate Mayo Bootsrap
#'
#' Used to compile a custom Mayo Clinic based bootstrap.css


compile_css <- function() {
  sass::sass(
    sass::sass_file("scss/mayotheme.scss"),
    output = "inst/resources/css/bootstrap.css",
    options = sass::sass_options(output_style = "compressed")
  )
}
