test_that("al_get_toc() retrieves and structures a table of contents", {
  withr::local_envvar(LAWS_AFRICA_TOKEN = "fake-token-for-testing")

  httptest2::with_mock_dir("fixtures/al_get_toc", {
    result <- al_get_toc(frbr_uri = "xx/act/2024/1/eng")

    expect_s3_class(result, "tbl_df")
    expect_equal(nrow(result), 2)
    expect_true(all(c("type", "title", "url") %in% names(result)))
    expect_equal(result$type, c("preamble", "chapter"))
  })
})

test_that("al_get_toc() errors informatively when token is missing", {
  withr::local_envvar(LAWS_AFRICA_TOKEN = "")

  expect_error(
    al_get_toc(frbr_uri = "xx/act/2024/1/eng"),
    "Token is missing"
  )
})
