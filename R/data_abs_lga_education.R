#' LGA wise ABS education population data on different ages for year 2016
#'
#' A dataset containing Australian Bureau of Statistics education data by
#'   lga for 2016. The data sourced from 2016 Census - Employment, Income and
#'   Education through TableBuilder have been randomly adjusted by the ABS to 
#'   avoid the release of confidential data. As a result of this, there are 
#'   some cases where the estimated number of people being educated is higher 
#'   than the population of those people. Such cases have been flagged under the 
#'   `anomaly_flag` variable.
#' @format A data frame with 64,264 rows and 8 variables:
#' \describe{
#'   \item{year}{a number denoting the year as 2016, as the data is based on 
#'     2016 Census of Population and Housing.}
#'   \item{state}{a string denoting the abbreviated name of state or territory 
#'     name such as 'NSW', 'VIC', 'QLD' and so on.}
#'   \item{lga}{a string denoting the official name of Local Government Area. 
#'     For example, 'Albury (C).'}
#'   \item{age}{a number denoting ages from 0 to 115.}
#'   \item{population_educated}{a number denoting number of people educated
#'      including students with full-time, part-time status as well as the 
#'      people who mentioned just the type of educational institution they 
#'      attend and not their student status.}
#'   \item{total_population}{a number depicting the total population belonging 
#'     to the age.}
#'   \item{proportion}{a number denoting the measure of the ratio of 
#'     educated population and total population belonging to the age i.e,
#'     population_educated / total_population}
#'   \item{anomaly_flag}{a logical variable with values TRUE and FALSE that 
#'     flags the abnormal observations in the data such as total population 
#'     lesser than population_educated as TRUE.}
#' }
#' @source {Census of Population and Housing, 2016, TableBuilder}
"data_abs_lga_education"
