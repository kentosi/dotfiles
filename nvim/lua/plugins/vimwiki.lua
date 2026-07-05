return {
  "vimwiki/vimwiki",
  init = function()
    vim.g.vimwiki_list = {
      { syntax = "markdown", ext = ".md", path = "~/Documents/vimwiki" },
    }
    vim.g.vimwiki_url_maxsave = 0
  end,
  config = function()
    require("util.vimwiki_gitpush").setup()
  end,
}
