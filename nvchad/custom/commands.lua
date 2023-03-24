local create_cmd = vim.api.nvim_create_user_command

create_cmd("EnableAutosave", function()
  require("lazy").load { plugins = { "auto-save.nvim" } }
end, {})

create_cmd("EnableShade", function()
  require("lazy").load { plugins = { "shade.nvim" } }
end, {})
