-- commands

-- I dont use shade.nvim/autosave.nvim all the time so made commands for them
-- So this makes easy to lazy load them at cmds

local new_cmd = vim.api.nvim_create_user_command
local api = vim.api

new_cmd("EnableShade", function()
  require("shade").setup()
end, {})

new_cmd("EnableAutosave", function()
  require("autosave").setup()
end, {})

local autocmd = api.nvim_create_autocmd
local opt_local = vim.opt_local

-- autocmds
-- pretty up norg ft!
autocmd("FileType", {
  pattern = "norg",
  callback = function()
    opt_local.number = false
    opt_local.cole = 1
    opt_local.foldlevel = 10
    opt_local.foldenable = false
    opt_local.signcolumn = "yes:2"
  end,
})

-- Dynamic terminal padding with/without nvim (for siduck's st only)
-- replace stuff from file
local function sed(from, to, fname)
  vim.cmd(string.format("silent !sed -i 's/%s/%s/g' %s", from, to, fname))
end

-- reloads xresources for current focused window only
local function liveReload_xresources()
  vim.cmd(
    string.format "silent !xrdb merge ~/.Xresources && kill -USR1 $(xprop -id $(xdotool getwindowfocus) | grep '_NET_WM_PID' | grep -oE '[[:digit:]]*$')"
  )
end

autocmd({ "BufNewFile", "BufRead" }, {
  callback = function(ctx)
    -- remove terminal padding
    -- exclude when nvim has norg ft & more than 2 buffers
    if vim.bo.ft == "norg" or #vim.fn.getbufinfo { buflisted = 1 } > 1 then
      sed("st.borderpx: 20", "st.borderpx: 0", "~/.Xresources")
      liveReload_xresources()

      -- revert xresources change but dont reload it
      sed("st.borderpx: 0", "st.borderpx: 20", "~/.Xresources")
      vim.cmd(string.format "silent !xrdb merge ~/.Xresources")
      api.nvim_del_autocmd(ctx.id)
    end
  end,
})

-- add terminal padding
autocmd("VimLeavePre", {
  callback = function()
    sed("st.borderpx: 0", "st.borderpx: 20", "~/.Xresources")
    liveReload_xresources()
  end,
})
