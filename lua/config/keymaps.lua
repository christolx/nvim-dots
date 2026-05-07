-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Only yanks go to system clipboard
vim.keymap.set({ "n", "x" }, "y", '"+y', { desc = "Yank to system clipboard" })
vim.keymap.set("n", "Y", '"+Y', { desc = "Yank line to system clipboard" })
