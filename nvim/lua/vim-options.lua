vim.cmd("set expandtab")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")
vim.cmd("set clipboard=unnamedplus")
vim.g.mapleader = " "
vim.g.background = "light"

vim.opt.swapfile = false
-- Enable relative line numbers
vim.opt.relativenumber = true
-- Enable absolute line numbers for the current line
vim.opt.number = true

-- Disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Navigate vim panes better
vim.keymap.set("n", "<C-k>", ":wincmd k<CR>")
vim.keymap.set("n", "<C-j>", ":wincmd j<CR>")
vim.keymap.set("n", "<C-h>", ":wincmd h<CR>")
vim.keymap.set("n", "<C-l>", ":wincmd l<CR>")

vim.keymap.set("n", "<leader>h", ":nohlsearch<CR>")
-- Enable highlighting of the current line
vim.opt.cursorline = true

-- Set custom colors for the cursor line and cursor line number
vim.cmd([[
  highlight CursorLine guibg=#ffffff
  highlight CursorLineNr guifg=#ffffff guibg=#ffffff
]])
