local create_cmd = vim.api.nvim_create_user_command

create_cmd("EnableVenn", function()
  require("packer").loader "venn.nvim"
end, {})

create_cmd("EnableAutosave", function()
  require("autosave").setup()
end, {})

create_cmd("EnableShade", function()
  require("shade").setup()
end, {})
