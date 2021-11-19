local M = {}

M.setup_lsp = function(attach, capabilities)
   local lspconfig = require "lspconfig"

   lspconfig.tsserver.setup {
      filetypes = { "javascript", "javascriptreact", "javascript.jsx", "htm" },
      on_attach = function(client, bufnr)
         client.resolved_capabilities.document_formatting = false
         vim.api.nvim_buf_set_keymap(bufnr, "n", "<space>fm", "<cmd>lua vim.lsp.buf.formatting()<cr>", {})
      end,
   }

   -- lspservers with default config

   local servers = { "html", "cssls", "bashls" }

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
