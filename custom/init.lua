vim.g.did_load_filetypes = 1
vim.g.nvim_tree_hide_dotfiles = 1

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
   --
   --    use {
   --       "jubnzv/mdeval.nvim",
   --       config = function()
   --          require("mdeval").setup()
   --       end,
   --       setup = function()
   --          vim.g.markdown_fenced_languages = { "javascript", "lua" }
   --       end,
   --    }
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
