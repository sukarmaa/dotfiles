return {
  "kr40/nvim-macros",
  cmd = { "MacroSave", "MacroYank", "MacroSelect", "MacroDelete" },
  opts = {
    json_file_path = vim.fs.normalize(vim.fn.stdpath("config") .. "/macros.json"), -- Location where the macros will be stored
    default_macro_register = "q", -- Use as default register for :MacroYank and :MacroSave and :MacroSelect Raw functions
    json_formatter = function()
      if vim.fn.executable("jq") == 1 then
        return "jq"
      elseif vim.fn.executable("yq") == 1 then
        return "yq"
      else
        return "none"
      end
    end, -- can be "none" | "jq" | "yq" used to pretty print the json file (jq or yq must be installed!)
  },
}
