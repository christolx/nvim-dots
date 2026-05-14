-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

-- Disable stupid-ahh auto spell checking
vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

-- When opening nvim on a directory, keep tab cwd aligned with that directory.
-- Snacks replaces the directory buffer with its explorer, but LazyVim's
-- <leader>e keymap still resolves from cwd/root on later reopen.
vim.api.nvim_create_autocmd("BufEnter", {
  group = vim.api.nvim_create_augroup("icemotion_directory_cwd", { clear = true }),
  callback = function(ev)
    if ev.file == "" or vim.fn.isdirectory(ev.file) ~= 1 then
      return
    end

    vim.cmd.tcd(vim.fs.normalize(ev.file))
  end,
})
