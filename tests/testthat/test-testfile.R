test_that("invalid daf low", {
  expect_error(GAS_power_calc(0,1.5,0.1,5,10,0.05,"additive"),'Invalid disease allelle frequency : value should be between 0 and 1')
})
test_that("invalid daf high", {
  expect_error(GAS_power_calc(1.5,1.5,0.1,5,10,0.05,"additive"),'Invalid disease allelle frequency : value should be between 0 and 1')
})
test_that("invalid grr", {
  expect_error(GAS_power_calc(0.05,0,0.1,5,10,0.05,"additive"),'Invalid genotype relative risk : value should be greater than 0')
})
test_that("invalid prevalence low", {
  expect_error(GAS_power_calc(0.05,1.5,0,5,10,0.05,"additive"),'Invalid disease prevalence : value should be between 0 and 1')
})
test_that("invalid prevalence high", {
  expect_error(GAS_power_calc(0.05,1.5,1.5,5,10,0.05,"additive"),'Invalid disease prevalence : value should be between 0 and 1')
})
test_that("invalid cases", {
  expect_error(GAS_power_calc(0.05,1.5,0.1,0,10,0.05,"additive"),'Invalid number of cases : value should be greater than 0')
})
test_that("invalid controls", {
  expect_error(GAS_power_calc(0.05,1.5,0.1,5,0,0.05,"additive"),'Invalid number of controls : value should be greater than 0')
})
test_that("invalid alpha low", {
  expect_error(GAS_power_calc(0.05,1.5,0.1,5,10,0,"additive"),'Invalid alpha : value should be between 0 and 1')
})
test_that("invalid alpha high", {
  expect_error(GAS_power_calc(0.05,1.5,0.1,5,10,1.5,"additive"),'Invalid alpha : value should be between 0 and 1')
})
test_that("invalid daf", {
  expect_error(GAS_power_calc(0.05,1.5,0.1,5,10,0.05,"junktext"),'Invalid disease model type : please select one of "multiplicative","additive","dominant","recessive"')
})

test_that("multiplicative example", {
  expect_equal(round(GAS_power_calc(0.5000,1.5,0.1,1000,1000,0.000007,"multiplicative"),6),0.995417)
})

test_that("domininant example", {
  expect_equal(round(GAS_power_calc(0.5000,1.5,0.1,1000,1000,0.000007,"dominant"),6),0.098046)
})

test_that("recessive example", {
  expect_equal(round(GAS_power_calc(0.5000,1.5,0.1,1000,1000,0.000007,"recessive"),6),0.281839)
})

test_that("additive example", {
  expect_equal(round(GAS_power_calc(0.5000,1.5,0.1,1000,1000,0.000007,"additive"),6),0.919839)
})

