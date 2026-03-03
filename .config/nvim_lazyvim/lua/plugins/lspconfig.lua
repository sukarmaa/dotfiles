return {
  "neovim/nvim-lspconfig",
  opts = {
    diagnostics = {
      float = {
        border = "single",
      },
    },
    inlay_hints = { enabled = false },
    servers = {
      lua_ls = {
        enabled = true,
        mason = true,
        -- keys = {},
        settings = {
          diagnostics = { globals = { "vim", "Snacks" } },
          telemetry = { enable = false },
          codeLens = { enable = false },
        },
      },
    },
  },
}
