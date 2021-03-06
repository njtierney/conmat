% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/get_data_abs_age_education.R
\name{get_data_abs_age_education}
\alias{get_data_abs_age_education}
\title{Return  data on educated population for a given age and state or
lga of Australia.}
\usage{
get_data_abs_age_education(age = NULL, state = NULL, lga = NULL)
}
\arguments{
\item{age}{a numeric or numeric vector denoting ages between 0 to 115. The
default is to return all ages.}

\item{state}{target Australian state name or a vector with multiple state
names in its abbreviated form, such as "QLD", "NSW", or "TAS"}

\item{lga}{target Australian local government area (LGA) name, such as
"Fairfield (C)" or a vector with multiple lga names. See
\code{\link[=abs_lga_lookup]{abs_lga_lookup()}} for list of lga names.}
}
\value{
dataset with information on the number of educated people belonging
to a particular age, its total population and the corresponding proportion.
}
\description{
Return  data on educated population for a given age and state or
lga of Australia.
}
\examples{
get_data_abs_age_education(state="VIC")
get_data_abs_age_education(state="WA",lga="Albany (C)",age=1:5)
get_data_abs_age_education(state=c("QLD","TAS"),age=5)
get_data_abs_age_education(lga=c("Albury (C)","Barcoo (S)"),age=10)
}
