test_that("al_structure_toc() flattens a table of contents correctly", {
  ## Fictional TOC list, structured to match documented API shape ----
  fake_toc <- list(
    list(
      type = "preamble",
      subcomponent = "preamble",
      component = "main",
      title = "Preamble",
      url = "https://api.laws.africa/v3/akn/xx/act/2024/1/eng/main/preamble"
    ),
    list(
      type = "chapter",
      id = "chapter-1",
      component = "main",
      subcomponent = "chapter/1",
      num = "1",
      heading = "Definitions",
      title = "Chapter 1 - Definitions",
      url = "https://api.laws.africa/v3/akn/xx/act/2024/1/eng/main/chapter/1",
      children = list(
        list(
          type = "section",
          id = "section-1",
          component = "main",
          subcomponent = "section/1",
          num = "1",
          heading = "Definitions",
          title = "1. Definitions",
          url = "https://api.laws.africa/v3/akn/xx/act/2024/1/eng/main/section/1"
        )
      )
    )
  )

  result <- al_structure_toc(fake_toc)

  ## Basic shape checks ----
  expect_s3_class(result, "tbl_df")
  expect_equal(nrow(result), 2)
  expect_true(all(c("type", "title", "url") %in% names(result)))

  ## Top-level rows preserved as given ----
  expect_equal(result$type, c("preamble", "chapter"))
  expect_equal(result$title, c("Preamble", "Chapter 1 - Definitions"))

  ## Nested children preserved as a list-column ----
  expect_type(result$children, "list")
  expect_null(result$children[[1]])
  expect_equal(length(result$children[[2]]), 1)
})
