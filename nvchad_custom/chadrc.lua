local M = {}
M.options, M.ui, M.mappings, M.plugins = {}, {}, {}, {}

M.plugins = {
   plugin_status = {
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
         servers = { "html", "cssls", "tsserver", "bashls", "pyright" },
      },
   },
   default_plugin_config_replace = {
      lspconfig = "custom.plugin_confs.lspconfig",
   },
}

M.ui = {
   theme = "gruvchad",
}

return M
