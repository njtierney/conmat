% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/age-population-year.R
\name{age_population}
\alias{age_population}
\title{Get cleaned population data with lower and upper limits of age.}
\usage{
age_population(
  data,
  location_col = NULL,
  location = NULL,
  age_col,
  year_col = NULL,
  year = NULL
)
}
\arguments{
\item{data}{dataset containing information on population for a given age,
country, and year}

\item{location_col}{bare variable name for the column with location
information}

\item{location}{character vector with location names}

\item{age_col}{bare variable name for the column with age information}

\item{year_col}{bare variable name for the column with year information}

\item{year}{numeric vector representing the desired year(s)}
}
\value{
tidy dataset with information on population of different age bands
}
\description{
This function helps clean up datasets of population data,
similar to \code{socialmixr::wpp_age()} or any given dataset with a structure
that has information on, population, location, age, and year.
}
\examples{
world_data <- socialmixr::wpp_age()
# Tidy data for multiple locations across different years
age_population(
data = world_data,
location_col = country,
location = c("Asia","Afghanistan"),
age_col = lower.age.limit,
year_col = year,
year = c(2010:2020)
)

# Tidy data for a given location irrespective of year
age_population(
 data = world_data,
location_col = country,
 location = "Afghanistan",
 age_col = lower.age.limit
)

# Tidy datasets with age groups
population_age_groups <- abs_pop_age_lga_2020
age_population(
data = population_age_groups,
age_col = age_group,
year_col = year,
year = 2020
)

# Tidy datasets with numeric age
population_numeric_age <- abs_age_state("WA")
age_population(
data = population_numeric_age,
age_col = lower.age.limit,
year_col = year,
year = 2020
)

}
