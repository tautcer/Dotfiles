-- completion.nvim
-- vim.g.completion_enable_snippet = "UltiSnips"
-- vim.g.completion_matching_smart_case = 1
-- vim.g.completion_chain_complete_list = {
--     default = {
--       default = {
--         {complete_items = {"lsp", "snippet"}},
--         {mode = "<c-n>"},
--         {mode = "<c-p>"},
--       },
--       string = {
--         {mode = 'file'}
--       }
--     }
-- }
-- vim.g.completion_enable_auto_paren = true
-- vim.g.completion_trigger_keyword_length = 2
-- vim.g.completion_trigger_character = {'.', '::'}

-- vim.g.completion_customize_lsp_label = {
--     Function = " [function]",
--     Method = " [method]",
--     Reference = " [refrence]",
--     Enum = " [enum]",
--     Field = "ﰠ [field]",
--     Keyword = " [key]",
--     Variable = " [variable]",
--     Folder = " [folder]",
--     Snippet = " [snippet]",
--     Operator = " [operator]",
--     Module = " [module]",
--     Text = "ﮜ[text]",
--     Class = " [class]",
--     Interface = " [interface]"
-- }

-- Nvim-lsputils stuff
vim.lsp.handlers['textDocument/codeAction'] = require'lsputil.codeAction'.code_action_handler
vim.lsp.handlers['textDocument/references'] = require'lsputil.locations'.references_handler
vim.lsp.handlers['textDocument/definition'] = require'lsputil.locations'.definition_handler
vim.lsp.handlers['textDocument/declaration'] = require'lsputil.locations'.declaration_handler
vim.lsp.handlers['textDocument/typeDefinition'] = require'lsputil.locations'.typeDefinition_handler
vim.lsp.handlers['textDocument/implementation'] = require'lsputil.locations'.implementation_handler
vim.lsp.handlers['textDocument/documentSymbol'] = require'lsputil.symbols'.document_handler
vim.lsp.handlers['workspace/symbol'] = require'lsputil.symbols'.workspace_handler

local remap = vim.api.nvim_set_keymap
local npairs = require('nvim-autopairs')
local protocol = require('vim.lsp.protocol')

require'compe'.setup {
  enabled = true;
  autocomplete = true;
  debug = false;
  min_length = 2;
  preselect = 'enable';
  throttle_time = 80;
  source_timeout = 200;
  incomplete_delay = 400;

  source = {
    path = true;
    buffer = true;
    calc = true;
    vsnip = true;
    nvim_lsp = true;
    nvim_lua = true;
    spell = true;
    tags = true;
    snippets_nvim = true;
    ultisnips = true;
  };
}

Util.trigger_completion = function()
  if vim.fn.pumvisible() ~= 0  then
    if vim.fn.complete_info()["selected"] ~= -1 then
      return vim.fn["compe#confirm"]()
    end

    vim.fn.nvim_select_popupmenu_item(0 , false , false ,{})
    return vim.fn["compe#confirm"]()
  end

  return npairs.check_break_line_char()
end

-- cycle tab or insert tab depending on prev char
remap(
  'i', '<Tab>',
  table.concat{
    'pumvisible() ? "<C-n>" : v:lua.Util.check_backspace()',
    '? "<Tab>" : compe#confirm()',
  },
  { silent = true, noremap = true, expr = true }
)

remap('i', '<S-Tab>', 'pumvisible() ? "<C-p>" : "<S-Tab>"', { noremap = true, expr = true })
remap('i', '<C-Space>', 'compe#complete()', { noremap = true, expr = true, silent = true })

protocol.CompletionItemKind = {
  ' Text';        -- = 1
  'ƒ Method';      -- = 2;
  ' Function';    -- = 3;
  ' Constructor'; -- = 4;
  'ƒ Field';         -- = 5;
  ' Variable';    -- = 6;
  ' Class';       -- = 7;
  'ﰮ Interface';   -- = 8;
  ' Module';      -- = 9;
  ' Property';    -- = 10;
  ' Unit';        -- = 11;
  ' Value';       -- = 12;
  '了Enum';        -- = 13;
  ' Keyword';     -- = 14;
  '﬌ Snippet';     -- = 15;
  ' Color';       -- = 16;
  ' File';        -- = 17;
  'Reference';     -- = 18;
  ' Folder';      -- = 19;
  ' EnumMember';  -- = 20;
  ' Constant';    -- = 21;
  ' Struct';      -- = 22;
  'Event';         -- = 23;
  'Operator';      -- = 24;
  'TypeParameter'; -- = 25;
}
