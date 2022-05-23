local autocmd = vim.api.nvim_create_autocmd

autocmd("FileType", {
   pattern = "norg",
   callback = function()
      -- vim.opt.laststatus = 0
      vim.opt.number = false
      vim.opt.showtabline = 0
   end,
})
