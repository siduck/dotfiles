local overrides = require "custom.configs.overrides"

return {

  ----------------------------------------- default plugins ------------------------------------------

  {
    "hrsh7th/nvim-cmp",
    opts = {
      sources = {
        { name = "nvim_lsp", trigger_characters = { "-" } },
        { name = "luasnip" },
        { name = "buffer" },
        { name = "nvim_lua" },
        { name = "path" },
      },
    },
  },

  {
    "folke/trouble.nvim",
    cmd = "Trouble",
    config = function()
      require("trouble").setup()
    end,
  },

  {
    "neovim/nvim-lspconfig",
    dependencies = {
      {
        -- format & linting
        "jose-elias-alvarez/null-ls.nvim",
        config = function()
          require "custom.configs.null-ls"
        end,
      },
    },

    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
  },

  -- override default configs
  { "nvim-tree/nvim-tree.lua", opts = overrides.nvimtree },
  { "nvim-treesitter/nvim-treesitter", opts = overrides.treesitter },
  { "williamboman/mason.nvim", opts = overrides.mason },

  --------------------------------------------- custom plugins ----------------------------------------------

  {
    "karb94/neoscroll.nvim",
    keys = { "<C-d>", "<C-u>" },
    config = function()
      require("neoscroll").setup()
    end,
  },

  -- autoclose tags in html, jsx only
  {
    "windwp/nvim-ts-autotag",
    event = "InsertEnter",
    config = function()
      require("nvim-ts-autotag").setup()
    end,
  },

  -- get highlight group under cursor
  {
    "nvim-treesitter/playground",
    cmd = "TSCaptureUnderCursor",
    config = function()
      require("nvim-treesitter.configs").setup()
    end,
  },

  -- dim inactive windows
  {
    "andreadev-it/shade.nvim",
    config = function()
      require("shade").setup {
        overlay_opacity = 50,
        opacity_step = 1,
        exclude_filetypes = { "NvimTree" },
      }
    end,
  },

  -- I rarely use shade.nvim/autosave.nvim so made commands to enable them
  {
    "Pocco81/auto-save.nvim",
    cmd = { "ASToggle" },
    config = function()
      require("auto-save").setup()
    end,
  },

  {
    "elkowar/yuck.vim",
    config = function()
      vim.opt.ft = "yuck"
    end,
  },
}
