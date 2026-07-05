return {
  "udalov/kotlin-vim",
  init = function()
    vim.filetype.add({ extension = { kt = "kotlin" } })
  end,
}
