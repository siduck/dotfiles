local ok, toggleterm = pcall(require, "toggleterm")

if not ok then
  return print "Error loading toggleterm"
end

local terminal = require("toggleterm.terminal").Terminal

local M = {}

local lazygit = terminal:new {
  cmd = "lazygit",
  dir = "git_dir",
  direction = "float",
  float_opts = {
    border = "shadow",
    winblend = 5,
  },
  -- function to run on opening the terminal
  on_open = function(term)
    vim.cmd "startinsert!"
    vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", { noremap = true, silent = true })
  end,
}

M.lazygit_toggle = function()
  lazygit:toggle()
end

M.setup = function()
  toggleterm.setup {
    size = 20,
    open_mapping = [[<c-\>]],
    hide_numbers = true,
  }
end

return M
