-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set("n", "<leader>ww", ":update<cr>", { desc = "Write Buffer", silent = true })
vim.keymap.set("i", "jk", "<Esc>")
