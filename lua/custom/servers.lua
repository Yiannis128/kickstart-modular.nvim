-- Config for the servers

Servers = {
  clangd = {},
  -- gopls = {},
  basedpyright = {},
  -- rust_analyzer = {},
  -- tsserver = {},
  -- html = { filetypes = { 'html', 'twig', 'hbs'} },
  bashls = {},
  lua_ls = {
    Lua = {
      workspace = { checkThirdParty = false },
      telemetry = { enable = false },
    },
  },
  markdownlint = {},
  html = {},
  cssls = {},
  eslint = {},
}
