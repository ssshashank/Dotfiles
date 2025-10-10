-- Global diagnostic config for Neovim 0.10+
vim.diagnostic.config({
  virtual_text = false,
  signs = false,
  underline = true,
  update_in_insert = false,
  severity_sort = true,
})
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

-- You will likely want to reduce updatetime which affects CursorHold
-- note: this setting is global and should be set only once
vim.o.updatetime = 250
vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
	group = vim.api.nvim_create_augroup("float_diagnostic", { clear = true }),
	callback = function()
		vim.diagnostic.open_float(nil, { focus = false })
	end,
})

vim.api.nvim_create_autocmd("CursorHold", {
	buffer = buffr,
	callback = function()
		local opts = {
			focusable = false,
			close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
			border = "rounded",
			source = "always",
			prefix = " ",
			scope = "cursor",
		}
		vim.diagnostic.open_float(nil, opts)
	end,
})
