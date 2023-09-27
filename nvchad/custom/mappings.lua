local M = {}

M.general = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },
  },
  i = {
    ["jk"] = { "<ESC>", "escape insert mode" },
  },
}

M.shade = {
  n = {
    ["<Bslash>"] = {
      function()
        require("shade").toggle()
      end,

      "toggle shade.nvim",
    },
  },
}

M.lsp = {
  n = {
    ["<leader>fm"] = {

      function()
        require("conform").format()
      end,
      "format with conform",
    },
  },
}

-- M.nvterm = {
--   n = {
--     ["<leader>gc"] = {
--
--       function()
--         local file = vim.fn.expand "%"
--
--         local fts = {
--           cpp = "clear && g++ -o out " .. file .. " && ./out",
--           python = "some command",
--         }
--
--         require("nvterm.terminal").send(fts[vim.bo.ft], "vertical")
--       end,
--
--       "run commands based on current filetype",
--     },
--   },
-- }

return M
