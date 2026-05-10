-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- Do NOT make every delete/change/yank use system clipboard
vim.opt.clipboard = ""

-- Set to "ty" to use ty instead of pyright.
vim.g.lazyvim_python_lsp = "ty"
-- Set to "ruff_lsp" to use the old LSP implementation version.
vim.g.lazyvim_python_ruff = "ruff"

-- Improve indentation during line wraps
vim.opt.wrap = true
vim.opt.linebreak = true
vim.opt.breakindent = true
vim.opt.showbreak = "↪ "
vim.opt.breakindentopt = "shift:2"
vim.opt.cpoptions:append("n")
