return {
  "lewis6991/gitsigns.nvim",
  config = function()
    require("gitsigns").setup({
      on_attach = function(bufnr)
        local gitsigns = require("gitsigns")
        local function map(mode, l, r, desc)
          vim.keymap.set(mode, l, r, { buffer = bufnr, desc = desc })
        end

        map("n", "]h", gitsigns.next_hunk, "Next git hunk")
        map("n", "[h", gitsigns.prev_hunk, "Prev git hunk")
        map("n", "<leader>hp", gitsigns.preview_hunk, "Preview git hunk")
        map("n", "<leader>hb", function()
          gitsigns.blame_line({ full = true })
        end, "Blame line")
      end,
    })
  end,
}
