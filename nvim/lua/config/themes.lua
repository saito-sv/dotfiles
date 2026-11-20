-- themes.lua
local M = {}

-- "light" or "dark", written by ~/.local/bin/theme-toggle
local function mode()
  local f = io.open(vim.fn.expand("~/.config/theme-mode"))
  local m = f and f:read("*l") or "dark"
  if f then f:close() end
  return m == "light" and "light" or "dark"
end

M.apply = function()
  vim.g.everforest_background = "hard" -- "hard" | "medium" | "soft"
  vim.g.everforest_enable_italic = 1
  vim.g.everforest_better_performance = 1
  vim.o.background = mode()
  vim.cmd.colorscheme("everforest")
end

M.setup = function()
  M.apply()
  -- pick up theme-toggle in already-running instances
  vim.api.nvim_create_autocmd("FocusGained", {
    callback = function()
      if vim.o.background ~= mode() then M.apply() end
    end,
  })
end

return M
