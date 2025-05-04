--@type ChadrcConfig
local M = {}

M.base46 = {
  theme = "everforest",
  -- transparency = true,
  hl_add = require "hl",
  integrations = { "markview" },
}

M.term = {
  base46_colors = true,
}

return M
