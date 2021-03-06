% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/apply_vaccination.R
\name{apply_vaccination}
\alias{apply_vaccination}
\title{Apply vaccination effects to next generation contact matrices}
\usage{
apply_vaccination(ngm, data, coverage_col, acquisition_col, transmission_col)
}
\arguments{
\item{ngm}{next generation matrices. See \code{\link[=generate_ngm]{generate_ngm()}} for creating next generation matrices of a state or a local government area for specific age groups}

\item{data}{data frame with location specific information on vaccine coverage, efficacy of acquisition/susceptibility and efficacy of transmission/infectiousness for the ordered age groups from lowest to highest of the next generation matrix}

\item{coverage_col}{bare variable name for the column with information on vaccine coverage by age groups}

\item{acquisition_col}{bare variable name for the column with information on efficacy of acquisition}

\item{transmission_col}{bare variable name for the column with information on efficacy of transmission}
}
\value{
list of contact matrices with reduction in transmission matching the next generation matrices
}
\description{
Applies vaccination effects to next generation matrices that leads to reduction of acquisition and transmission in each age group
}
\examples{

# example data frame with vaccine coverage, acquisition and transmission efficacy 
# of different age groups
vaccination_effect_example_data

# Generate next generation matrices
ngm_nsw <- generate_ngm(state_name = "NSW", 
                        age_breaks = c(seq(0, 80, by = 5),Inf),
                        R_target = 1.5
                        ) 
                        
# Apply vaccination effect to next generation matrices                       
ngm_nsw_vacc <- apply_vaccination(ngm = ngm_nsw,
                                  data = vaccination_effect_example_data,
                                  coverage_col = coverage,
                                  acquisition_col = acquisition,
                                  transmission_col = transmission)

}
