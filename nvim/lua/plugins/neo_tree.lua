-- Neo-tree is a Neovim plugin to browse the file system and other tree like structures in whatever style suits you, including sidebars, floating windows, netrw split style, or all of them at once!
return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
        "MunifTanjim/nui.nvim",
        -- {"3rd/image.nvim", opts = {}}, -- Optional image support in preview window: See `# Preview Mode` for more information
    },
    keys = {
        { "<C-n>",     ":Neotree toggle left<CR>",  silent = true, desc = "Left File Explorer" },
        { "<leader>e", ":Neotree toggle float<CR>", silent = true, desc = "Float File Explorer" },
    },
    config = function()
        require("neo-tree").setup({
            close_if_last_window = true,
            popup_border_style = "single",
            enable_git_status = true,
            enable_modified_markers = true,
            enable_diagnostics = true,
            sort_case_insensitive = true,
            default_component_configs = {
                indent = {
                    -- with_markers = true,
                    -- with_expanders = true,
                },
                modified = {
                    symbol = "M",
                    highlight = "NeoTreeModified",
                },
                icon = {
                    default = "",
                    folder_closed = "",
                    folder_open = "",
                    folder_empty = "",
                    folder_empty_open = "",
                },
                git_status = {
                    symbols = {
                        -- Change type
                        added = "A",
                        deleted = "D",
                        modified = "M",
                        renamed = "",
                        -- Status type
                        untracked = "",
                        ignored = "",
                        unstaged = "",
                        staged = "",
                        conflict = "",
                    },
                },
            },
            window = {
                position = "float",
                width = 35,
            },
            filesystem = {
                use_libuv_file_watcher = true,
                filtered_items = {
                    hide_dotfiles = false,
                    hide_gitignored = false,
                    hide_by_name = {
                        -- "node_modules",
                    },
                    never_show = {
                        ".DS_Store",
                        "thumbs.db",
                    },
                },
            },
            source_selector = {
                winbar = true,
                sources = {
                    { source = "filesystem", display_name = " Files " },
                    { source = "buffers", display_name = "  Bufs " },
                    { source = "git_status", display_name = "  Git " },
                },
            },
            event_handlers = {
                {
                    event = "neo_tree_window_after_open",
                    handler = function(args)
                        if args.position == "left" or args.position == "right" then
                            vim.cmd("wincmd =")
                        end
                    end,
                },
                {
                    event = "neo_tree_window_after_close",
                    handler = function(args)
                        if args.position == "left" or args.position == "right" then
                            vim.cmd("wincmd =")
                        end
                    end,
                },
            },
        })

        -- Change the background color of NeoTree
        vim.api.nvim_set_hl(0, "NeoTreeNormal", { bg = "#141617", fg = "#CDD6F4" }) -- Main window
        vim.api.nvim_set_hl(0, "NeoTreeNormalNC", { bg = "#141617", fg = "#CDD6F4" }) -- Inactive windows
        vim.api.nvim_set_hl(0, "NeoTreeEndOfBuffer", { bg = "#141617", fg = "#1C2021" }) -- Remove `~` at end
        vim.api.nvim_set_hl(0, "NeoTreeCursorLine", { bg = "#3C4048" })            -- Highlight current line

        -- Highlight Groups for `source_selector`
        vim.api.nvim_set_hl(0, "NeoTreeTabActive", { bg = "#282C34", fg = "#CDD6F4", bold = true }) -- Active source tab
        vim.api.nvim_set_hl(0, "NeoTreeTabInactive", { bg = "#141617", fg = "#5B6268" })      -- Inactive source tabs
        vim.api.nvim_set_hl(0, "NeoTreeTabSeparatorActive", { bg = "#282C34", fg = "#3C4048" }) -- Separator for active tabs
        vim.api.nvim_set_hl(0, "NeoTreeTabSeparatorInactive", { bg = "#141617", fg = "#3C4048" }) -- Separator for inactive tabs

    end,
}

