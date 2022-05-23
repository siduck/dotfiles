return {

   ["windwp/nvim-ts-autotag"] = {
      ft = { "html", "javascriptreact" },
      after = "nvim-treesitter",
      config = function()
         local present, autotag = pcall(require, "nvim-ts-autotag")

         if present then
            autotag.setup()
         end
      end,
   },

   ["jose-elias-alvarez/null-ls.nvim"] = {
      after = "nvim-lspconfig",
      config = function()
         require "custom.plugins.null-ls"
      end,
   },

   ["Pocco81/TrueZen.nvim"] = {
      cmd = {
         "TZAtaraxis",
         "TZMinimalist",
         "TZFocus",
      },
      config = function()
         require "custom.plugins.truezen"
      end,
   },

   ["nvim-neorg/neorg"] = {
      ft = "norg",
      after = "nvim-treesitter",
      config = function()
         require "custom.plugins.neorg"
      end,
   },

   ["nvim-treesitter/playground"] = {
      cmd = "TSCaptureUnderCursor",
      config = function()
         require("nvim-treesitter.configs").setup()
      end,
   },
}
