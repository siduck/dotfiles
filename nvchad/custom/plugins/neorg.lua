local icons = require "custom.plugins.icons"

local options = {
  load = {
    ["core.defaults"] = {},

    ["core.presenter"] = {
      config = {
        zen_mode = "truezen",
      },
    },

    ["core.norg.dirman"] = {
      config = {
        workspaces = {
          webdev = "~/Documents/notes/webdev",
          linux = "~/Documents/notes/linux",
          design = "~/Documents/notes/design",
        },
      },
    },

    ["core.norg.concealer"] = {
      config = {
        icons = {
          todo = icons.todo,
          list = icons.list,
          heading = icons.heading,
        },
        dim_code_blocks = {
          width = "content", -- Default is "fullwidth"

          padding = {
            left = 10,
            right = 10,
          },
        },
      },
    },

    -- ["core.norg.esupports.indent"] = {
    --   config = {
    --     format_on_enter = false,
    --     format_on_escape = false,
    --   },
    -- },
  },
}

local M = {}

M.setup = function()
  local present, neorg = pcall(require, "neorg")

  if not present then
    return
  end

  vim.opt.foldenable = false
  vim.g.neorg_indent = true

  neorg.setup(options)
end

-- autocmds
-- pretty up norg ft!

M.autocmd = function()
  local opt = vim.opt_local

  vim.api.nvim_create_autocmd("FileType", {
    pattern = "norg",
    callback = function()
      opt.number = false
      opt.foldlevel = 10
      opt.signcolumn = "yes:2"
    end,
  })
end

return M
