local M = {}
M.options, M.ui, M.mappings, M.plugins = {}, {}, {}, {}

M.plugins = {
   status = {
      colorizer = true,
      -- dashboard = true,
   },
   options = {
      nvimtree = {
         enable_git = 1,
      },
      lspconfig = {
         setup_lspconf = "custom.plugins.lspconfig",
      },
   },
}

M.mappings = {
   sidmap = {
      telescope = "<leader>te",
   },
}

M.ui = {
   theme = "gruvchad",
}

return M
