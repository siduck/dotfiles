local ok, null_ls = pcall(require, "null-ls")

if not ok then
   return
end

local b = null_ls.builtins

local sources = {

   b.formatting.prettierd.with { filetypes = { "html", "vue", "svelte", "css" } },
   b.formatting.deno_fmt,

   -- Lua
   b.formatting.stylua,
   b.diagnostics.luacheck.with { extra_args = { "--global vim" } },

   -- Shell
   b.formatting.shfmt,
   b.diagnostics.shellcheck.with { diagnostics_format = "#{m} [#{c}]" },
}

local M = {}

M.setup = function(on_attach)
   null_ls.config {
      debug = true,
      sources = sources,
   }
   -- null_ls.register(css_formatter)
   require("lspconfig")["null-ls"].setup { on_attach = on_attach }
   -- vim.cmd "autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()"
end

return M
