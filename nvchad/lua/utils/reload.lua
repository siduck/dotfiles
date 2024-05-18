-- I use this only to reload the theme i.e bsae46 highlights

return function()
  require("plenary.reload").reload_module "chadrc"
  require("plenary.reload").reload_module "nvconfig"
  require("plenary.reload").reload_module "base46"

  local config = require "nvconfig"

  vim.g.nvchad_theme = config.ui.theme
  vim.g.transparency = config.ui.transparency

  require("base46").load_all_highlights()
  vim.cmd "echo ''"
end
