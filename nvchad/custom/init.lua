require "custom.commands"

require "custom.autocmds"

local opt = vim.opt
opt.title = true

if vim.g.neovide then
  vim.o.guifont = "JetbrainsMono Nerd Font:h10"

  vim.g.neovide_refresh_rate = 75

  vim.g.neovide_cursor_vfx_mode = "railgun"

  vim.keymap.set("i", "<c-s-v>", "<c-r>+")
  vim.keymap.set("i", "<c-r>", "<c-s-v>")
end
