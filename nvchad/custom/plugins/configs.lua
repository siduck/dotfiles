-- overriding default plugin configs!

local M = {}

M.treesitter = {
   ensure_installed = {
      "vim",
      "html",
      "css",
      "javascript",
      "json",
      "toml",
      "markdown",
      "c",
      "bash",
      "lua",
   },
}

M.nvimtree = {
   git = {
      enable = true,
   },
}

M.telescope = {
   extensions = {
     -- fd is needed
      media_files = {
         filetypes = { "png", "webp", "jpg", "jpeg" },
      },
   },
}

return M
