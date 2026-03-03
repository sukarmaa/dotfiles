-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- Detect OS and set default line endings
if vim.loop.os_uname().sysname == "Windows_NT" then
  -- Windows: use CRLF
  vim.o.fileformat = "dos"
else
  -- Unix/Linux/macOS: use LF
  vim.o.fileformat = "unix"
end

vim.o.exrc = true -- enable per-directory config
-- vim.o.secure = true -- safer mode (recommended)
