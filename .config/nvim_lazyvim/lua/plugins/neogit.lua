return {
  "NeogitOrg/neogit",
  lazy = true,
  dependencies = {
    "nvim-lua/plenary.nvim",

    -- Only one of these is needed.
    "sindrets/diffview.nvim",
    -- "esmuellert/codediff.nvim",

    -- Only one of these is needed.
    -- "nvim-telescope/telescope.nvim",
    -- "ibhagwan/fzf-lua",
    -- "nvim-mini/mini.pick",
    -- "folke/snacks.nvim",
  },
  cmd = "Neogit",
  keys = {
    { "<leader>ng", "<cmd>Neogit<cr>", desc = "Show Neogit UI" },
  },
}
