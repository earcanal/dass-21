context('DASS-21')

df <- expfactory::process_expfactory_survey(token='1',
                                            survey='../fixtures/dass-21-results.json',
                                            flat=FALSE) %>% rename(p = Token)
test_that("process_expfactory_survey() can process JSON", {
  expect_is(df, 'data.frame')
})
test_that('DASS-21 JSON correctly parsed', {
  expect_equal(df[5,4], 'I found it difficult to work up the initiative to do things')
})
dass21 <- dass21(df)
test_that('DASS-21 anxiety score', {
  expect_equal(dass21[1,'anxiety'], 11)
})
test_that('DASS-21 stress score', {
  expect_equal(dass21[1,'stress'], 12)
})
test_that('DASS-21 depression score', {
  expect_equal(dass21[1,'depression'], 9)
})