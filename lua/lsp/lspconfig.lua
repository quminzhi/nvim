local on_attach
local capabilities = require('cmp_nvim_lsp').default_capabilities()
capabilities.offsetEncoding = "utf-8"

local lspconfig = require('lspconfig')
local util = require('lspconfig/util')

-- go settings
-- refer to:
-- https://github.com/golang/tools/blob/master/gopls/doc/vim.md
-- https://github.com/golang/tools/blob/master/gopls/doc/analyzers.md
lspconfig.gopls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = {"gopls"},
  filetypes = {"go", "gomod", "gowork", "gotmpl"},
  root_dir = util.root_pattern("go.work", "go.mod", ".git"),

  settings = {
    gopls = {
      completeUnimported = true,
      usePlaceholders = true,
      analyses = {
        unusedparams = true,
      }
    },
  }
}

-- lua settings
lspconfig.lua_ls.setup {
  on_attach = on_attach,
  capabilities = capabilities,

  settings = {
    Lua = {
      diagnostics = {
        globals = { 'vim' }
      }
    }
  },
}

-- c settings
require("lspconfig").clangd.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = {"c", "cpp"},

  settings = {
  },
}

-- markdown settings
require("lspconfig").marksman.setup {
  on_attach = on_attach,
  capabilities = capabilities,

  settings = {
  },
}

