return function()
  require("plenary.reload").reload_module "base46"
  require("plenary.reload").reload_module "custom.chadrc"

  local config = require("core.utils").load_config()

  vim.g.nvchad_theme = config.ui.theme
  vim.g.transparency = config.ui.transparency

  -- statusline
  require("plenary.reload").reload_module("nvchad.statusline." .. config.ui.statusline.theme)
  vim.opt.statusline = "%!v:lua.require('nvchad.statusline." .. config.ui.statusline.theme .. "').run()"

  -- tabufline
  if config.ui.tabufline.enabled then
    require("plenary.reload").reload_module "nvchad.tabufline.modules"
    vim.opt.tabline = "%!v:lua.require('nvchad.tabufline.modules').run()"
  end

  require("base46").load_all_highlights()
  vim.cmd "echo ''"
end
