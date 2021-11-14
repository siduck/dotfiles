local M = {}
M.options, M.ui, M.mappings, M.plugins = {}, {}, {}, {}

M.plugins = {
   status = {
      colorizer = true,
      dashboard = false,
      telescope_media = true, -- media previews within telescope finders
   },
   options = {
      nvimtree = {
         enable_git = 0,
      },
      lspconfig = {
         setup_lspconf = "custom.plugins.confs.lspconfig",
      },
   },
}

M.ui = {
   theme = "gruvchad",
}

return M
