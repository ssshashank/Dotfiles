-- Swap files
vim.opt.swapfile = false

-- Enable relative line numbers
vim.opt.relativenumber = true

-- Enable absolute line numbers for the current line
vim.opt.number = true

-- Enable highlighting of the current line
vim.opt.cursorline = true

-- Enable tab and space indentation
vim.cmd("set expandtab")
vim.cmd("set tabstop=6")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")
vim.cmd("set clipboard=unnamedplus")

-- views can only be fully collapsed with the global statusline
vim.opt.laststatus = 3
