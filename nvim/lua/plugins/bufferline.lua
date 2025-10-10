return {
	"akinsho/nvim-bufferline.lua",
	version = "*",
	dependencies = "nvim-tree/nvim-web-devicons",
	config = function()
		require("bufferline").setup({
			options = {
				offsets = {
					{
						filetype = "neo-tree",
						text = "File Explorer",
						text_align = "center",
					},
				},
				numbers = "id",
				indicator = { style = "none" },
				padding = 30,
				show_buffer_close_icons = true,
				show_close_icon = false,
				max_name_length = 18,
				tab_size = 20,
				diagnostics = "nvim_lsp",
				left_trunc_marker = "",
				right_trunc_marker = "",
				show_tab_indicators = false,
				always_show_bufferline = true,
				diagnostics_indicator = function(_, _, d, _)
					local s = " "
					for e, n in pairs(d) do
						local sym = e == "error" and "  " or e == "warning" and "  " or "  "
						s = s .. n .. sym
					end
					return s
				end,
			},

			-- ←—— here's the new part —→
			highlights = {
				-- when a buffer is selected…
				buffer_selected = {
					gui = "bold", -- turn off italic, make it bold
					guifg = "#FFFFFF", -- your desired fg
					guibg = "#2d2d2d", -- your desired bg
				},
				-- the little indicator (the underline by default)
				indicator_selected = {
					gui = "bold",
					guifg = "#FF9E64",
					guibg = "#2d2d2d",
				},
				-- if you’re also using tabs…
				tab_selected = {
					gui = "bold",
					guifg = "#FF9E64",
					guibg = "#2d2d2d",
				},
			},
		})
	end,
}
