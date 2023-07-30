-- Install tools either from mason-tool (find server with :Mason command) or mason-lspconfig
require("mason-tool-installer").setup({
  ensure_installed = {
    'cpplint',
    'clang-format',
    'gopls',
  },
  auto_update = true
})

require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = {
    'lua_ls',
    'clangd',
    'marksman',
  },
  ui = {
    icons = {
      package_installed = "✓",
      package_pending = "➜",
      package_uninstalled = "✗",
    },
  },
  automatic_installation = true,
})
