return {
  {
    "rose-pine/neovim",
    name = "rose-pine",
    priority = 1000,
    lazy = false,
    config = function()
      -- Call the setup function from our themes module
      require("config.themes").setup()
    end,
  },
  -- Set LazyVim to use rose-pine as default
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "rose-pine",
    },
  },
  {
    "folke/trouble.nvim",
    opts = { use_diagnostic_signs = true },
  },
  {
    "akinsho/bufferline.nvim",
    event = "VeryLazy",
    opts = {
      options = {
        mode = "tabs",
        show_buffer_close_icons = false,
        show_close_icon = false,
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      inlay_hints = { enabled = false },
    },
  },
  {
    "folke/noice.nvim",
    opts = {
      cmdline = {
        view = "cmdline",
      },
      presets = {
        bottom_search = true,
        command_palette = false,
      },
    },
  },
}
