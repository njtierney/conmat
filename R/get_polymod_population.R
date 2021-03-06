#' return the polymod-average population age distribution in 5y
#'
#' return the polymod-average population age distribution in 5y increments
#' (weight country population distributions by number of participants)
#' note that we don't want to weight by survey age distributions for this, since
#' the total number of *participants* represents the sampling
#'
#' @param countries countries to extract data from
#' @return data frame
#' @examples
#' \dontrun{
#' if (interactive()) {
#'   # EXAMPLE1
#' }
#' }
#' @export
get_polymod_population <- function(countries = c("Belgium", "Finland", "Germany", "Italy", "Luxembourg", "Netherlands", 
                                                 "Poland", "United Kingdom")) {
  socialmixr::polymod$participants %>%
    dplyr::filter(
      !is.na(year),
      country %in% countries
    ) %>%
    dplyr::group_by(
      country,
      year
    ) %>%
    dplyr::summarise(
      participants = dplyr::n(),
      .groups = "drop"
    ) %>%
    dplyr::left_join(
      socialmixr::wpp_age()%>% dplyr::filter(year == 2005),
      by = c("country")
    ) %>%
    dplyr::filter(
      !is.na(lower.age.limit)
    ) %>%
    dplyr::group_by(
      lower.age.limit
    ) %>%
    dplyr::summarise(
      population = stats::weighted.mean(population, participants)
    )
}
