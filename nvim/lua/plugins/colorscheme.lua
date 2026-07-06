return {
  "sainnhe/gruvbox-material",
  lazy = false,
  priority = 1000,
  config = function()
--     vim.g.gruvbox_material_background = "hard"
    vim.g.gruvbox_material_enable_italic = true
    vim.g.gruvbox_material_disable_italic_comment = true
    vim.g.gruvbox_material_transparent_background = 2
    vim.cmd.colorscheme("gruvbox-material")

    -- gruvbox-material's transparent_background flag skips Normal/NormalNC/
    -- SignColumn but leaves a few groups opaque; clear those too so the
    -- terminal's background shows through everywhere.
    for _, group in ipairs({ "Normal", "NormalNC", "NormalFloat", "SignColumn", "LineNr", "EndOfBuffer" }) do
      vim.api.nvim_set_hl(0, group, { bg = "none" })
    end
  end,
}
