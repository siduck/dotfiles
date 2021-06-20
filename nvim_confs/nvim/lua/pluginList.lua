local packer = require("packer")
local use = packer.use

-- using { } for using different branch , loading plugin with certain commands etc
return packer.startup(
    function()
        use "wbthomason/packer.nvim"

        -- loads compe and vsnip in insert mode only
        use {
            "hrsh7th/nvim-compe",
            event = "InsertEnter",
            config = function()
                require("compe-completion").config()
            end
        }

        use {
            "hrsh7th/vim-vsnip",
            event = "InsertEnter"
        }

        -- load autosave only if its enabled globally
        use {
            "907th/vim-auto-save",
            cond = function()
                return vim.g.auto_save == 1
            end
        }

        use {
            "glepnir/dashboard-nvim",
            cond = function()
                return vim.g.dashboard_disable_at_vimenter == 0
            end
        }
        -- color related stuff
        use "siduck76/nvim-base16.lua"
        use "norcalli/nvim-colorizer.lua"

        -- lang stuff
        use "nvim-treesitter/nvim-treesitter"
        use "neovim/nvim-lspconfig"
        use "onsails/lspkind-nvim"
        use "sbdchd/neoformat"
        use "nvim-lua/plenary.nvim"
        use "kabouzeid/nvim-lspinstall"

        use "lewis6991/gitsigns.nvim"
        use "akinsho/nvim-bufferline.lua"
        use "glepnir/galaxyline.nvim"
        use "windwp/nvim-autopairs"
        -- use "alvan/vim-closetag"

        -- Comment
        use "terrortylor/nvim-comment"

        -- snippet support
        use "rafamadriz/friendly-snippets"

        -- file managing , picker etc
        use "kyazdani42/nvim-tree.lua"
        use "kyazdani42/nvim-web-devicons"
        use "nvim-telescope/telescope.nvim"
        use "nvim-telescope/telescope-media-files.nvim"
        use "nvim-lua/popup.nvim"

        -- misc
        use "tweekmonster/startuptime.vim"
        use "karb94/neoscroll.nvim"
        use "kdav5758/TrueZen.nvim"
        use "folke/which-key.nvim"
        use {"lukas-reineke/indent-blankline.nvim", branch = "lua"}
    end,
    {
        display = {
            border = {"┌", "─", "┐", "│", "┘", "─", "└", "│"}
        }
    }
)
