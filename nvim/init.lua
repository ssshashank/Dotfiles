vim.g.mapleader = " "
vim.g.background = "light"

-- Disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 2
vim.g.loaded_netrwPlugin = 1

-- Imports configuration files
require("config.key_binding")
require("config.vim_options")
require("config.lazy")
