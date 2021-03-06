#' fit a single GAM contact model to a dataset
#'
#' @param contact_data PARAM_DESCRIPTION
#' @param population PARAM_DESCRIPTION
#' @return OUTPUT_DESCRIPTION
#' @details DETAILS
#' @examples
#' \dontrun{
#' if (interactive()) {
#'   # EXAMPLE1
#' }
#' }
#' @export
fit_single_contact_model <- function(contact_data, population) {

  # programatically add the offset term to the formula, so the model defines
  # information about the setting, without us having to pass it through to the
  # prediction data
  formula_no_offset <- contacts ~
    # deviation of contact age distribution from population age distribution
    s(age_to) +
    # number of contacts by age
    s(age_from) +
    # intergenerational contact patterns
    s(abs(age_from - age_to)) +
    # interaction between intergenerational patterns and age_from, to remove
    # ridge for some ages and settings
    s(abs(age_from - age_to), age_from) +
    # probabilities of both attending (any) school/work
    school_probability +
    work_probability
  
  # choose the offset variable based on the setting
  setting <- contact_data$setting[1]
  offset_variable <- switch(
    setting,
    school = "log_contactable_population_school",
    "log_contactable_population"
  )
  
  # add multiplicative offset for population contactable, to enable
  # extrapolation to new demographies
  formula_offset <- sprintf("~. + offset(%s)", offset_variable)
  formula <- update(formula_no_offset, formula_offset)
  
  # contact model for all locations together
  contact_data %>%
    # NOTE
    # Do we need to have this data cleaning step in here?
    # I think we should instead have this as a separate preparation step for
    # model fitting.
    add_modelling_features(
      # NOTE
      # The modelling features added here are:
        # the school and work offsets
        # pop_age_to (interpolated population)
        # `log_contactable_population_school`, and ` log_contactable_population`
      population = population
    ) %>%
    mgcv::bam(
      formula = formula,
      family = stats::poisson,
      # add number of participants as a multilpicative offset here rather than in
      # the formula, so it is not needed for prediction,
      # NOTE: the offset of participants allows us to get the rate per person
      # NOTE
      # is this offset here in addition to or replacement of `formula_offset`?
      # It is unclear to me how this doesn't result in two offsets, which
      # doesn't really seem possible/good?
      offset = log(participants),
      data = .
    )
  
}
