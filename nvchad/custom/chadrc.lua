local M = {}
local plugin_conf = require "custom.plugins.configs"

M.plugins = {
   status = {
      colorizer = true,
   },

   options = {
      lspconfig = {
         setup_lspconf = "custom.plugins.lspconfig",
      },
   },

   default_plugin_config_replace = {
      nvim_treesitter = plugin_conf.treesitter,
      nvim_tree = plugin_conf.nvimtree,
   },
}

M.ui = {
   theme = "gruvchad",
}

return M
