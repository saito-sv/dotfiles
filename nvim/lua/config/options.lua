-- Enable cursor line and word highlighting
--vim.opt.cursorline = true -- Highlight the current line
-- Add this to your lua/config/options.lua
--vim.opt.cursorline = false -- Disable the cursor line completely
vim.g.lazyvim_python_lsp = "pyright"
vim.g.lazyvim_python_ruff = "ruff"

-- Go templates (leave Helm charts alone: anything under a Chart.yaml is "helm")
local function tmpl_ft(path)
  if vim.fs.root(path, "Chart.yaml") then
    return "helm"
  end
  return "gotmpl"
end

vim.filetype.add({
  extension = { gotmpl = "gotmpl", tmpl = tmpl_ft },
  pattern = { [".*%.go%.tmpl"] = tmpl_ft },
})
