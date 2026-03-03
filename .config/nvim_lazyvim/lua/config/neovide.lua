---@diagnostic disable: undefined-global

if not vim.g.neovide then
    return {}
end

-- =====================
-- Font
-- =====================
vim.o.guifont = "JetBrainsMono Nerd Font:h11"

-- =====================
-- Appearance
-- =====================
vim.g.neovide_opacity = 0.9
vim.g.neovide_background_color = "#0f1117"
vim.g.neovide_floating_blur_amount_x = 2.0
vim.g.neovide_floating_blur_amount_y = 2.0

-- Padding
vim.g.neovide_padding_top = 8
vim.g.neovide_padding_bottom = 8
vim.g.neovide_padding_left = 10
vim.g.neovide_padding_right = 10

-- =====================
-- Cursor Effects
-- =====================
-- vim.g.neovide_cursor_vfx_mode = "railgun" -- options: railgun, torpedo, pixiedust, sonicboom, ripple, wireframe
vim.g.neovide_cursor_animation_length = 0.08
vim.g.neovide_cursor_trail_size = 0.8
vim.g.neovide_cursor_antialiasing = true
vim.g.neovide_hide_mouse_when_typing = true

-- =====================
-- Scrolling
-- =====================
vim.g.neovide_scroll_animation_length = 0.15
vim.g.neovide_scroll_animation_far_lines = 1

-- =====================
-- Refresh Rate
-- =====================
vim.g.neovide_refresh_rate = 120
vim.g.neovide_refresh_rate_idle = 5

-- =====================
-- Fullscreen Toggle
-- =====================
vim.keymap.set("n", "<F11>", function()
    vim.g.neovide_fullscreen = not vim.g.neovide_fullscreen
end)

-- =====================
-- Transparency Toggle
-- =====================
vim.keymap.set("n", "<leader>tt", function()
    if vim.g.neovide_opacity == 1.0 then
        vim.g.neovide_opacity = 0.9
    else
        vim.g.neovide_opacity = 1.0
    end
end, { desc = "Toggle Neovide Transparency", silent = true })

-- =====================
-- Copy and Paste Keymap
-- =====================
local function save()
    vim.cmd.write()
end
local function copy()
    vim.cmd([[normal! "+y]])
end
local function paste()
    vim.api.nvim_paste(vim.fn.getreg("+"), true, -1)
end
vim.keymap.set({ "n", "i", "v" }, "<C-s>", save, { desc = "Save" })
vim.keymap.set("v", "<C-S-c>", copy, { silent = true, desc = "Copy" })
vim.keymap.set({ "n", "i", "v", "c", "t" }, "<C-S-v>", paste, { silent = true, desc = "Paste" })

-- =====================
-- Scaling
-- =====================
vim.g.neovide_scale_factor = 1.0
local change_scale_factor = function(delta)
    vim.g.neovide_scale_factor = vim.g.neovide_scale_factor * delta
end
vim.keymap.set("n", "<C-=>", function()
    change_scale_factor(1.25)
end)
vim.keymap.set("n", "<C-->", function()
    change_scale_factor(1 / 1.25)
end)

-- =====================
-- Change Transparency
-- =====================
local change_transparency = function(delta)
    local next_value = (vim.g.neovide_opacity or 1) + delta
    vim.g.neovide_opacity = math.min(1, math.max(0, next_value))
end

vim.keymap.set({ "n", "v", "o" }, "<D-]>", function()
    change_transparency(0.01)
end, { desc = "Increase Neovide opacity" })
vim.keymap.set({ "n", "v", "o" }, "<D-[>", function()
    change_transparency(-0.01)
end, { desc = "Decrease Neovide opacity" })
