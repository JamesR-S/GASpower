# GASpower
R implementation of the Genomic Association Study (GAS) Power Calculator.

Calculates statistical power for genomic association studies. Based on Genomic Association Study (GAS) Power Calculator Copyright 2017, Jennifer Li Johnson, University of Michigan School of Public Health. doi: https://doi.org/10.1101/164343

# Install instructions
Install with the commands:
```
install.packages("remotes")
remotes::install_github("JamesR-S/GASpower")
```

# Usage
```
GAS_power_calc(daf,grr,prevalence,cases,controls,alpha,model)
```
### Arguments:
* `daf` - disease allele frequency: frequency of the disease risk allele in the general population.
* `grr` - genotype relative risk.
* `prevalence` - general population disease prevelance: probability that a randomly sampled individual has the disease.
* `cases` - n cases in study.
* `controls` - n controls in study.
* `alpha` - desired significance level (alpha).
* `model` - disease model: can be any of "multiplicative","additive","dominant","recessive".

### Example
```
GAS_power_calc(0.5000,1.5,0.1,1000,1000,0.000007,"multiplicative")
```
