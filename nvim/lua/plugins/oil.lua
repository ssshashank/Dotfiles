return {
    "stevearc/oil.nvim",
    config = function()
        local oil = require("oil")
        oil.setup({
            default_file_explorer = false,
            default_file_explorer_width = 30,
            default_file_explorer_height = 30,
            default_file_explorer_position = "bottom",
            file_explorer = {
                width = 30,
                height = 30,
                position = "bottom",
            },
        })
        vim.keymap.set("n", "-", oil.toggle_float, {})
    end,
}
