sinew::pretty_namespace(
  con = "gist.R",
  force = list(
    dplyr = c("arrange",
              "group_by",
              "filter",
              "mutate",
              "select",
              "starts_with",
              "across",
              "bind_rows",
              "case_when",
              "group_by",
              "left_join",
              "n",
              "n_distinct",
              "summarise",
              "ungroup"),
    tibble = c("as_tibble",
               "column_to_rownames"),
    ggplot2 = c("ggplot", 
                "aes",
                "coord_fixed",
                "element_blank",
                "element_text",
                "facet_wrap",
                "geom_tile",
                "ggsave",
                "ggtitle",
                "scale_fill_distiller",
                "theme",
                "theme_minimal"),
    tidyr = c("complete", 
              "nesting",
              "expand_grid",
              "pivot_longer",
              "pivot_wider"),
    stats = c("weighted.mean", 
              "offset",
              "runif",
              "spline",
              "splinefun"),
    patchwork = c("plot_annotation",
                 "plot_layout"),
    socialmixr = c("contact_matrix",
                   "wpp_age")
  ),
  ignore = list(
    conmat = c("get_polymod_population",
               "get_age_population_function",
               "add_population_age_to",
               "add_school_work_participation",
               "add_rotated_ages",
               "add_modelling_features",
               "predict_contacts_1y",
               "aggregate_predicted_contacts",
               "matrix_to_predictions",
               "estimate_setting_contacts",
               "get_polymod_contact_data",
               "plot_matrix",
               "fit_single_contact_model",
               "predict_contacts",
               "predictions_to_matrix"),
    brms = "s",
    base = c("c", 
             "length", 
             "predict", 
             "unique", 
             "suppressWarnings")
  ),
  overwrite = TRUE
)

sinew::untangle(
  file = "gist.R",
  dir.out = "R/",
  keep.body = TRUE
)

sinew::makeOxyFile(
  input = "R/",
  overwrite = TRUE
)
