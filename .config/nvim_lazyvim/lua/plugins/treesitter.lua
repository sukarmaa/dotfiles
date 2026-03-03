return {
  {
    "nvim-treesitter/nvim-treesitter",
    dependencies = {
      "windwp/nvim-ts-autotag",
    },
    opts = {
      ensure_installed = {
        "devicetree",
        "lua",
        "regex",
        "bash",
        "markdown",
        "markdown_inline",
        "yaml",
        "json",
        "jsonc",
        "cpp",
        "csv",
        "java",
        "javascript",
        "python",
        "html",
        "css",
        "templ",
        "php",
        "promql",
        "razor",
      },
      context_commentstring = {
        enable = true,
        enable_autocmd = false,
      },
      highlight = {
        enable = true, -- false will disable the whole extension
        disable = { "css" }, -- list of language that will be disabled
      },
      autopairs = {
        enable = true,
      },
      indent = { enable = true, disable = { "python", "css" } },
      autotag = {
        enable = true,
      },
    },
  },
}
