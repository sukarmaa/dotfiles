return {
  "saghen/blink.indent",
  event = "LazyFile",
  --- @module 'blink.indent'
  --- @type blink.indent.Config
  opts = {
    static = {
      char = "│", -- ▏,│, ▎
    },
    scope = {
      char = "│",
      highlights = { "SnacksIndentScope" },
    },
  },
}

-- Character's for indent
-- • left aligned solid
--   • `▏`
--   • `▎` (default)
--   • `▍`
--   • `▌`
--   • `▋`
--   • `▊`
--   • `▉`
--   • `█`
-- • center aligned solid
--   • `│`
--   • `┃`
-- • right aligned solid
--   • `▕`
--   • `▐`
-- • center aligned dashed
--   • `╎`
--   • `╏`
--   • `┆`
--   • `┇`
--   • `┊`
--   • `┋`
-- • center aligned double
--   • `║`
