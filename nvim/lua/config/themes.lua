-- themes.lua
local M = {}

M.setup = function()
  -- Set popup menu blend to 0 (fully opaque)
  vim.opt.pumblend = 0
  vim.opt.winblend = 0

  -- Configure Rose Pine theme
  require("rose-pine").setup({
    variant = "main",      -- "main" | "moon" | "dawn"
    dark_variant = "main",
    dim_inactive_windows = false,
    extend_background_behind_borders = true,

    enable = {
      terminal = true,
      legacy_highlights = true,
      migrations = true,
    },

    styles = {
      bold = true,
      italic = true,
      transparency = true,
    },

    -- Only override what we need; Rose Pine handles the rest
    highlight_groups = {
      -- Transparency
      Normal = { bg = "NONE" },
      NormalNC = { bg = "NONE" },
      EndOfBuffer = { bg = "NONE" },
      SignColumn = { bg = "NONE" },

      -- Splits
      VertSplit = { fg = "muted", bg = "NONE" },
      WinSeparator = { fg = "muted", bg = "NONE" },

      -- Status line
      StatusLine = { fg = "subtle", bg = "NONE" },
      StatusLineNC = { fg = "muted", bg = "NONE" },

      -- Tabs
      TabLine = { fg = "muted", bg = "NONE" },
      TabLineFill = { bg = "NONE" },

      -- Floating windows
      NormalFloat = { bg = "surface" },
      FloatBorder = { fg = "muted", bg = "surface" },

      -- NeoTree transparency
      NeoTreeNormal = { bg = "NONE" },
      NeoTreeNormalNC = { bg = "NONE" },
      NeoTreeEndOfBuffer = { bg = "NONE" },

      -- FZF-lua
      FzfLuaNormal = { bg = "NONE" },
      FzfLuaBorder = { fg = "muted", bg = "NONE" },
    },
  })

  -- Set colorscheme
  vim.cmd.colorscheme("rose-pine")
end

return M
