local M = {}

M.setup = function()
  local present, venn = pcall(require, "venn")

  if not present then
    return
  end

  venn.set_arrow("left", "")
  venn.set_arrow("right", "")
end

M.toggle_maps = function()
  local venn_enabled = vim.inspect(vim.b.venn_enabled)

  if venn_enabled == "nil" then
    vim.b.venn_enabled = true
    vim.opt_local.ve = "all"
    local map = vim.api.nvim_buf_set_keymap

    -- draw a line on HJKL keystokes
    map(0, "n", "J", "<C-v>j:VBox<CR>", {})
    map(0, "n", "K", "<C-v>k:VBox<CR>", {})
    map(0, "n", "L", "<C-v>l:VBox<CR>", {})
    map(0, "n", "H", "<C-v>h:VBox<CR>", {})

    -- draw a box by pressing "f" with visual selection
    map(0, "v", "f", ":VBox<CR>", {})
  else
    vim.opt_local.ve = ""
    vim.cmd [[mapclear <buffer>]]
    vim.b.venn_enabled = nil
  end
end

return M
