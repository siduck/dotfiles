local create_cmd = vim.api.nvim_create_user_command

create_cmd("EnableAutosave", function()
  require('packer').loader('auto-save.nvim')
end, {})

create_cmd("EnableShade", function()
  require('packer').loader('shade.nvim')
end, {})
