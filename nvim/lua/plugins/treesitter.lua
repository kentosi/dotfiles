return {
  "nvim-treesitter/nvim-treesitter",
  branch = "master",
  build = ":TSUpdate",
  config = function()
    require("nvim-treesitter.configs").setup({
      ensure_installed = { "lua", "vim", "vimdoc", "markdown", "markdown_inline", "kotlin", "bash" },
      highlight = {
        enable = true,
        -- Neovim's bundled markdown highlight query crashes on fenced code
        -- blocks (neovim/neovim#39032); fall back to regex highlighting.
        disable = { "markdown" },
      },
      indent = { enable = true },
    })
  end,
}
