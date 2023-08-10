\name{GAS_power_plot}
\alias{GAS_power_plot}
\title{GAS power plot}
\usage{
GAS_power_plot(plot_variable,from,to,by,daf,grr,prevalence,cases,controls,alpha,model)
}
\description{
Plots power for a range of values. Based on Genomic Association Study (GAS) Power Calculator Copyright 2017, Jennifer Li Johnson, University of Michigan School of Public Health. doi: https://doi.org/10.1101/164343
}
\arguments{
  \item{plot_variable}{choice of variable for power to be plotted against. This variable does not need to be defined later in the function}
  \item{from}{start value for plot variable}
  \item{to}{start value for plot variable}
  \item{by}{step size for plot variable}
  \item{daf}{disease allele frequency: frequency of the disease risk allele in the general population}
  \item{grr}{genotype relative risk}
  \item{prevalence}{general population disease prevelance: probability that a randomly sampled individual has the disease. If prevalence is not provided then it will be calculated based on the case and control numbers.}
  \item{cases}{n cases in study}
  \item{controls}{n controls in study}
  \item{alpha}{desired significance level (alpha)}
  \item{model}{disease model: can be any of "multiplicative","additive","dominant","recessive"}
}
\examples{
GAS_power_plot("grr",from = 1, to = 10, by = 0.5,daf=0.0000005,cases=39000,controls=36000,alpha = 0.05,model="dominant")
}
