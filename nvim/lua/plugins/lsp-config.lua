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
            ensure_installed = { "lua_ls", "ts_ls", "rust_analyzer", "gopls", "pyright", "bashls", "jsonls", "yamlls", "html", "cssls", "tailwindcss", "svelte", "astro", "sqlls", "prismals", }
        },
        --config = function()
        --require("mason-lspconfig").setup({
        --ensure_installed = { "lua_ls", "tsserver", "rust_analyzer" }
        --})
        --end
    },
    {
        "neovim/nvim-lspconfig",
        lazy = false,
        config = function()
            vim.diagnostic.config({
                virtual_text = false,     -- Disable virtual text (inline messages)
                signs = false,            -- Disable signs in the gutter
                underline = true,         -- Keep the red underline
                update_in_insert = false, -- Don't update diagnostics in insert mode
                severity_sort = true,
                float = {                 -- Configure the float window
                    show_header = false,
                    source = false,
                    border = "rounded",
                    header = "",
                },
            })
            local capabilities = require("cmp_nvim_lsp").default_capabilities()
            local lspConfig = require("lspconfig")
            lspConfig.lua_ls.setup({
                capabilities = capabilities,
            })
            lspConfig.solargraph.setup({
                capabilities = capabilities,
            })
            lspConfig.html.setup({
                capabilities = capabilities,
            })
            lspConfig.ts_ls.setup({
                capabilities = capabilities,
                handlers = {
                    ["textDocument/publishDiagnostics"] = vim.lsp.with(
                        vim.lsp.diagnostic.on_publish_diagnostics, {
                            virtual_text = false,
                            signs = false,
                            underline = true,
                            update_in_insert = false,
                        }
                    )
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
        end,
    },
}
