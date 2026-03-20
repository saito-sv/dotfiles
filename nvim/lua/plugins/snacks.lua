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
      -- ── Explorer ──────────────────────────────────────────────────────────
      explorer = {
        enabled = true,
      },

      -- ── Notifier ──────────────────────────────────────────────────────────
      notifier = {
        enabled = true,
      },

      -- ── Quickfile ─────────────────────────────────────────────────────────
      quickfile = {
        enabled = true,
      },

      -- ── Status column ─────────────────────────────────────────────────────
      statuscolumn = {
        enabled = true,
      },

      -- ── Words ─────────────────────────────────────────────────────────────
      words = {
        enabled = true,
      },

      -- ── Rename ────────────────────────────────────────────────────────────
      rename = {
        enabled = true,
      },
    },
  },
  -- Disable neo-tree since we use snacks explorer
  {
    "neo-tree.nvim",
    enabled = false,
  },
}
