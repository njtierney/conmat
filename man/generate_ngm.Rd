% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/generate-ngm.R
\name{generate_ngm}
\alias{generate_ngm}
\title{Get next generation contact matrices}
\usage{
generate_ngm(state_name = NULL, lga_name = NULL, age_breaks, R_target)
}
\arguments{
\item{state_name}{target Australian state name in abbreviated form, such as "QLD", "NSW", or "TAS"}

\item{lga_name}{target Australian local government area (LGA) name, such as "Fairfield (C)".  See
\code{\link[=abs_lga_lookup]{abs_lga_lookup()}} for list of lga names}

\item{age_breaks}{vector depicting age values with the highest age depicted as \code{Inf}. For example, c(seq(0, 85, by = 5), Inf)}

\item{R_target}{target reproduction number}
}
\description{
Get next generation contact matrices
}
\examples{
# don't run as both together takes a long time to run
\dontrun{
ngm_nsw <- generate_ngm(
  state_name = "NSW",
  age_breaks = c(seq(0, 85, by = 5), Inf),
  R_target = 1.5
)
ngm_fairfield <- generate_ngm(
  lga_name = "Fairfield (C)",
  age_breaks = c(seq(0, 85, by = 5), Inf),
  R_target = 1.5
)
}
}
