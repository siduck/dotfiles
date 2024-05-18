local prettier_svelte =
  "/home/siduck/.local/share/nvim/mason/packages/prettier/node_modules/prettier-plugin-svelte/plugin.js"

local options = {
  -- custom formatter
  formatters = {
    svelte_fmt = {
      command = "prettier",
      args = { "--plugin", prettier_svelte, "$FILENAME" },
    },
  },

  formatters_by_ft = {
    svelte = { "svelte_fmt" }, -- custom
    lua = { "stylua" },

    -- webdev
    javascript = { "biome" },
    javascriptreact = { "biome" },
    typescript = { "biome" },
    typescriptreact = { "biome" },

    css = { "biome" },
    html = { "biome" },
    json = { "biome" },
    jsonc = { "biome" },

    sh = { "shfmt" },
    yaml = { "yamlfmt" },
  },

  -- format_on_save = {
  --   -- These options will be passed to conform.format()
  --   timeout_ms = 500,
  -- },
}

return options
