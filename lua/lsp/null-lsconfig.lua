-- Set up diagnostic and formatting
-- for more, refer to link below
-- https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#formatting
local null_ls = require("null-ls")
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

null_ls.setup({
  sources = {
    -- Go
    null_ls.builtins.diagnostics.golangci_lint,
    -- null_ls.builtins.formatting.gofumpt,
    null_ls.builtins.formatting.goimports_reviser,
    null_ls.builtins.formatting.golines,
    null_ls.builtins.formatting.gofmt,

    -- C
    null_ls.builtins.diagnostics.clazy,
    null_ls.builtins.formatting.clang_format,

    -- Shell
    null_ls.builtins.formatting.shfmt,

    -- Json/YAML/XML
    null_ls.builtins.diagnostics.cfn_lint,
    null_ls.builtins.formatting.jq,
    null_ls.builtins.formatting.yamlfmt,
    null_ls.builtins.formatting.xq,

    -- Markdown
    null_ls.builtins.formatting.markdownlint,

  },

  -- Format on save
  on_attach = function(client, bufnr)
    if client.supports_method("textDocument/formatting") then
      vim.api.nvim_clear_autocmds({
        group = augroup,
        buffer = bufnr
      })
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = augroup,
        buffer = bufnr,
        callback = function()
          vim.lsp.buf.format({ bufnr = bufnr })
        end,
      })
    end
  end,
})
