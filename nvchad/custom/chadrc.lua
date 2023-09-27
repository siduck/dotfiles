---@type ChadrcConfig
local M = {}

M.ui = {
  theme = "bearded-arc",

  tabufline = {
    lazyload = false,
  },
}

M.plugins = "custom.plugins"

M.mappings = require "custom.mappings"

return M
