-- themes.lua
local M = {}

M.setup = function()
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
      transparency = false,
    },
  })

  -- Set colorscheme
  vim.cmd.colorscheme("rose-pine")
end

return M
