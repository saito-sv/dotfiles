-- Python tweaks on top of LazyVim's `lang.python` extra (pyright + ruff, venv-selector, dap-python, neotest).
return {
  -- venv-selector is configured by the extra (loads on ft=python, `<leader>cv`).
  -- The last selected venv per project is re-activated automatically from cache.
  {
    "linux-cultist/venv-selector.nvim",
    keys = {
      { "<leader>vs", "<cmd>VenvSelect<cr>", desc = "Select VirtualEnv", ft = "python" },
    },
  },
  -- nvim-dap-python is set up with `debugpy-adapter`, which the extra doesn't install.
  {
    "mason-org/mason.nvim",
    opts = { ensure_installed = { "debugpy" } },
  },
}
