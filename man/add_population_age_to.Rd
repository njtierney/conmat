% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/add_population_age_to.R
\name{add_population_age_to}
\alias{add_population_age_to}
\title{Add the population distribution for contact ages.}
\usage{
add_population_age_to(contact_data, population = get_polymod_population())
}
\arguments{
\item{contact_data}{contact data}

\item{population}{Default: get_polymod_population()}
}
\value{
data frame
}
\description{
If 'polymod' then use the participant-weighted average of polymod
country/year distributions
}
\examples{
\dontrun{
if (interactive()) {
  # EXAMPLE1
}
}
}
