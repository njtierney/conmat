#' Add the population distribution for contact ages.
#'
#' If 'polymod' then use the participant-weighted average of polymod
#' country/year distributions
#' @param contact_data contact data
#' @param population Default: get_polymod_population()
#' @return data frame
#' @examples
#' \dontrun{
#' if (interactive()) {
#'   # EXAMPLE1
#' }
#' }
#' @export
add_population_age_to <- function(contact_data, population = get_polymod_population()) {

  # get function to interpolate population age distributions to 1y bins
  age_population_function <- get_age_population_function(population)

  # add the population in each 'to' age for the survey context
  contact_data %>%
    dplyr::mutate(
      pop_age_to = age_population_function(age_to)
    ) %>%
    dplyr::group_by(age_from) %>%
    # normalise to get a relative population
    dplyr::mutate(
      pop_age_to = pop_age_to / sum(pop_age_to)
    ) %>%
    dplyr::ungroup()
  
}
