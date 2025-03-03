return {
  {
    "ibhagwan/fzf-lua",
    -- 1) Normal Neovim keymaps to launch fzf-lua commands
    keys = {
      -- files
      { ";f", "<cmd>FzfLua files<cr>", desc = "Find Files (fzf-lua)" },
      -- live grep
      { ";r", "<cmd>FzfLua live_grep<cr>", desc = "Live Grep (fzf-lua)" },
      -- buffers
      { "\\", "<cmd>FzfLua buffers<cr>", desc = "List Buffers (fzf-lua)" },
      -- help tags
      { "<leader>fh", "<cmd>FzfLua help_tags<cr>", desc = "Help Tags (fzf-lua)" },
      {
        "sf",
        function()
          -- Use the current buffer’s directory as the 'cwd' for file searching
          require("fzf-lua").files({
            cwd = vim.fn.expand("%:p:h"),
          })
        end,
        desc = "List files in the current folder (fzf-lua)",
      },
    },
  },
}
