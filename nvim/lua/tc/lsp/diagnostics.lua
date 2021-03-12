vim.lsp.handlers['textDocument/publishDiagnostics'] =
  vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics, {
      virtual_text = {spacing = 2, prefix = '~'},
      signs = true,
      update_in_insert = false,
      underline = true,
    }
  )

vim.fn.sign_define(
  'LspDiagnosticsSignError',
  {text = '', texthl = 'LspDiagnosticsDefaultError'}
)
vim.fn.sign_define(
  'LspDiagnosticsSignWarning',
  {text = '', texthl = 'LspDiagnosticsDefaultWarning'}
)
vim.fn.sign_define(
  'LspDiagnosticsSignInformation',
  {text = '', texthl = 'LspDiagnosticsDefaultInformation'}
)
vim.fn.sign_define(
  'LspDiagnosticsSignHint', {text = '', texthl = 'LspDiagnosticsDefaultHint'}
)
