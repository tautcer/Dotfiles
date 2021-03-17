-- Nvim-lsputils stuff
vim.lsp.handlers['textDocument/codeAction'] =
  require'lsputil.codeAction'.code_action_handler
vim.lsp.handlers['textDocument/references'] =
  require'lsputil.locations'.references_handler
vim.lsp.handlers['textDocument/definition'] =
  require'lsputil.locations'.definition_handler
vim.lsp.handlers['textDocument/declaration'] =
  require'lsputil.locations'.declaration_handler
vim.lsp.handlers['textDocument/typeDefinition'] =
  require'lsputil.locations'.typeDefinition_handler
vim.lsp.handlers['textDocument/implementation'] =
  require'lsputil.locations'.implementation_handler
vim.lsp.handlers['textDocument/documentSymbol'] =
  require'lsputil.symbols'.document_handler
vim.lsp.handlers['workspace/symbol'] =
  require'lsputil.symbols'.workspace_handler

local remap = vim.api.nvim_set_keymap
local protocol = require('vim.lsp.protocol')

require'compe'.setup {
  enabled = true,
  autocomplete = true,
  debug = false,
  min_length = 2,
  preselect = 'enable',
  throttle_time = 80,
  source_timeout = 200,
  incomplete_delay = 400,

  source = {
    path = true,
    buffer = true,
    calc = true,
    vsnip = true,
    nvim_lsp = true,
    nvim_lua = true,
    spell = true,
    tags = true,
    snippets_nvim = true,
    ultisnips = true,
  },
}

protocol.CompletionItemKind = {
  ' Text', -- = 1
  'ƒ Method', -- = 2;
  ' Function', -- = 3;
  ' Constructor', -- = 4;
  'ƒ Field', -- = 5;
  ' Variable', -- = 6;
  ' Class', -- = 7;
  'ﰮ Interface', -- = 8;
  ' Module', -- = 9;
  ' Property', -- = 10;
  ' Unit', -- = 11;
  ' Value', -- = 12;
  '了Enum', -- = 13;
  ' Keyword', -- = 14;
  '﬌ Snippet', -- = 15;
  ' Color', -- = 16;
  ' File', -- = 17;
  'Reference', -- = 18;
  ' Folder', -- = 19;
  ' EnumMember', -- = 20;
  ' Constant', -- = 21;
  ' Struct', -- = 22;
  'Event', -- = 23;
  'Operator', -- = 24;
  'TypeParameter', -- = 25;
}
--  mappings
remap('s', '<Tab>', 'v:lua.tab_complete()', {expr = true})
remap('i', '<S-Tab>', 'v:lua.s_tab_complete()', {expr = true})
remap('s', '<S-Tab>', 'v:lua.s_tab_complete()', {expr = true})
remap('i', '<CR>', 'v:lua.completions()', {expr = true})

function _G.completions()
  local npairs = require('nvim-autopairs')
  if vim.fn.pumvisible() == 1 then
    if vim.fn.complete_info()['selected'] ~= -1 then
      return vim.fn['compe#confirm']('<CR>')
    end
  end
  return npairs.check_break_line_char()
end

