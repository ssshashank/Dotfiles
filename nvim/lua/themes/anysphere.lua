local M = {}

function M.setup()
  -- Set a dark background and clear any existing highlights.
  vim.o.background = "dark"
  vim.cmd("highlight clear")
  if vim.fn.exists("syntax_on") == 1 then
    vim.cmd("syntax reset")
  end
  vim.g.colors_name = "anysphere"

  -- Base colors from the Anysphere XML <colors> section
  local c = {
    -- Core UI colors
    background         = "#181925", -- from CONSOLE_BACKGROUND_KEY, GUTTER_BACKGROUND
    foreground         = "#d6d6dd", -- CARET_COLOR
    cursorline_bg      = "#181825", -- CARET_ROW_COLOR
    gutter_bg          = "#181818", -- GUTTER_BACKGROUND
    line_nr            = "#535353", -- LINE_NUMBERS_COLOR
    cursorline_nr      = "#c2c2c2", -- LINE_NUMBER_ON_CARET_ROW_COLOR
    selection_bg       = "#163761", -- SELECTION_BACKGROUND
    indent_guide       = "#383838", -- INDENT_GUIDE
    whitespace_fg      = "#737373", -- WHITESPACES

    -- Syntax and code colors
    keyword            = "#84E1BC",
    string             = "#e394dc",
    function_fg        = "#efb080",
    comment            = "#6d6d6d",
    constant           = "#ebc88d",
    variable           = "#aa9bf5",
    operator           = "#d6d6dd",
    type_fg            = "#c2c2c2",
  }

  -- Core UI highlight groups
  local base_overrides = {
    Normal       = { fg = c.foreground, bg = c.background },
    CursorLine   = { bg = c.cursorline_bg },
    Visual       = { bg = c.selection_bg },
    SignColumn   = { bg = c.gutter_bg },
    LineNr       = { fg = c.line_nr, bg = c.background },
    CursorLineNr = { fg = c.cursorline_nr, bg = c.background },
    SpecialKey   = { fg = c.whitespace_fg },
    Cursor       = { fg = c.foreground },
  }

  for group, opts in pairs(base_overrides) do
    vim.api.nvim_set_hl(0, group, opts)
  end

  -- Syntax highlighting groups
  local syntax_overrides = {
    Comment    = { fg = c.comment, italic = true },
    Constant   = { fg = c.constant },
    String     = { fg = c.string },
    Identifier = { fg = c.variable },
    Function   = { fg = c.function_fg },
    Statement  = { fg = c.keyword },
    Operator   = { fg = c.operator },
    Type       = { fg = c.type_fg },
    Special    = { fg = c.keyword },
  }

  for group, opts in pairs(syntax_overrides) do
    vim.api.nvim_set_hl(0, group, opts)
  end

  -- Additional groups from the XML <attributes> section
  local extra_overrides = {
    -- Example: BAD_CHARACTER: sets a background for invalid characters.
    BadChar = { bg = "#6e3b3b" },

    -- Example: BREAKPOINT_ATTRIBUTES: a background for breakpoints.
    Breakpoint = { bg = "#743d3d" },

    -- Buildout related colors.
    BuildoutKey               = { fg = "#83d6c5" },
    BuildoutKeyValueSeparator = { fg = "#d6d6dd" },
    BuildoutLineComment       = { fg = "#6d6d6d", italic = true },
    BuildoutSectionName       = { fg = "#ebc88d" },
    BuildoutValue             = { fg = "#e394dc" },

    -- Class reference example.
    ClassReference = { fg = "#efb080" },

    -- (You can continue mapping additional XML attributes to Neovim groups.)
  }

  for group, opts in pairs(extra_overrides) do
    vim.api.nvim_set_hl(0, group, opts)
  end

  -- (Optional) Add any plugin-specific or filetype-specific highlight groups here.
end

return M
