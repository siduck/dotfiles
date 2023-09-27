local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"
local servers = { "html", "cssls", "jsonls", "unocss", "emmet_language_server" }

local custom_on_attach = function(client, bufnr)
  on_attach(client, bufnr)

  if client.server_capabilities.inlayHintProvider then
    vim.lsp.inlay_hint(bufnr, true)
  end
end

-- lsps with default config
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = custom_on_attach,
    capabilities = capabilities,
  }
end

-- typescript
require("typescript-tools").setup {
  on_attach = custom_on_attach,

  settings = {
    tsserver_path = "/home/sid/.volta/tools/shared/typescript/lib/tsserver.js",
  },
}
