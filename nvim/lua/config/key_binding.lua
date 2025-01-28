-- Map Command + A to select all in normal mode
vim.api.nvim_set_keymap("n", "<D-a>", "ggVG", { noremap = true, silent = true })

-- Map Command + A to select all in insert mode
vim.api.nvim_set_keymap("i", "<D-a>", "<Esc>ggVG", { noremap = true, silent = true })

-- Map Command + A to select all in visual mode
vim.api.nvim_set_keymap("v", "<c-a>", "ggVG", { noremap = true, silent = true })

