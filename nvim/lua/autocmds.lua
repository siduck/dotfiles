require "nvchad.autocmds"

local autocmd = vim.api.nvim_create_autocmd
local replace_word = require("nvchad.utils").replace_word

------------------------------------- st terminal dynamic padding -----------------------------------------------
-- Dynamic terminal padding with/without nvim (for siduck's st only)

autocmd({ "VimEnter", "VimLeave" }, {
  callback = function(args)
    local oldword = args.event == "VimEnter" and 20 or 0
    local newword = args.event == "VimEnter" and 0 or 20

    replace_word("st.borderpx: " .. oldword, "st.borderpx: " .. newword, "/home/siduck/dotfiles/.Xresources")
    vim.cmd "silent !xrdb -merge ~/dotfiles/.Xresources"
    vim.cmd "silent !kill -USR1 $(xprop -id $(xdotool getwindowfocus) | grep '_NET_WM_PID' | grep -oE '[[:digit:]]*$')"

    replace_word("st.borderpx: 0", "st.borderpx: 20", "/home/siduck/dotfiles/.Xresources")
    vim.cmd "silent !xrdb -merge ~/dotfiles/.Xresources"

    if args.event == "VimLeave" then
      vim.api.nvim_del_autocmd(args.id)
    end
  end,
})
