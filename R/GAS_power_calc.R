# You can learn more about package authoring with RStudio at:
#
#   http://r-pkgs.had.co.nz/
#
# Some useful keyboard shortcuts for package authoring:
#
#   Install Package:           'Cmd + Shift + B'
#   Check Package:             'Cmd + Shift + E'
#   Test Package:              'Cmd + Shift + T'

GAS_power_calc <- function(daf,grr,prevalence,cases,controls,alpha,model){
  if (!(model %in% c("multiplicative","additive","dominant","recessive"))){
    stop('Invalid disease model type : please select one of "multiplicative","additive","dominant","recessive"')
  }

  if (!(daf > 0 && daf < 1)){
    stop('Invalid disease allelle frequency : value should be between 0 and 1')
  }

  if (!(prevalence > 0 && prevalence < 1)){
    stop('Invalid disease prevalence : value should be between 0 and 1')
  }

  if (!(alpha > 0 && alpha< 1)){
    stop('Invalid alpha : value should be between 0 and 1')
  }

  if (!(cases > 0)){
    stop('Invalid number of cases : value should be greater than 0')
  }

  if (!(controls > 0)){
    stop('Invalid number of controls : value should be greater than 0')
  }

  if (!(grr > 0)){
    stop('Invalid genotype relative risk : value should be greater than 0')
  }

  AAfreq <- daf^2

  ABfreq <- 2 * daf * (1-daf)

  BBfreq <- (1-daf)^2

  if (model == "multiplicative"){
    x <- c(grr^2,grr,1)
  }
  if (model == "additive"){
    x <- c((2*grr-1),grr,1)
  }
  if (model == "dominant"){
    x <- c(grr,grr,1)
  }
  if (model == "recessive"){
    x <- c(grr,1,1)
  }

  AAprob <- (x[1]*prevalence)/(x[1]*AAfreq + x[2] * ABfreq + x[3] * BBfreq)

  ABprob <- (x[2]*prevalence)/(x[1]*AAfreq + x[2] * ABfreq + x[3] * BBfreq)

  BBprob <- (x[3]*prevalence)/(x[1]*AAfreq + x[2] * ABfreq + x[3] * BBfreq)

  casesdaf <- (AAprob * AAfreq + ABprob * ABfreq *0.5)/prevalence

  controlsdaf <- ((1-AAprob) * AAfreq + (1-ABprob) * ABfreq * 0.5)/ (1 - prevalence)

  Vcases <- casesdaf * (1 - casesdaf)
  Vcontrols <- controlsdaf * (1 - controlsdaf)

  ncp <- (casesdaf - controlsdaf)/sqrt(((Vcases/cases + Vcontrols/controls) *0.5))

  C <- -qnorm(alpha * 0.5)

  P <- pnorm(-C - ncp) + (1 - pnorm(C - ncp))

  return(P)
}
