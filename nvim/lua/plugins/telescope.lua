return {
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.8",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			local builtIn = require("telescope.builtin")
			vim.keymap.set("n", "<leader>p", builtIn.find_files, {}) -- find all files
			vim.keymap.set("n", "<C-p>", builtIn.live_grep, {}) -- live grep
			vim.keymap.set("n", "<leader><leader>", builtIn.oldfiles, {})

			-- Setup for telescope-ui-select.nvim
			require("telescope").setup({
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown({
							-- additional options can go here
						}),
					},
				},
			})
			require("telescope").load_extension("ui-select")

			-- Custom color picker setup
			-- local actions = require("telescope.actions")
			-- local action_state = require("telescope.actions.state")
			-- local pickers = require("telescope.pickers")
			-- local finders = require("telescope.finders")
			-- local sorters = require("telescope.sorters")

			-- local all_colors = {
			-- 	"catppuccin",
			-- 	"catppuccin-frappe",
			-- 	"catppuccin-latte",
			-- 	"catppuccin-macchiato",
			-- 	"codemonkey",
			-- 	"catppuccin-mocha",
			-- 	"desert",
			-- 	"elflord",
			-- 	"evening",
			-- 	"habamax",
			-- 	"industry",
			-- 	"koehler",
			-- 	"lunaperche",
			-- 	"murphy",
			-- 	"pablo",
			-- 	"peachpuff",
			-- 	"quiet",
			-- 	"ron",
			-- 	"slate",
			-- 	"torte",
			-- 	"oh-lucy",
			-- 	"oh-lucy-evening",
			-- 	"onedark",
			-- 	"onedarker",
			-- 	"onedarkest",
			-- }
                -- local all_colors ={ "onedark"}

			-- local function enter(prompt_bufnr)
			-- 	local selected = action_state.get_selected_entry()
			-- 	if selected then
			-- 		vim.cmd("colorscheme " .. selected.value)
			-- 		actions.close(prompt_bufnr)
			-- 	end
			-- end

			-- local function next_color(prompt_bufnr)
			-- 	actions.move_selection_next(prompt_bufnr)
			-- 	local selected = action_state.get_selected_entry()
			-- 	vim.cmd("colorscheme " .. selected.value)
			-- end

			-- local function prev_color(prompt_bufnr)
			-- 	actions.move_selection_previous(prompt_bufnr)
			-- 	local selected = action_state.get_selected_entry()
			-- 	vim.cmd("colorscheme " .. selected.value)
			-- end
			--
			-- local opts = {
			-- 	finder = finders.new_table(all_colors),
			-- 	sorter = sorters.get_generic_fuzzy_sorter({}),
			-- 	attach_mappings = function(prompt_bufnr, map)
			-- 		map("i", "<CR>", enter)
			-- 		map("i", "<Down>", next_color)
			-- 		map("i", "<Up>", prev_color)
			-- 		map("n", "<CR>", enter)
			-- 		map("n", "<Down>", next_color)
			-- 		map("n", "<Up>", prev_color)
			-- 		return true
			-- 	end,
			-- 	theme = "dropdown",
			-- }

			-- local colors = pickers.new(opts)
			-- vim.keymap.set("n", "<leader>cp", function()
			-- 	colors:find()
			-- end, { desc = "Color Picker" })
		end,
	},
	{
		"nvim-telescope/telescope-ui-select.nvim",
	},
}
