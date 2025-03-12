-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()

local configs = require "nvchad.configs.lspconfig"

-- EXAMPLE
-- local servers = { "html", "cssls", "pyright" }

local servers = {
  autotools_ls = {},
  bashls = {},
  fish_lsp = {},
  gitlab_ci_ls = {},
  jsonls = {},
  jsonnet_ls = {},
  yamlls = {},
}

for name, opts in pairs(servers) do
  opts.on_init = configs.on_init
  opts.on_attach = configs.on_attach
  opts.capabilities = configs.capabilities

  require("lspconfig")[name].setup(opts)
end
