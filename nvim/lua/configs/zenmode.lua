require("zen-mode").setup {
  window = {
    backdrop = 0.93,
    width = 150,
    height = 1,
  },
  plugins = {
    options = {
      showcmd = true, -- disables the command in the last line of the screen
    },
    twilight = { enabled = false }, -- enable to start Twilight when zen mode opens
    gitsigns = { enabled = true }, -- disables git signs
  },
}
