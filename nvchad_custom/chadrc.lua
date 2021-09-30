local M = {}
M.options, M.ui, M.mappings, M.plugins = {}, {}, {}, {}

M.plugins = {
   status = {
      neoscroll = true,
      colorizer = true,
      truezen = true,
      -- dashboard = true,
   },
   options = {
      nvimtree = {
         enable_git = 1,
      },
      lspconfig = {
         -- setup_lspconf = "custom.plugins.lspconfig",
      },
   },
}

M.ui = {
   theme = "everforest",
}

return M
