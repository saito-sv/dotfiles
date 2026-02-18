return {
  {
    "ibhagwan/fzf-lua",
    opts = {
      -- Global settings
      winopts = {
        split = "belowright 10new",
        preview = {
          hidden = "hidden",
        },
      },
      fzf_opts = {
        ["--layout"] = "default",
      },
      -- Optimized grep settings
      grep = {
        prompt = "Rg❯ ",
        input_prompt = "Grep For❯ ",
        multiprocess = true,
        git_icons = true,
        file_icons = true,
        color_icons = true,
        rg_opts = "--column --line-number --no-heading --color=always --smart-case --max-columns=4096",
        rg_glob = true,
        glob_flag = "--glob",
        glob_separator = "%s%-%-",
      },
      -- Live grep specific optimizations
      live_grep = {
        prompt = "Live Grep❯ ",
        multiprocess = true,
        git_icons = true,
        file_icons = true,
        color_icons = true,
        rg_opts = "--column --line-number --no-heading --color=always --smart-case --max-columns=4096",
        -- Performance optimizations
        exec_empty_query = false,
        search_limit = 2048,
      },
      -- File search optimizations
      files = {
        prompt = "Files❯ ",
        multiprocess = true,
        git_icons = true,
        file_icons = true,
        color_icons = true,
        find_opts = [[-type f -not -path '*/\.git/*' -printf '%P\n']],
        rg_opts = "--files --hidden --follow -g '!.git'",
        fd_opts = "--color=never --type f --hidden --follow --exclude .git",
      },
      -- Buffer search
      buffers = {
        prompt = "Buffers❯ ",
        file_icons = true,
        color_icons = true,
        sort_lastused = true,
      },
      -- Help tags
      helptags = {
        prompt = "Help❯ ",
      },
    },
    keys = {
      -- files
      { ";f", "<cmd>FzfLua files<cr>", desc = "Find Files (fzf-lua)" },
      -- live grep
      { ";r", "<cmd>FzfLua live_grep<cr>", desc = "Live Grep (fzf-lua)" },
      -- grep word under cursor
      { ";w", "<cmd>FzfLua grep_cword<cr>", desc = "Grep Word Under Cursor (fzf-lua)" },
      -- grep visual selection
      { ";v", "<cmd>FzfLua grep_visual<cr>", mode = "v", desc = "Grep Visual Selection (fzf-lua)" },
      -- buffers
      { "\\", "<cmd>FzfLua buffers<cr>", desc = "List Buffers (fzf-lua)" },
      -- help tags
      { "<leader>fh", "<cmd>FzfLua help_tags<cr>", desc = "Help Tags (fzf-lua)" },
      -- git files (faster than regular files in git repos)
      { "<leader>gf", "<cmd>FzfLua git_files<cr>", desc = "Git Files (fzf-lua)" },
      -- recent files
      { "<leader>fr", "<cmd>FzfLua oldfiles<cr>", desc = "Recent Files (fzf-lua)" },
      {
        "sf",
        function()
          -- Use the current buffer's directory as the 'cwd' for file searching
          require("fzf-lua").files({
            cwd = vim.fn.expand("%:p:h"),
          })
        end,
        desc = "List files in the current folder (fzf-lua)",
      },
      {
        ";c", -- 'sn' for "new file"
        function()
          local new_file_name = vim.fn.input("Create new file: ", vim.fn.expand("%:p:h") .. "/")
          if new_file_name ~= "" then
            vim.cmd("e " .. new_file_name)
          end
        end,
        desc = "Create new file in current folder",
      },
    },
  },
}
