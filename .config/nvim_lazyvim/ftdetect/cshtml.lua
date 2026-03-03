---@diagnostic disable: undefined-global
vim.filetype.add({
  extension = {
    cshtml = "razor",
  },
})
vim.api.nvim_create_autocmd("FileType", {
  pattern = "razor",
  callback = function()
    -- Indentation
    vim.opt_local.expandtab = true -- spaces, not tabs
    vim.opt_local.shiftwidth = 4 -- indentation width
    vim.opt_local.tabstop = 4 -- tab key = 4 spaces
    vim.opt_local.softtabstop = 4 -- backspace spacing
    vim.opt_local.autoindent = true -- copy indent from prev line
    vim.opt_local.smartindent = true -- sensible C‑like indenting

    -- Display settings
    vim.opt_local.textwidth = 0 -- no auto line wrap
    vim.opt_local.wrap = false -- disable wrap
    vim.opt_local.colorcolumn = "80" -- guideline at 80ch

    -- Enable syntax
    vim.cmd("syntax on") -- ensure syntax is on

    -- Optional: Use HTML indentation rules too
    vim.cmd("setlocal indentexpr=")
    vim.cmd("setlocal indentkeys=0{,0},:,0#,!^F") -- basic HTML‑style indent keys
  end,
})
