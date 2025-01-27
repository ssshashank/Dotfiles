-- Navigate between splits
vim.api.nvim_set_keymap("n", "<D-Right>", "<C-w>l", { noremap = true })
vim.api.nvim_set_keymap("n", "<D-Left>", "<C-w>h", { noremap = true })
vim.api.nvim_set_keymap("n", "<D-Down>", "<C-w>j", { noremap = true })
vim.api.nvim_set_keymap("n", "<D-Up>", "<C-w>k", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>r", '<cmd>lua require("spectre").toggle()<CR>', { noremap = true, silent = true })


-- Map Command + A to select all in normal mode
vim.api.nvim_set_keymap('n', '<D-a>', 'ggVG', { noremap = true, silent = true })

-- Map Command + A to select all in insert mode
vim.api.nvim_set_keymap('i', '<D-a>', '<Esc>ggVG', { noremap = true, silent = true })

-- Map Command + A to select all in visual mode
vim.api.nvim_set_keymap('v', '<D-a>', 'ggVG', { noremap = true, silent = true })


-- Toggle single-line comment in normal mode
vim.api.nvim_set_keymap('n', '<leader>c', ':s/^/#/<CR> :noh<CR>', { noremap = true, silent = true })

-- Toggle single-line comment in visual mode
vim.api.nvim_set_keymap('v', '<leader>c', ':s/^/#/<CR> :noh<CR>', { noremap = true, silent = true })

-- Set folding method to 'indent' (you can also choose 'syntax' or 'manual')
vim.opt.foldmethod = 'indent' -- 'indent', 'manual', 'expr', 'marker', or 'syntax'

-- Automatically close folds when entering the buffer
vim.opt.foldenable = true -- Enable folding
vim.opt.foldlevel = 99    -- Open all folds by default (99 is the maximum)

-- Set fold level (open folds up to this level)
vim.opt.foldlevelstart = 99 -- This allows folds to be opened by default when a file is loaded

-- Customize fold appearance (optional)
vim.opt.fillchars = { eob = ' ', fold = ' ', foldopen = '', foldsep = ' ', foldclose = '' }

-- Optional: If using treesitter for folds (more advanced)
vim.opt.foldmethod = 'expr'
vim.opt.foldexpr = 'nvim_treesitter#foldexpr()'




-- Example to customize Telescope
vim.api.nvim_set_hl(0, "TelescopeNormal", { fg = "#ffffff", bg = "#000000" })       -- White text on black background
vim.api.nvim_set_hl(0, "TelescopeBorder", { fg = "#888888", bg = "#000000" })      -- Gray border on black background
vim.api.nvim_set_hl(0, "TelescopePromptNormal", { fg = "#ff5f87", bg = "#1e1e2e" })-- Pink prompt text
vim.api.nvim_set_hl(0, "TelescopePromptBorder", { fg = "#ff5f87", bg = "#1e1e2e" })-- Pink prompt border
vim.api.nvim_set_hl(0, "TelescopeSelection", { fg = "#ffaf00", bg = "#1e1e2e" })   -- Orange selection
vim.api.nvim_set_hl(0, "TelescopeMatching", { fg = "#ffd700", bold = true })       -- Yellow matching text
vim.api.nvim_set_hl(0, "TelescopeTitle", { fg = "#af87ff", bold = true })          -- Purple title
