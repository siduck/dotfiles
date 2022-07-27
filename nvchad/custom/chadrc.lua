local M = {}
local override = require "custom.override"

M.plugins = {

  override = {
    ["kyazdani42/nvim-tree.lua"] = override.nvimtree,
    ["nvim-treesitter/nvim-treesitter"] = override.treesitter,
    ["lukas-reineke/indent-blankline.nvim"] = override.blankline,
    ["goolord/alpha-nvim"] = override.alpha,
    ["williamboman/mason.nvim"] = override.mason,
  },

  user = require "custom.plugins",
}

M.ui = {
  theme = "gruvchad",
  hl_add = require("custom.highlights").new_hlgroups,
  theme_toggle = { "gruvchad", "gruvbox_light" },
  hl_override = require("custom.highlights").overriden_hlgroups,
}

M.mappings = require "custom.mappings"

return M
