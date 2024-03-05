local overrides = require "configs.overrides"

---@type NvPluginSpec[]
return {

  --------------------------------------- default plugins -----------------------------------------
  -- {
  --   "sindrets/diffview.nvim",
  --   cmd = { "DiffviewOpen", "DiffviewToggleFiles" },
  --   config = function()
  --     require("diffview").setup()
  --   end,
  -- },

  -- {
  --   "NvChad/ui",
  --   dir = "~/projects/ui/",
  -- },
  -- --
  -- { "NvChad/base46", dir = "~/projects/base46" },
  --
  {
    "hrsh7th/nvim-cmp",
    opts = overrides.cmp,

    dependencies = {
      {
        -- snippet plugin
        "L3MON4D3/LuaSnip",
        config = function(_, opts)
          require("luasnip").config.set_config(opts)

          local luasnip = require "luasnip"

          luasnip.filetype_extend("javascriptreact", { "html" })
          luasnip.filetype_extend("typescriptreact", { "html" })
          luasnip.filetype_extend("svelte", { "html" })

          require('nvchad.configs.luasnip')
        end,
      },

      -- ai based completion
      {
        "jcdickinson/codeium.nvim",
        config = function()
          require("codeium").setup {}
        end,
      },
    },
  },

  {
    "neovim/nvim-lspconfig",
    dependencies = "pmizio/typescript-tools.nvim",

    config = function()
      require("nvchad.configs.lspconfig").defaults()
      require "configs.lspconfig"
    end,
  },

  {
    "stevearc/conform.nvim",
    event = "BufWritePre",
    config = function()
      require "configs.conform"
    end,
  },

  -- override default configs
  { "nvim-tree/nvim-tree.lua", opts = overrides.nvimtree },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = overrides.treesitter,
    dependencies = {
      "windwp/nvim-ts-autotag",
    },
  },

  -- autoclose tags in html, jsx only
  -- {
  --   "windwp/nvim-ts-autotag",
  --   event = "InsertEnter",
  --   config = function()
  --     require("nvim-ts-autotag").setup()
  --   end,
  -- },

  {
    "numToStr/Comment.nvim",
    dependencies = "JoosepAlviste/nvim-ts-context-commentstring",
    config = function()
      require("Comment").setup {
        pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
      }
    end,
  },

  { "williamboman/mason.nvim", opts = overrides.mason },

  --------------------------------------------- custom plugins ----------------------------------------------
  -- smooth scroll
  -- {
  --   "karb94/neoscroll.nvim",
  --   keys = { "<C-d>", "<C-u>" },
  --   config = function()
  --     require("neoscroll").setup()
  --   end,
  -- },
  --
  -- dim inactive windows
  {
    "andreadev-it/shade.nvim",
    config = function()
      require("shade").setup {
        exclude_filetypes = { "NvimTree" },
      }
    end,
  },

  -- pretty diagnostics panel
  {
    "folke/trouble.nvim",
    cmd = { "Trouble", "TodoTrouble" },
    dependencies = {
      {
        "folke/todo-comments.nvim",
        opts = {},
      },
    },
    config = function()
      require("trouble").setup()
    end,
  },

  -- syntax support fgor yuck lang
  {
    "elkowar/yuck.vim",
    ft = "yuck",
  },

  {
    "gpanders/nvim-parinfer",
    event = "InsertEnter",
  },

  -- distraction free mode
  {
    "folke/zen-mode.nvim",
    cmd = "ZenMode",
    config = function()
      require "configs.zenmode"
    end,
  },

  {
    "nvim-telescope/telescope.nvim",
    opts = { extensions_list = { "fzf", "glyph" , 'terms'} },
    dependencies = {
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
      { "ghassan0/telescope-glyph.nvim" },
    },
  },

  {
    "mbbill/undotree",
    cmd = { "UndotreeToggle" },
  },
}
