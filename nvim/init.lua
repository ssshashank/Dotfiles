-- Bootstrap lazy.nvim
local lazyPath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.vu or vim.loop).fs_stat(lazyPath) then
  local lazyRepo = "https://github.com/folke/lazy.nvim.git"
  local out      = vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "--branch=stable", -- latest stable release
    lazyRepo,
    lazyPath
  })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out,                            "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazyPath)


-- Make sure to setup 'mapleader' and 'maplocalreader' before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalreader = "\\"

-- Setup lazy.nvim
require("vim-options")
require("remaps")
require("lazy").setup('plugins') -- calling lua/plugins.lua

--colorscheme catppuccin " catppuccin-latte, catppuccin-frappe, catppuccin-macchiato, catppuccin-mocha"
--vim.cmd.colorscheme("material-deep-ocean")
--vim.cmd.colorscheme("rose-pine")


-- You will likely want to reduce updatetime which affects CursorHold
-- note: this setting is global and should be set only once
vim.o.updatetime = 250
vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
  group = vim.api.nvim_create_augroup("float_diagnostic", { clear = true }),
  callback = function ()
    vim.diagnostic.open_float(nil, {focus=false})
  end
})

vim.api.nvim_create_autocmd("CursorHold", {
  buffer = buffr,
  callback = function()
    local opts = {
      focusable = false,
      close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
      border = 'rounded',
      source = 'always',
      prefix = ' ',
      scope = 'cursor',
    }
    vim.diagnostic.open_float(nil, opts)
  end
})




--CODE FOR SUPERMAVEN AI HELPER

--fileName: supermaven.lua
-- return {
-- 	"supermaven-inc/supermaven-nvim",
-- 	config = function()
-- 		require("supermaven-nvim").setup({
-- 			keymaps = {
-- 				accept_suggestion = "<Tab>",
-- 				clear_suggestion = "<C-]>",
-- 				accept_word = "<C-j>",
-- 			},
-- 			ignore_filetypes = { cpp = true },
-- 			color = {
-- 				suggestion_color = "#7B7B7B",
-- 				cterm = 244,
-- 			},
-- 			log_level = "info", -- set to "off" to disable logging completely
-- 			disable_inline_completion = false, -- disables inline completion for use with cmp
-- 			disable_keymaps = false, -- disables built in keymaps for more manual control
-- 		})
-- 	end,
-- }
--
--


--CODE FOR dashboard
-- fileName:- alpha.lua
-- return {
--   "goolord/alpha-nvim",
--   dependencies = {
--     "nvim-tree/nvim-web-devicons",
--   },
--
--   config = function()
--     local alpha = require("alpha")
--     local dashboard = require("alpha.themes.startify")
--     dashboard.section.header.val = {
--       [[                                  __                  ]],
--       [[     ___     ___    ___   __  __ /\_\    ___ ___      ]],
--       [[    / _ `\  / __`\ / __`\/\ \/\ \\/\ \  / __` __`\    ]],
--       [[   /\ \/\ \/\  __//\ \_\ \ \ \_/ |\ \ \/\ \/\ \/\ \   ]],
--       [[   \ \_\ \_\ \____\ \____/\ \___/  \ \_\ \_\ \_\ \_\  ]],
--       [[    \/_/\/_/\/____/\/___/  \/__/    \/_/\/_/\/_/\/_/  ]],
--     }
--     alpha.setup(dashboard.opts)
--   end,
--
-- }
--
--



-- CODE FOR SNACKS.LUA
--
--
-- return {
-- 	"folke/snacks.nvim",
-- 	priority = 1000,
-- 	lazy = false,
-- 	keys = {
-- 		{
-- 			"<leader>.",
-- 			function()
-- 				Snacks.scratch()
-- 			end,
-- 			desc = "Toggle Scratch Buffer",
-- 		},
-- 		{
-- 			"<leader>S",
-- 			function()
-- 				Snacks.scratch.select()
-- 			end,
-- 			desc = "Select Scratch Buffer",
-- 		},
-- 		{
-- 			"<leader>n",
-- 			function()
-- 				Snacks.notifier.show_history()
-- 			end,
-- 			desc = "Notification History",
-- 		},
-- 		{
-- 			"<leader>bd",
-- 			function()
-- 				Snacks.bufdelete()
-- 			end,
-- 			desc = "Delete Buffer",
-- 		},
-- 		{
-- 			"<leader>cR",
-- 			function()
-- 				Snacks.rename.rename_file()
-- 			end,
-- 			desc = "Rename File",
-- 		},
-- 		{
-- 			"<leader>gB",
-- 			function()
-- 				Snacks.gitbrowse()
-- 			end,
-- 			desc = "Git Browse",
-- 		},
-- 		{
-- 			"<leader>gb",
-- 			function()
-- 				Snacks.git.blame_line()
-- 			end,
-- 			desc = "Git Blame Line",
-- 		},
-- 		{
-- 			"<leader>gf",
-- 			function()
-- 				Snacks.lazygit.log_file()
-- 			end,
-- 			desc = "Lazygit Current File History",
-- 		},
-- 		{
-- 			"<leader>gg",
-- 			function()
-- 				Snacks.lazygit()
-- 			end,
-- 			desc = "Lazygit",
-- 		},
-- 		{
-- 			"<leader>gl",
-- 			function()
-- 				Snacks.lazygit.log()
-- 			end,
-- 			desc = "Lazygit Log (cwd)",
-- 		},
-- 		{
-- 			"<leader>un",
-- 			function()
-- 				Snacks.notifier.hide()
-- 			end,
-- 			desc = "Dismiss All Notifications",
-- 		},
-- 		-- {
-- 		-- 	"<c-/>",
-- 		-- 	function()
-- 		-- 		Snacks.terminal()
-- 		-- 	end,
-- 		-- 	desc = "Toggle Terminal",
-- 		-- },
-- 		-- {
-- 		-- 	"<c-_>",
-- 		-- 	function()
-- 		-- 		Snacks.terminal()
-- 		-- 	end,
-- 		-- 	desc = "which_key_ignore",
-- 		-- },
-- 		{
-- 			"]]",
-- 			function()
-- 				Snacks.words.jump(vim.v.count1)
-- 			end,
-- 			desc = "Next Reference",
-- 			mode = { "n", "t" },
-- 		},
-- 		{
-- 			"[[",
-- 			function()
-- 				Snacks.words.jump(-vim.v.count1)
-- 			end,
-- 			desc = "Prev Reference",
-- 			mode = { "n", "t" },
-- 		},
-- 		{
-- 			"<leader>N",
-- 			desc = "Neovim News",
-- 			function()
-- 				Snacks.win({
-- 					file = vim.api.nvim_get_runtime_file("doc/news.txt", false)[1],
-- 					width = 0.6,
-- 					height = 0.6,
-- 					wo = {
-- 						spell = false,
-- 						wrap = false,
-- 						signcolumn = "yes",
-- 						statuscolumn = " ",
-- 						conceallevel = 3,
-- 					},
-- 				})
-- 			end,
-- 		},
-- 	},
-- 	opts = {
-- 		-- your configuration comes here
-- 		-- or leave it empty to use the default settings
-- 		-- refer to the configuration section below
-- 		bigfile = { enabled = true },
-- 		notifier = { enabled = true },
-- 		quickfile = { enabled = true },
-- 		statuscolumn = { enabled = true },
-- 		dashboard = {
-- 			enabled = true,
-- 			---@class snacks.dashboard.Config
-- 			---@field sections snacks.dashboard.Section
-- 			---@field formats table<string, snacks.dashboard.Text|fun(item:snacks.dashboard.Item, ctx:snacks.dashboard.Format.ctx):snacks.dashboard.Text>
-- 			{
-- 				width = 60,
-- 				row = nil, -- dashboard position. nil for center
-- 				col = nil, -- dashboard position. nil for center
-- 				pane_gap = 4, -- empty columns between vertical panes
-- 				autokeys = "1234567890abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ", -- autokey sequence
-- 				-- These settings are used by some built-in sections
-- 				preset = {
-- 					-- Defaults to a picker that supports `fzf-lua`, `telescope.nvim` and `mini.pick`
-- 					---@type fun(cmd:string, opts:table)|nil
-- 					pick = nil,
-- 					-- Used by the `keys` section to show keymaps.
-- 					-- Set your custom keymaps here.
-- 					-- When using a function, the `items` argument are the default keymaps.
-- 					---@type snacks.dashboard.Item[]
-- 					keys = {
-- 						{
-- 							icon = " ",
-- 							key = "f",
-- 							desc = "Find File",
-- 							action = ":lua Snacks.dashboard.pick('files')",
-- 						},
-- 						{ icon = " ", key = "n", desc = "New File", action = ":ene | startinsert" },
-- 						{
-- 							icon = " ",
-- 							key = "g",
-- 							desc = "Find Text",
-- 							action = ":lua Snacks.dashboard.pick('live_grep')",
-- 						},
-- 						{
-- 							icon = " ",
-- 							key = "r",
-- 							desc = "Recent Files",
-- 							action = ":lua Snacks.dashboard.pick('oldfiles')",
-- 						},
-- 						{
-- 							icon = " ",
-- 							key = "c",
-- 							desc = "Config",
-- 							action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})",
-- 						},
-- 						{ icon = " ", key = "s", desc = "Restore Session", section = "session" },
-- 						{
-- 							icon = "󰒲 ",
-- 							key = "L",
-- 							desc = "Lazy",
-- 							action = ":Lazy",
-- 							enabled = package.loaded.lazy ~= nil,
-- 						},
-- 						{ icon = " ", key = "q", desc = "Quit", action = ":qa" },
-- 					},
-- 					-- Used by the `header` section
-- 					header = [[
--
-- =================     ===============     ===============   ========  ========
-- \\ . . . . . . .\\   //. . . . . . .\\   //. . . . . . .\\  \\. . .\\// . . //
-- ||. . ._____. . .|| ||. . ._____. . .|| ||. . ._____. . .|| || . . .\/ . . .||
-- || . .||   ||. . || || . .||   ||. . || || . .||   ||. . || ||. . . . . . . ||
-- ||. . ||   || . .|| ||. . ||   || . .|| ||. . ||   || . .|| || . | . . . . .||
-- || . .||   ||. _-|| ||-_ .||   ||. . || || . .||   ||. _-|| ||-_.|\ . . . . ||
-- ||. . ||   ||-'  || ||  `-||   || . .|| ||. . ||   ||-'  || ||  `|\_ . .|. .||
-- || . _||   ||    || ||    ||   ||_ . || || . _||   ||    || ||   |\ `-_/| . ||
-- ||_-' ||  .|/    || ||    \|.  || `-_|| ||_-' ||  .|/    || ||   | \  / |-_.||
-- ||    ||_-'      || ||      `-_||    || ||    ||_-'      || ||   | \  / |  `||
-- ||    `'         || ||         `'    || ||    `'         || ||   | \  / |   ||
-- ||            .===' `===.         .==='.`===.         .===' /==. |  \/  |   ||
-- ||         .=='   \_|-_ `===. .==='   _|_   `===. .===' _-|/   `==  \/  |   ||
-- ||      .=='    _-'    `-_  `='    _-'   `-_    `='  _-'   `-_  /|  \/  |   ||
-- ||   .=='    _-'          '-__\._-'         '-_./__-'         `' |. /|  |   ||
-- ||.=='    _-'                                                     `' |  /==.||
-- =='    _-'                        N E O V I M                         \/   `==
-- \   _-'                                                                `-_   /
--
-- ]],
-- 				},
-- 				-- item field formatters
-- 				formats = {
-- 					icon = function(item)
-- 						if item.file and item.icon == "file" or item.icon == "directory" then
-- 							return M.icon(item.file, item.icon)
-- 						end
-- 						return { item.icon, width = 2, hl = "icon" }
-- 					end,
-- 					footer = { "%s", align = "center" },
-- 					header = { "%s", align = "center" },
-- 					file = function(item, ctx)
-- 						local fname = vim.fn.fnamemodify(item.file, ":~")
-- 						fname = ctx.width and #fname > ctx.width and vim.fn.pathshorten(fname) or fname
-- 						if #fname > ctx.width then
-- 							local dir = vim.fn.fnamemodify(fname, ":h")
-- 							local file = vim.fn.fnamemodify(fname, ":t")
-- 							if dir and file then
-- 								file = file:sub(-(ctx.width - #dir - 2))
-- 								fname = dir .. "/…" .. file
-- 							end
-- 						end
-- 						local dir, file = fname:match("^(.*)/(.+)$")
-- 						return dir and { { dir .. "/", hl = "dir" }, { file, hl = "file" } }
-- 							or { { fname, hl = "file" } }
-- 					end,
-- 				},
-- 				sections = {
-- 					{ section = "header" },
-- 					{ section = "keys", gap = 1, padding = 1 },
-- 					{ section = "startup" },
-- 				},
-- 			},
-- 		},
-- 		words = {
-- 			enabled = true, ---@class snacks.statuscolumn.Config
-- 			---@field enabled? boolean
-- 			{
-- 				left = { "mark", "sign" }, -- priority of signs on the left (high to low)
-- 				right = { "fold", "git" }, -- priority of signs on the right (high to low)
-- 				folds = {
-- 					open = false, -- show open fold icons
-- 					git_hl = false, -- use Git Signs hl for fold icons
-- 				},
-- 				git = {
-- 					-- patterns to match Git signs
-- 					patterns = { "GitSign", "MiniDiffSign" },
-- 				},
-- 				refresh = 50, -- refresh at most every 50ms
-- 			},
-- 		},
-- 		lazygit = {
-- 			-- your lazygit configuration comes here
-- 			-- or leave it empty to use the default settings
-- 			-- refer to the configuration section below
-- 			---@class snacks.lazygit.Config: snacks.terminal.Opts
-- 			---@field args? string[]
-- 			---@field theme? snacks.lazygit.Theme
-- 			{
-- 				-- automatically configure lazygit to use the current colorscheme
-- 				-- and integrate edit with the current neovim instance
-- 				configure = true,
-- 				-- extra configuration for lazygit that will be merged with the default
-- 				-- snacks does NOT have a full yaml parser, so if you need `"test"` to appear with the quotes
-- 				-- you need to double quote it: `"\"test\""`
-- 				config = {
-- 					os = { editPreset = "nvim-remote" },
-- 					gui = {
-- 						-- set to an empty string "" to disable icons
-- 						nerdFontsVersion = "3",
-- 					},
-- 				},
-- 				theme_path = vim.fs.normalize(vim.fn.stdpath("cache") .. "/lazygit-theme.yml"),
-- 				-- Theme for lazygit
-- 				theme = {
-- 					[241] = { fg = "Special" },
-- 					activeBorderColor = { fg = "MatchParen", bold = true },
-- 					cherryPickedCommitBgColor = { fg = "Identifier" },
-- 					cherryPickedCommitFgColor = { fg = "Function" },
-- 					defaultFgColor = { fg = "Normal" },
-- 					inactiveBorderColor = { fg = "FloatBorder" },
-- 					optionsTextColor = { fg = "Function" },
-- 					searchingActiveBorderColor = { fg = "MatchParen", bold = true },
-- 					selectedLineBgColor = { bg = "Visual" }, -- set to `default` to have no background colour
-- 					unstagedChangesColor = { fg = "DiagnosticError" },
-- 				},
-- 				win = {
-- 					style = "lazygit",
-- 				},
-- 			},
-- 		},
-- 	},
-- }
