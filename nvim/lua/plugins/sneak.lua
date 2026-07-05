return {
  "justinmk/vim-sneak",
  init = function()
    vim.g["sneak#label"] = 1
    vim.g["sneak#use_ic_scs"] = 1
    vim.g["sneak#s_next"] = 1
  end,
  config = function()
    vim.cmd("highlight Sneak guifg=black guibg=#00C7DF ctermfg=black ctermbg=cyan")
    vim.cmd("highlight SneakScope guifg=red guibg=yellow ctermfg=red ctermbg=yellow")

    vim.keymap.set({ "n", "x", "o" }, "gS", "<Plug>Sneak_,")
    vim.keymap.set({ "n", "x", "o" }, "gs", "<Plug>Sneak_;")
  end,
}
