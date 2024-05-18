require "nvchad.autocmds"

local autocmd = vim.api.nvim_create_autocmd


------------------------------------- st terminal dynamic padding -----------------------------------------------

-- replace string from file
local function sed(from, to, fname)
  vim.cmd(string.format("silent !sed -i 's/%s/%s/g' %s", from, to, fname))
end

-- reloads xresources for current focused window onl
local function liveReload_xresources()
  vim.cmd "silent !xrdb -merge ~/.Xresources"
  vim.cmd "silent !kill -USR1 $(xprop -id $(xdotool getwindowfocus) | grep '_NET_WM_PID' | grep -oE '[[:digit:]]*$')"
end

-- Dynamic terminal padding with/without nvim (for siduck's st only)
autocmd({ "BufNewFile", "BufRead" }, {
  callback = function(ctx)
    -- remove terminal padding
    -- keep padding when nvim has only 1 buffer

    if #vim.fn.getbufinfo { buflisted = 1 } > 1 then
      sed("st.borderpx: 20", "st.borderpx: 0", "~/.Xresources")
      liveReload_xresources()

      -- revert xresources change but dont reload it
      sed("st.borderpx: 0", "st.borderpx: 20", "~/.Xresources")

      vim.cmd "silent !xrdb -merge ~/.Xresources"
      vim.api.nvim_del_autocmd(ctx.id)
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

--------------------------------------------------------------------------------------------------------------------

autocmd("TermOpen", {
  command = "setlocal signcolumn=no",
})
