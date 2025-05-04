require("nvchad.configs.lspconfig").defaults()

local servers = { "html", "cssls", "jsonls", "unocss", "marksman", "vtsls", 'pylsp' }
vim.lsp.enable(servers)
