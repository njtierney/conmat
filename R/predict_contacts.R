#' predict number of contacts in all combinations of the age groups specified
#' by age_breaks, given a model and a population distribution of the time/place
#' to predict to
#'
#' @param model PARAM_DESCRIPTION
#' @param population PARAM_DESCRIPTION
#' @param age_breaks PARAM_DESCRIPTION, Default: c(seq(0, 75, by = 5), Inf)
#' @return OUTPUT_DESCRIPTION
#' @examples
#' \dontrun{
#' if (interactive()) {
#'   # EXAMPLE1
#' }
#' }
#' @export
predict_contacts <- function(model,
                             population,
                             age_breaks = c(seq(0, 75, by = 5), Inf)) {
  # NOTE - need to remove / upgrade fragile use of `lower.age.limit`
  population <- population %>%
    dplyr::arrange(lower.age.limit)

  # this could be changed to a function for lower age limit
  age_min_integration <- min(population$lower.age.limit)
  bin_widths <- diff(population$lower.age.limit)
  final_bin_width <- bin_widths[length(bin_widths)]
  age_max_integration <- max(population$lower.age.limit) + final_bin_width
  
  # need to check we are not predicting to 0 populations (interpolator can
  # predict 0 values, then the aggregated ages get screwed up)
  pop_fun <- get_age_population_function(population)
  ages <- age_min_integration:age_max_integration
  valid <- pop_fun(ages) > 0
  age_min_integration <- min(ages[valid])
  age_max_integration <- max(ages[valid])
  
  pred_1y <- predict_contacts_1y(
    model = model,
    population = population,
    # these two arguments could be changed by just taking in the age vector
    # and then doing that step above internally
    age_min = age_min_integration,
    age_max = age_max_integration
  )

  pred_groups <- aggregate_predicted_contacts(
    predicted_contacts_1y = pred_1y,
    population = population,
    age_breaks = age_breaks
  )

  pred_groups
}
