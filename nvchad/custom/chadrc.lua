local M = {}

local override = require "custom.override"
local userPlugins = require "custom.plugins"

M.plugins = {

   options = {
      lspconfig = {
         setup_lspconf = "custom.plugins.lspconfig",
      },

      statusline = {
         separator_style = "round",
      },
   },

   override = {
      ["kyazdani42/nvim-tree.lua"] = override.nvimtree,
      ["nvim-treesitter/nvim-treesitter"] = override.treesitter,
      ["lukas-reineke/indent-blankline.nvim"] = override.blankline,
   },

   user = userPlugins,
}

M.ui = {
   theme = "onedark",
   hl_override = require "custom.highlights",
}

M.mappings = require "custom.mappings"

M.options = {
   user = function()
      require "custom.options"
   end,
}

return M
