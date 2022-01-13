local customPlugins = require "core.customPlugins"

customPlugins.add(function(use)
   use "nathom/filetype.nvim"

   use {
      "windwp/nvim-ts-autotag",
      ft = { "html", "javascriptreact" },
      after = "nvim-treesitter",
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

   use {
      "nvim-telescope/telescope-media-files.nvim",
      after = "telescope.nvim",
      config = function()
         require("telescope").setup {
            extensions = {
               media_files = {
                  filetypes = { "png", "webp", "jpg", "jpeg" },
                  find_cmd = "rg", -- find command (defaults to `fd`)
               },
            },
         }
         require("telescope").load_extension "media_files"
      end,
   }

   use {
      "rmagatti/auto-session",
      cmd = { "SaveSession", "RestoreSession" },
      config = function()
         require("auto-session").setup {
            log_level = "info",
            auto_session_enable_last_session = false,
            auto_session_root_dir = "~/test/", -- change this!
            auto_session_enabled = false,
            auto_save_enabled = false,
            auto_restore_enabled = false,
            auto_session_suppress_dirs = nil,
            pre_save_cmds = { "tabdo NvimTreeClose" },
         }
      end,
   }
end)
