GAS_power_plot <- function(plot_variable,from,to,by,daf=NULL,grr=NULL,prevalence=NULL,cases=NULL,controls=NULL,alpha=NULL,model){

  if (!(plot_variable %in% c("daf","grr","prevalence","cases","controls","alpha"))){
    stop('Invalid plot variable. Please select one of "daf","grr","prevalence","cases","controls","alpha".')
  }

  if (!(model %in% c("multiplicative","additive","dominant","recessive"))){
    stop('Invalid disease model type : please select one of "multiplicative","additive","dominant","recessive"')
  }

  if (plot_variable == "daf" && (!(from > 0 && from < 1) || !(to > 0 && to < 1))){
    stop('Invalid disease allelle frequency ranges : from and to values should be between 0 and 1')
  }

  if (plot_variable == "prevalence" && (!(from > 0 && from < 1) || !(to > 0 && to < 1))){
    stop('Invalid disease prevalence ranges : from and to values should be between 0 and 1')
  }

  if (plot_variable == "alpha" && (!(from > 0 && from < 1) || !(to > 0 && to < 1))){
    stop('Invalid alpha ranges : from and to values should be between 0 and 1')
  }

  if (plot_variable == "cases" && (!(from > 0) || !(to > 0))){
    stop('Invalid number of case ranges : from and to values should be greater than 0')
  }

  if (plot_variable == "controls" && (!(from > 0) || !(to > 0))){
    stop('Invalid number of control ranges : from and to values should be greater than 0')
  }

  if (plot_variable == "grr" && (!(from > 0) || !(to > 0))){
    stop('Invalid genotype relative risk ranges : from and to values should be greater than 0')
  }

  if ((plot_variable == "controls"  || plot_variable == "cases") && is.null(prevalence)){
    stop('Prevalence must be specified if cases/controls is being plotted.')
  }

  if (is.null(prevalence) && !(plot_variable == "prevalence" )){
    warning("No value supplied for prevalence, so cohort prevalence used (cases/(cases + controls))")
    prevalence <- cases/(cases+controls)
  }

  variables <- list(daf=daf,grr=grr,prevalence=prevalence,cases=cases,controls=controls,alpha=alpha)[!(c("daf","grr","prevalence","cases","controls","alpha") == plot_variable)]

  if (any(sapply(variables, is.null))){
    stop(paste0("Missing values : ", paste0(names(variables)[sapply(variables, is.null)],collapse = ", "), " need to be supplied."))
  }

  if (!(plot_variable == "daf") && !(daf > 0 && daf < 1)){
    stop('Invalid disease allelle frequency : value should be between 0 and 1')
  }

  if (is.null(prevalence)){
    print("No value supplied for prevalence, so cohort prevalence used (cases/(cases + controls))")
    prevalence <- cases/(cases+controls)
  }

  if (!(plot_variable == "alpha") && !(alpha > 0 && alpha< 1)){
    stop('Invalid alpha : value should be between 0 and 1')
  }

  if (!(plot_variable == "cases") && !(cases > 0)){
    stop('Invalid number of cases : value should be greater than 0')
  }

  if (!(plot_variable == "controls") && !(controls > 0)){
    stop('Invalid number of controls : value should be greater than 0')
  }

  if (!(plot_variable == "grr") && !(grr > 0)){
    stop('Invalid genotype relative risk : value should be greater than 0')
  }

  plot_variable_ranges <- seq(from=from,to=to,by=by)

  P_values <- sapply(plot_variable_ranges, function(x) {
    do.call(GAS_power_calc, c(setNames(list(x), plot_variable), variables, list(model=model)))
  })

  variable_names <- list(daf="Disease Allele Frequency",
                         grr="Genotype Relative Risk",
                         prevalence = "Prevalence",
                         cases = "Cases",
                         controls = "Controls",
                         alpha = "Alpha")

  plot_data <- data.frame(plot_variable_ranges ,P_values)[!(is.na(P_values)),]

  plot <- ggplot(plot_data,aes=aes(x=plot_variable_ranges, y=P_values)) + geom_point(aes(x=plot_variable_ranges, y=P_values)) + geom_line(aes(x=plot_variable_ranges, y=P_values)) + xlab(variable_names[plot_variable]) + ylab("Power") +theme_linedraw()

  return(plot)
}


