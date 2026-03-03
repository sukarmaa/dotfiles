---@diagnostic disable: undefined-global
return {
  "folke/snacks.nvim",
  keys = {
    -- File picker
    {
      "<leader><space>",
      function()
        Snacks.picker.files({
          finder = "files",
          format = "file",
          cmd = "fd",
          show_empty = true,
          supports_live = true,
          layout = "ivy",
        })
      end,
      desc = "Find Files",
    },
  },
  opts = {
    lazygit = { enabled = false },
    scroll = { enabled = false },
    scope = { enabled = false },
    indent = { enabled = false },
    picker = {
      win = {
        input = {
          keys = {
            ["<Esc>"] = { "close", mode = { "n", "i" } },
            ["J"] = { "preview_scroll_down", mode = { "i", "n" } },
            ["K"] = { "preview_scroll_up", mode = { "i", "n" } },
            ["H"] = { "preview_scroll_left", mode = { "i", "n" } },
            ["L"] = { "preview_scroll_right", mode = { "i", "n" } },
          },
        },
      },
    },
  },
}
