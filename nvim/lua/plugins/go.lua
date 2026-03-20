return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        gopls = {
          settings = {
            gopls = {
              analyses = {
                -- Disable noisy style/comment analyzers
                ST1000 = false, -- package comment style
                ST1003 = false, -- naming conventions (CamelCase, etc.)
                ST1016 = false, -- methods on same type should have same receiver name
                ST1020 = false, -- exported function comment style
                ST1021 = false, -- exported type comment style
                ST1022 = false, -- exported variable comment style
              },
            },
          },
        },
      },
    },
  },
}
