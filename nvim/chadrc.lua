local M = {}

M.options = {
   nvChad = {
      update_branch = "dev",
   },
}

M.plugins = {
   status = {
      colorizer = true,
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

   default_plugin_config_replace = {
      nvim_treesitter = "custom.plugins.confs.treesitter",
   },
}

M.ui = {
   theme = "everforest",
}

return M
