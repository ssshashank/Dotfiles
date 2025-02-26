-- A blazing fast and easy to configure Neovim statusline written in Lua.
local colors = {
	color19 = "#9FDBF7",
	color18 = "#84E1BC",
	color10 = "#f07178",
	color11 = "#3e4b59",
	color12 = "#e6e1cf",
	color13 = "#1C2021",
	color4 = "#1C2021",
	color5 = "#ffee99",
}

local ayu_dark = {
	visual = {
		a = { fg = colors.color4, bg = colors.color5, "bold" },
	},
	replace = {
		a = { fg = colors.color4, bg = colors.color10, "bold" },
	},
	inactive = {
		b = { fg = colors.color11, bg = colors.color4 },
		c = { fg = colors.color12, bg = colors.color4 },
		a = { fg = colors.color12, bg = colors.color13, "bold" },
	},
	insert = {
		a = { fg = colors.color4, bg = colors.color18, "bold" },
	},
	normal = {
		b = { fg = colors.color12, bg = colors.color13 },
		c = { fg = colors.color11, bg = colors.color4 },
		a = { fg = colors.color4, bg = colors.color19, "bold" },
	},
}

return {
	"nvim-lualine/lualine.nvim",
	config = function()
		-- Change the background of lualine_c section for normal mode
		require("lualine").setup({
			options = {
				theme = ayu_dark, -- lualine theme
				component_separators = { left = "", right = "" },
				section_separators = { left = "", right = "" },
				disabled_filetypes = { -- Filetypes to disable lualine for.
					statusline = {}, -- only ignores the ft for statusline.
					winbar = {}, -- only ignores the ft for winbar.
				},

				ignore_focus = {}, -- If current filetype is in this list it'll
				-- always be drawn as inactive statusline
				-- and the last window will be drawn as active statusline.
				-- for example if you don't want statusline of
				-- your file tree / sidebar window to have active
				-- statusline you can add their filetypes here.

				always_divide_middle = true, -- When set to true, left sections i.e. 'a','b' and 'c'
				-- can't take over the entire statusline even
				-- if neither of 'x', 'y' or 'z' are present.

				globalstatus = false, -- enable global statusline (have a single statusline
				-- at bottom of neovim instead of one for  every window).
				-- This feature is only available in neovim 0.7 and higher.

				refresh = { -- sets how often lualine should refresh it's contents (in ms)
					statusline = 1000, -- The refresh option sets minimum time that lualine tries
					tabline = 1000, -- to maintain between refresh. It's not guarantied if situation
					winbar = 1000, -- arises that lualine needs to refresh itself before this time
					-- it'll do it.

					-- Also you can force lualine's refresh by calling refresh function
					-- like require('lualine').refresh()
				},
			},
		})
	end,
}
