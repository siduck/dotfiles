local M = {}
M.options, M.ui, M.mappings, M.plugins = {}, {}, {}, {}

M.plugins = {
   status = {
      colorizer = true,
      -- dashboard = true,
   },
   options = {
      nvimtree = {
         enable_git = 0,
      },
      lspconfig = {
         setup_lspconf = "custom.plugins.lspconfig",
      },
   },

}

M.ui = {
   theme = "gruvchad",
}

return M
