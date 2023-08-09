\name{GAS_power_calc}
\alias{GAS_power_calc}
\title{GAS power calculator}
\usage{
GAS_power_calc(daf,grr,prevalence,cases,controls,alpha,model)
}
\description{
Calculates statistical power for genomic association studies. Based on Genomic Association Study (GAS) Power Calculator Copyright 2017, Jennifer Li Johnson, University of Michigan School of Public Health. doi: https://doi.org/10.1101/164343
}
\arguments{
  \item{daf}{disease allele frequency: frequency of the disease risk allele in the general population}
  \item{grr}{genotype relative risk}
  \item{prevalence}{general population disease prevelance: probability that a randomly sampled individual has the disease.}
  \item{cases}{n cases in study}
  \item{controls}{n controls in study}
  \item{alpha}{desired significance level (alpha)}
  \item{model}{disease model: can be any of "multiplicative","additive","dominant","recessive"}
}
\examples{
GAS_power_calc(0.5000,1.5,0.1,1000,1000,0.000007,"multiplicative")
}
