
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
                -- numbers = "id",
                indicator = {
                    style = "none", -- Change indicator style (can be "none", "underline", "icon", etc.)
                },
                padding = 0,
                -- separator_style = "slant",
                show_buffer_close_icons = true,
                show_close_icon = false,
                max_name_length = 18,
                tab_size = 20,
                diagnostics = "nvim_lsp", -- Display diagnostics in the bufferline
                left_trunc_marker = "",
                right_trunc_marker = "",
                show_tab_indicators = false,
                always_show_bufferline = true,
                diagnostics_indicator = function(_, _, diagnostics_dict, _)
                    local s = " "
                    for e, n in pairs(diagnostics_dict) do
                        local sym = e == "error" and "   " or (e == "warning" and "   " or "   ")
                        s = s .. n .. sym
                    end
                    return s
                end,
            },
        })

        -- Custom highlight groups for Bufferline
        -- vim.api.nvim_set_hl(0, "BufferLineFill", { bg = "#1C2021", fg = "#CDD6F4" }) -- Background
        -- vim.api.nvim_set_hl(0, "BufferLineBackground", { bg = "#1C2021", fg = "#5B6268" }) -- Inactive buffers
        -- vim.api.nvim_set_hl(0, "BufferLineBufferVisible", { bg = "#1C2021", fg = "#5B6268" }) -- Visible but inactive
        -- vim.api.nvim_set_hl(0, "BufferLineBufferSelected", { bg = "#1C2021", fg = "#CDD6F4", bold = true }) -- Active buffer
        -- vim.api.nvim_set_hl(0, "BufferLineTab", { bg = "#1C2021", fg = "#5B6268" }) -- Inactive tabs
        -- vim.api.nvim_set_hl(0, "BufferLineTabSelected", { bg = "#1C2021", fg = "#CDD6F4", bold = true }) -- Active tab
        -- vim.api.nvim_set_hl(0, "BufferLineTabClose", { bg = "#1C2021", fg = "#5B6268" }) -- Tab close icon
        -- vim.api.nvim_set_hl(0, "BufferLineSeparator", { bg = "#1C2021", fg = "#3C4048" }) -- Separator between buffers
        -- vim.api.nvim_set_hl(0, "BufferLineSeparatorSelected", { bg = "#1C2021", fg = "#3C4048" }) -- Separator for active buffer
        -- vim.api.nvim_set_hl(0, "BufferLineIndicatorSelected", { bg = "#1C2021", fg = "#3C4048" }) -- Indicator for active buffer
        -- vim.api.nvim_set_hl(0, "BufferLineModified", { bg = "#1C2021", fg = "#5B6268" }) -- Modified buffer
        -- vim.api.nvim_set_hl(0, "BufferLineModifiedSelected", { bg = "#1C2021", fg = "#CDD6F4" }) -- Modified and active buffer
    end,
}

