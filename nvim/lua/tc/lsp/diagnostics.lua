vim.lsp.handlers['textDocument/publishDiagnostics'] =
  vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics, {
      virtual_text = {spacing = 2, prefix = '~'},
      signs = true,
      update_in_insert = false,
      underline = true,
    }
  )
