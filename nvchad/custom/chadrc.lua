---@type ChadrcConfig
local M = {}

M.plugins = "custom.plugins" -- path for lazy.nvim

M.ui = {
  theme = "everforest",
  -- transparency = true,

  statusline = {
    theme = 'vscode',
  },
}

M.mappings = require "custom.mappings"

return M
