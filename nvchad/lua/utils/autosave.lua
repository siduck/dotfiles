local create_cmd = vim.api.nvim_create_user_command

local function clear_cmdarea()
  vim.defer_fn(function()
    vim.api.nvim_echo({}, false, {})
  end, 800)
end

local echo = function(txts)
  vim.api.nvim_echo(txts, false, {})
end

vim.api.nvim_create_autocmd({ "InsertLeave", "TextChanged" }, {
  nested = true,
  callback = function()
    if vim.g.autosave and #vim.api.nvim_buf_get_name(0) ~= 0 and vim.bo.buflisted then
      vim.cmd "silent w"

      echo { { "󰄳", "LazyProgressDone" }, { " file autosaved at " .. os.date "%I:%M %p" } }

      clear_cmdarea()
    end
  end,
})

create_cmd("AsToggle", function()
  vim.g.autosave = not vim.g.autosave

  local enabledTxt = { { "󰆓 ", "LazyProgressDone" }, { "autosave enabled!" } }
  local disabledTxt = { { "  ", "LazyNoCond" }, { "autosave disabled" } }

  echo(vim.g.autosave and enabledTxt or disabledTxt)

  clear_cmdarea()
end, {})
