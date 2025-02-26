--mason.nvim is a Neovim plugin that allows you to easily manage external editor tooling such as LSP servers,
return {
	{
		"williamboman/mason.nvim",
		lazy = false,
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		lazy = false,
		opts = {
			auto_install = true,
			ensure_installed = {
				"lua_ls",
				"ts_ls",
				"rust_analyzer",
				"gopls",
				"pyright",
				"bashls",
				"jsonls",
				"yamlls",
				"html",
				"cssls",
				"tailwindcss",
				"svelte",
				"astro",
				"sqlls",
				"prismals",
			},
		},
	},
	{
		"neovim/nvim-lspconfig",
		lazy = false,
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			local lspConfig = require("lspconfig")
			lspConfig.lua_ls.setup({
				capabilities = capabilities,
			})
			lspConfig.solargraph.setup({
				capabilities = capabilities,
			})
			lspConfig.cssls.setup({
				capabilities = capabilities,
			})
			lspConfig.jsonls.setup({
				capabilities = capabilities,
			})
			lspConfig.tailwindcss.setup({
				capabilities = capabilities,
			})

			lspConfig.html.setup({
				capabilities = capabilities,
			})
			lspConfig.ts_ls.setup({
				capabilities = capabilities,
				handlers = {
					["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
						virtual_text = false,
						signs = false,
						underline = true,
						update_in_insert = false,
					}),
				},
			})
			lspConfig.rust_analyzer.setup({
				capabilities = capabilities,
			})
			lspConfig.gopls.setup({
				capabilities = capabilities,
				cmd = { "gopls" },
				filetypes = { "go", "gomod" },
				root_dir = function(fname)
					return require("lspconfig.util").root_pattern("go.mod", ".git")(fname) or vim.loop.os_homedir()
				end,
				settings = {
					gopls = {
						completeUnimported = true,
						usePlaceholders = true,
						analyses = {
							unusedparams = true,
							nilness = true,
							shadow = true,
							buildtag = true,
							printf = true,
							unreachable = true,
							unsafeptr = true,
						},
						staticcheck = true,
						gofumpt = true,
						codelenses = {
							generate = true,
							gc_details = true,
							gc_details_all = true,
							gc_unused = true,
							shadow = true,
							unused = true,
							unusedparams = true,
						},
					},
				},
			})
			vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
			vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, {})
			vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})

			-- Set LSP UI Highlight Groups
			vim.api.nvim_set_hl(0, "LspDiagnosticsDefaultError", { fg = "#FF6C6B", bg = "#141617" })
			vim.api.nvim_set_hl(0, "LspDiagnosticsDefaultWarning", { fg = "#ECBE7B", bg = "#141617" })
			vim.api.nvim_set_hl(0, "LspDiagnosticsDefaultInformation", { fg = "#51AFEF", bg = "#141617" })
			vim.api.nvim_set_hl(0, "LspDiagnosticsDefaultHint", { fg = "#98BE65", bg = "#141617" })

			-- For LSP floating windows
			vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#141617" })
			vim.api.nvim_set_hl(0, "FloatBorder", { fg = "#51AFEF", bg = "#141617" })
		end,
	},
}
