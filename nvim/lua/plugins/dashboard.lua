return {
  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    keys = {
      {
        "<leader>e",
        function()
          Snacks.explorer()
        end,
        desc = "Explorer (snacks)",
      },
    },
    opts = {
      dashboard = {
        enabled = true,
        preset = {
          header = [[
        ███████╗ █████╗ ██╗████████╗ ██████╗ 
        ██╔════╝██╔══██╗██║╚══██╔══╝██╔═══██╗
        ███████╗███████║██║   ██║   ██║   ██║
        ╚════██║██╔══██║██║   ██║   ██║   ██║
        ███████║██║  ██║██║   ██║   ╚██████╔╝
        ╚══════╝╚═╝  ╚═╝╚═╝   ╚═╝    ╚═════╝ 
        ]],
        },
      },
      explorer = {
        enabled = true,
      },
      notifier = {
        enabled = true,
      },
      quickfile = {
        enabled = true,
      },
      statuscolumn = {
        enabled = true,
      },
      words = {
        enabled = true,
      },
      rename = {
        enabled = true,
      },
    },
  },
  {
    "neo-tree.nvim",
    enabled = false,
  },
}
