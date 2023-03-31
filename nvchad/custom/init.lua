
require "custom.commands"
require "custom.autocmds"

vim.opt.title = true

-- vim.opt.guifont = { "JetBrainsMono Nerd Font", ":h9" }
-- vim.opt.guifont = { "Sarasa Mono SC Nerd", ":h8" }

-- vim.filetype.add {
--   filename = {
--     [".mkshrc"] = "sh",
--   },
-- }
--
-- vim.api.nvim_create_autocmd({ "BufAdd", "BufEnter", "tabnew" }, {
--   callback = function()
--     vim.t.bufs = vim.tbl_filter(function(bufnr)
--       return vim.api.nvim_buf_get_option(bufnr, "modified")
--     end, vim.t.bufs)
--   end,
-- })

-- for i = 1, 9, 1 do
--   vim.keymap.set("n", string.format("<A-%s>", i), function()
--     vim.api.nvim_set_current_buf(vim.t.bufs[i])
--   end)
-- end
