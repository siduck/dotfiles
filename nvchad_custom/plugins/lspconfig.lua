local M = {}

M.setup_lsp = function(attach, capabilities)
   local lspconfig = require "lspconfig"

   -- lspservers with default config

   print("cdfk")
   
   local servers = { "html", "cssls", "tsserver" }

   for _, lsp in ipairs(servers) do
      lspconfig[lsp].setup {
         on_attach = attach,
         capabilities = capabilities,
         -- root_dir = vim.loop.cwd,
         flags = {
            debounce_text_changes = 150,
         },
      }
   end

   -- emmet

   local configs = require "lspconfig/configs"

   configs.ls_emmet = {
      default_config = {
         cmd = { "ls_emmet", "--stdio" },
         filetypes = { "html", "css", "scss" },
         root_dir = function(fname)
            return vim.loop.cwd()
         end,
         settings = {},
      },
   }

   lspconfig.ls_emmet.setup { capabilities = capabilities }

   --- sumneko_lua lsp
   local sumneko_root_path = vim.fn.getenv "HOME" .. "/test/sumneko_lua"
   local sumneko_binary = sumneko_root_path .. "/bin/Linux/lua-language-server"

   -- Make runtime files discoverable to the server
   local runtime_path = vim.split(package.path, ";")
   table.insert(runtime_path, "lua/?.lua")
   table.insert(runtime_path, "lua/?/init.lua")

   lspconfig.sumneko_lua.setup {
      cmd = { sumneko_binary, "-E", sumneko_root_path .. "/main.lua" },
      on_attach = attach,
      capabilities = capabilities,
      flags = {
         debounce_text_changes = 500,
      },
      settings = {
         Lua = {
            diagnostics = {
               globals = { "vim" },
            },
            runtime = {
               version = "LuaJIT",
               path = runtime_path,
            },
            workspace = {
               library = {
                  [vim.fn.expand "$VIMRUNTIME/lua"] = true,
                  [vim.fn.expand "$VIMRUNTIME/lua/vim/lsp"] = true,
               },
               maxPreload = 100000,
               preloadFileSize = 10000,
            },
            telemetry = {
               enable = false,
            },
         },
      },
   }
end

return M
