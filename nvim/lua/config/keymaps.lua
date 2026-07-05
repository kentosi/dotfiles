vim.g.mapleader = " "

local map = vim.keymap.set

-- Yank and stay at cursor position
map("v", "y", "mcy`c")

-- Quick access to config
map("n", "\\e", ":e $MYVIMRC<CR>")

-- Close buffer
map("n", "<Leader>q", ":bd<CR>", { silent = true })

-- Alt-Backspace to delete word (insert mode)
map("i", "<A-BS>", "<C-w>")

-- System clipboard
map("v", "<Leader>y", '"+y')
map("n", "<Leader>p", '"+p')
map("n", "<Leader>P", '"+P')

-- Numbered register yank/paste
map("v", "<Leader>1y", '"1y')
map("v", "<Leader>2y", '"2y')
map("v", "<Leader>3y", '"3y')
map("n", "<Leader>1p", '"1p')
map("n", "<Leader>2p", '"2p')
map("n", "<Leader>3p", '"3p')

-- Buffer navigation
map("n", "<C-k>", ":bn<CR>")
map("n", "<C-j>", ":bp<CR>")

-- Splitting
map("n", "<Leader>v", ":vnew<CR>")
map("n", "<Leader>|", ":vnew<CR>")
map("n", "<Leader>-", ":sp<CR>")

-- Switch between splits
map("n", "<C-h>", "<C-w>h", { silent = true })
map("n", "<C-l>", "<C-w>l", { silent = true })



