local M = {}

local override = require "custom.override"

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

   user = require "custom.plugins",

   remove = {
      "folke/which-key.nvim",
   },
}

M.ui = {
   theme = "gruvchad",
   hl_override = require "custom.highlights",
}

M.mappings = require "custom.mappings"

return M
