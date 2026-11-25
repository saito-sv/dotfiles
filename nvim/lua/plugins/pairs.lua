return {
  {
    "nvim-mini/mini.pairs",
    opts = function(_, opts)
      -- Rust: ' is mostly lifetimes (&'a, <'a), so don't auto-pair it
      vim.api.nvim_create_autocmd("FileType", {
        pattern = "rust",
        callback = function(ev)
          vim.keymap.set("i", "'", "'", { buffer = ev.buf })
        end,
      })
      return opts
    end,
  },
}
