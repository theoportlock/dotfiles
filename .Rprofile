## Never save workspace when quitting
q <- function(save = "no", ...) base::q(save = "no", ...)

## Avoid legacy behaviour surprises
options(
  stringsAsFactors = FALSE,
  repos = c(CRAN = "https://cloud.r-project.org")
)

## Make warnings immediate in scripts (useful for pipelines)
if (!interactive()) {
  options(warn = 1)
}
