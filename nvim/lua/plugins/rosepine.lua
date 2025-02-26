return {
	"rose-pine/neovim",
	name = "rose-pine",
	priority = 1000,
	config = function()
		require("rose-pine").setup({
			variant = "main", -- auto, main, moon, or dawn
			dark_variant = "main", -- main, moon, or dawn
			dim_inactive_windows = false,
			extend_background_behind_borders = true,

			enable = {
				terminal = true,
				legacy_highlights = true,
				migrations = true,
			},

			styles = {
				bold = true,
				italic = true,
				transparency = false,
			},

			groups = {
				border = "muted",
				link = "iris",
				panel = "surface",
				error = "love",
				hint = "iris",
				info = "#ffffff",
				note = "pine",
				todo = "rose",
				warn = "gold",
				git_add = "#ffffff",
				git_change = "rose",
				git_delete = "love",
				git_dirty = "rose",
				git_ignore = "muted",
				git_merge = "iris",
				git_rename = "pine",
				git_stage = "iris",
				git_text = "rose",
				git_untracked = "#ffffff",
				h1 = "iris",
				h2 = "#ffffff",
				h3 = "rose",
				h4 = "gold",
				h5 = "pine",
				h6 = "#ffffff",
			},
			highlight_groups = {
				-- Custom text color scheme
				VertSplit = { fg = "muted", bg = "muted" },
				Normal = { fg = "#ECEFF4", bg = "#0F111A", italic = true }, -- Default text color and background
				Comment = { fg = "#6C7682", italic = true }, -- Comments
				String = { fg = "#A3BE8C", italic = true }, -- Strings
				Function = { fg = "#88C0D0", bold = true }, -- Functions
				Keyword = { fg = "#BF616A", bold = true, italic = true }, -- Keywords
				Type = { fg = "#EBCB8B", italic = false }, -- Types
				Variable = { fg = "#D8DEE9", italic = false }, -- Variables
				Constant = { fg = "#B48EAD", italic = false }, -- Constants
				Identifier = { fg = "#D8DEE9" },
				TelescopeNormal = { fg = "#ffffff", bg = "#0F111A" }, -- Main telescope background
				TelescopeBorder = { fg = "muted", bg = "base" }, -- Border around telescope window
				TelescopePromptNormal = { fg = "rose", bg = "overlay" },
				TelescopePromptBorder = { fg = "muted", bg = "overlay" },
				TelescopeSelection = { fg = "love", bg = "base" },
				TelescopeMatching = { fg = "gold", bold = true },
				TelescopeTitle = { fg = "pine", bold = true },
			},
			palette = {
				-- Set black background for all variants
				main = {
					base = "#0F111A", -- Black background for main variant
					overlay = "#000000",
				},
				moon = {
					base = "#000000", -- Black background for moon variant
					overlay = "#363738",
				},
				dawn = {
					base = "#0E1117", -- Black background for dawn variant
					overlay = "#000000",
				},
			},

			before_highlight = function(group, highlight, palette)
				-- Additional customization logic if needed
			end,
		})

		-- vim.cmd("colorscheme rose-pine")
	end,
}
