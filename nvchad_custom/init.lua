vim.g.did_load_filetypes = 1

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
         require("custom.plugins.null-ls").setup()
      end,
   }

   use "nathom/filetype.nvim"
   --  use {
   --       "williamboman/nvim-lsp-installer",
   --       config = function()
   --          local lsp_installer = require "nvim-lsp-installer"
   --
   --          lsp_installer.on_server_ready(function(server)
   --             local opts = {}
   --
   --             server:setup(opts)
   --             vim.cmd [[ do User LspAttachBuffers ]]
   --          end)
   --       end,
   --    }
end)
