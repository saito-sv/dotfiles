-- themes.lua
local M = {}

-- Function to detect macOS system theme
local function detect_macos_theme()
  if vim.fn.has("mac") == 1 then
    local is_dark = vim.fn.system("defaults read -g AppleInterfaceStyle 2>/dev/null"):match("Dark")
    local new_background = is_dark and "dark" or "light"
    vim.o.background = new_background
    return new_background
  end
  return vim.o.background -- Default to current setting if not on macOS
end

M.setup = function()
  -- Detect theme on startup
  local theme_mode = detect_macos_theme()

  -- Set popup menu blend to 0 (fully opaque)
  vim.opt.pumblend = 0
  vim.opt.winblend = 0

  -- Ensure terminal colors work properly with Dracula
  -- Set terminal colors to match Dracula theme
  vim.g.terminal_color_0 = "#282a36"
  vim.g.terminal_color_1 = "#ff5555"
  vim.g.terminal_color_2 = "#50fa7b"
  vim.g.terminal_color_3 = "#f1fa8c"
  vim.g.terminal_color_4 = "#bd93f9"
  vim.g.terminal_color_5 = "#ff79c6"
  vim.g.terminal_color_6 = "#8be9fd"
  vim.g.terminal_color_7 = "#f8f8f2"
  vim.g.terminal_color_8 = "#4d4d4d"
  vim.g.terminal_color_9 = "#ff6e6e"
  vim.g.terminal_color_10 = "#69ff94"
  vim.g.terminal_color_11 = "#ffffa5"
  vim.g.terminal_color_12 = "#d6acff"
  vim.g.terminal_color_13 = "#ff92d0"
  vim.g.terminal_color_14 = "#a4ffff"
  vim.g.terminal_color_15 = "#ffffff"
  vim.g.terminal_color_background = "#282a36"
  vim.g.terminal_color_foreground = "#f8f8f2"

  -- Configure Dracula theme
  local dracula_options = {
    transparent_bg = true,
    italic_comment = true,
    show_end_of_buffer = true,
    underline_style = "curl",
    undercurl = true,
  }

  -- Setup Dracula theme
  require("dracula").setup(dracula_options)

  -- Set colorscheme
  vim.cmd.colorscheme("dracula")

  -- Apply additional transparency settings after the colorscheme is loaded
  vim.api.nvim_command("hi Normal guibg=NONE ctermbg=NONE")
  vim.api.nvim_command("hi NormalNC guibg=NONE ctermbg=NONE")
  vim.api.nvim_command("hi EndOfBuffer guibg=NONE ctermbg=NONE")
  vim.api.nvim_command("hi SignColumn guibg=NONE ctermbg=NONE")

  -- Custom highlight groups for better Dracula integration
  vim.api.nvim_command("hi LineNr guibg=NONE guifg=#6272a4")
  vim.api.nvim_command("hi CursorLineNr guibg=NONE guifg=#bd93f9 gui=bold")
  vim.api.nvim_command("hi VertSplit guibg=NONE guifg=#44475a")
  vim.api.nvim_command("hi StatusLine guibg=NONE guifg=#f8f8f2")
  vim.api.nvim_command("hi StatusLineNC guibg=NONE guifg=#6272a4")
  vim.api.nvim_command("hi TabLine guibg=NONE guifg=#6272a4")
  vim.api.nvim_command("hi TabLineFill guibg=NONE")
  vim.api.nvim_command("hi TabLineSel guibg=#44475a guifg=#f8f8f2 gui=bold")
  vim.api.nvim_command("hi Visual guibg=#44475a guifg=NONE")
  vim.api.nvim_command("hi CursorLine guibg=#44475a guifg=NONE")

  -- File explorer highlights
  vim.api.nvim_command("hi NeoTreeNormal guibg=NONE")
  vim.api.nvim_command("hi NeoTreeEndOfBuffer guibg=NONE")

  -- FZF-lua specific highlights
  vim.api.nvim_command("hi FzfLuaNormal guibg=NONE")
  vim.api.nvim_command("hi FzfLuaBorder guifg=#6272a4 guibg=NONE")

  -- Floating windows should have background for readability
  vim.api.nvim_command("hi NormalFloat guibg=#282a36")
  vim.api.nvim_command("hi FloatBorder guifg=#6272a4 guibg=#282a36")
end

return M
