local overrides = require "custom.configs.overrides"

return {

  ----------------------------------------- default plugins -----------------------------------------

  {
    "gpanders/nvim-parinfer",
    event = "InsertEnter",
  },

  {
    "NvChad/ui",
    dir = "~/projects/ui/",
  },

  -- {
  --   'ein-shved/NvChad-ui',
  --   name='abc',
  --   lazy = false,
  -- },

  {
    "hrsh7th/nvim-cmp",
    opts = overrides.cmp,

    dependencies = {
      {
        -- snippet plugin
        "L3MON4D3/LuaSnip",
        config = function(_, opts)
          -- load default luasnip config
          require("plugins.configs.others").luasnip(opts)

          local luasnip = require "luasnip"
          luasnip.filetype_extend("javascriptreact", { "html" })
          luasnip.filetype_extend("typescriptreact", { "html" })
          require("luasnip/loaders/from_vscode").lazy_load()
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
    dependencies = {
      "pmizio/typescript-tools.nvim",
    },

    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
  },

  {
    "stevearc/conform.nvim",
    config = function()
      require "custom.configs.conform"
    end,
  },

  -- override default configs
  { "nvim-tree/nvim-tree.lua", opts = overrides.nvimtree },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = overrides.treesitter,

    config = function(_, opts)
      dofile(vim.g.base46_cache .. "syntax")
      require("nvim-treesitter.configs").setup(opts)

      -- register mdx ft
      vim.filetype.add {
        extension = { mdx = "mdx" },
      }

      vim.treesitter.language.register("markdown", "mdx")
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
  {
    "karb94/neoscroll.nvim",
    keys = { "<C-d>", "<C-u>" },
    config = function()
      require("neoscroll").setup()
    end,
  },

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
    cmd = "Trouble",
    config = function()
      require("trouble").setup()
    end,
  },

  -- syntax support fgor yuck lang
  {
    "elkowar/yuck.vim",
    ft = "yuck",
  },

  -- distraction free mode
  {
    "folke/zen-mode.nvim",
    cmd = "ZenMode",
    config = function()
      require "custom.configs.zenmode"
    end,
  },

  {
    "mbbill/undotree",
    cmd = "UndotreeToggle",
  },
}
