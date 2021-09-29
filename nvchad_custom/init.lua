local hooks = require "core.hooks"

hooks.add("install_plugins", function(use)
   use {
      "windwp/nvim-ts-autotag",
      after = "nvim-treesitter",
      -- event = "InsertEnter",
      config = function()
         require("nvim-ts-autotag").setup()
      end,
   }

   use {
      "jose-elias-alvarez/null-ls.nvim",
      after = "nvim-lspconfig",
      config = function()
         require("custom.plugin_confs.null-ls").setup()
      end,
   }
end)
