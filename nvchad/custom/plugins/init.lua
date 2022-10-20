local overrides = require "custom.plugins.overrides"

return {

  ----------------------------------------- default plugins ------------------------------------------

  ["folke/which-key.nvim"] = {
    disable = false,
  },

  ["goolord/alpha-nvim"] = {
    disable = false,
    cmd = "Alpha",
    override_options = overrides.alpha,
  },

  ["neovim/nvim-lspconfig"] = {
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.plugins.lspconfig"
    end,
  },

  -- override default configs
  ["kyazdani42/nvim-tree.lua"] = { override_options = overrides.nvimtree },
  ["nvim-treesitter/nvim-treesitter"] = { override_options = overrides.treesitter },
  ["lukas-reineke/indent-blankline.nvim"] = { override_options = overrides.blankline },
  ["williamboman/mason.nvim"] = { override_options = overrides.mason },

  -- ["NvChad/ui"] = {
  --   override_options = {
  --     statusline = {
  --       -- separater_style = 'round'
  --       separator_style = "round", -- default/round/block/arrow
  --
  --       -- separator_style = "arrow",
  --     },
  --   },
  -- },

  --------------------------------------------- custom plugins ----------------------------------------------

  -- autoclose tags in html, jsx only
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

  -- format & linting
  ["jose-elias-alvarez/null-ls.nvim"] = {
    after = "nvim-lspconfig",
    config = function()
      require "custom.plugins.null-ls"
    end,
  },

  -- distraction free modes
  ["Pocco81/TrueZen.nvim"] = {
    disable = true,
    cmd = {
      "TZAtaraxis",
      "TZMinimalist",
      "TZFocus",
    },
    config = function()
      require "custom.plugins.truezen"
    end,
  },

  -- get highlight group under cursor
  ["nvim-treesitter/playground"] = {
    cmd = "TSCaptureUnderCursor",
    config = function()
      require("nvim-treesitter.configs").setup()
    end,
  },

  -- I rarely use shade.nvim/autosave.nvim so made commands to enable them

  -- dim inactive windows
  ["andreadev-it/shade.nvim"] = {
    opt = true,
    config = function()
      require "custom.plugins.shade"
    end,
  },

  -- autosave
  ["Pocco81/auto-save.nvim"] = {
    opt = true,
    config = function()
      require("auto-save").setup()
    end,
  },

  ["folke/zen-mode.nvim"] = {
    cmd = "ZenMode",
    config = function()
      require("zen-mode").setup {
        window = {
          width = vim.g.zenmode, -- width will be 85% of the editor width
        },
      }
    end,
  },
}
