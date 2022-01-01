local hooks = require "core.hooks"

hooks.add("setup_mappings", function(map)
   map("n", "<leader>fp", ":Telescope media_files <CR>")
   map("n", "<leader>te", ":Telescope <CR>")
end)
