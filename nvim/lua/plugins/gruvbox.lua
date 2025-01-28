return {
    "sainnhe/gruvbox-material",
    priority = 1000, -- Ensure it loads first
    config = function()
        -- 1. Set Gruvbox Material Theme Options
        vim.g.gruvbox_material_background = "hard"  -- "soft" | "medium" | "hard"
        vim.g.gruvbox_material_foreground = "material" -- "material" | "mix" | "original"
        vim.g.gruvbox_material_enable_italic = 1    -- Enable italics
        vim.g.gruvbox_material_transparent_background = 0 -- Ensure background is solid

        -- 2. Apply the color scheme
        vim.cmd("colorscheme gruvbox-material")

        -- 3. Override Primary (Orange) Colors to a Light Color

        -- 4. Override the background color
        vim.api.nvim_set_hl(0, "Normal", { bg = "#1C2021", fg = "#CDD6F4" })
        vim.api.nvim_set_hl(0, "NormalNC", { bg = "#1C2021", fg = "#CDD6F4" })
        vim.api.nvim_set_hl(0, "SignColumn", { bg = "#1C2021" })          -- Fix for gutter
        vim.api.nvim_set_hl(0, "VertSplit", { bg = "#1C2021", fg = "#3C4048" }) -- Split borders
        vim.api.nvim_set_hl(0, "StatusLine", { bg = "#1C2021", fg = "#CDD6F4", bold = true })
        vim.api.nvim_set_hl(0, "StatusLineNC", { bg = "#1C2021", fg = "#5B6268" })

        -- 5. Override UI Elements (Bufferline, NeoTree, etc.)
        -- vim.api.nvim_set_hl(0, "NeoTreeNormal", { bg = "#1C2021", fg = "#CDD6F4" })
        -- vim.api.nvim_set_hl(0, "BufferLineFill", { bg = "#1C2021", fg = "#CDD6F4" })
        -- vim.api.nvim_set_hl(0, "BufferLineBackground", { bg = "#1C2021", fg = "#5B6268" })
    end,
}


