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

local cmp_kinds = {
  Class         = " Class",
  Color         = " Color",
  Constant      = " Constant",
  Constructor   = " Constructor",
  Enum          = "了Enum",
  EnumMember    = " EnumMember",
  Field         = "ƒ Field",
  File          = " File",
  Folder        = " Folder",
  Function      = " Function",
  Interface     = "ﰮ Interface",
  Keyword       = " Keyword",
  Method        = "ƒ Method",
  Module        = " Module",
  Property      = " Property",
  Snippet       = "﬌ Snippet",
  Struct        = " Struct",
  Reference     = "Reference",
  Text          = " Text",
  Unit          = " Unit",
  Value         = " Value",
  Variable      = " Variable",
  Operator      = "Operator",
  Event         = "  Event",
  TypeParameter = "TypeParameter",
}

-- luasnip setup
local luasnip = require 'luasnip'

local has_words_before = function()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

-- nvim-cmp setup
local cmp = require 'cmp'
cmp.setup {
  snippet = {
    expand = function(args)
      -- vim.fn["vsnip#anonymous"](args.body)
      require('luasnip').lsp_expand(args.body)
    end,
  },
  mapping = {
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    ['<C-n>'] = cmp.mapping.select_next_item(),
    ['<C-f>'] = cmp.mapping.scroll_docs(-4),
    ['<C-d>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.close(),
    ['<CR>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    },
    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      elseif has_words_before() then
        cmp.complete()
      else
        fallback()
      end
    end, { "i", "s" }),

    ["<S-Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { "i", "s" }),
  },
  formatting = {
    format = function(_, vim_item)
      vim_item.kind = (cmp_kinds[vim_item.kind] or "") .. vim_item.kind
      return vim_item
    end,
  },
  sources = {
    { name = 'luasnip' },
    { name = 'nvim_lsp' },
    { name = 'nvim_lua' },
    { name = 'vsnip' },
    { name = 'path' },
    { name = 'buffer' },
    { name = 'orgmode' },
  }
}

-- -- you need setup cmp first put this after cmp.setup()
-- require("nvim-autopairs.completion.cmp").setup({
--   map_cr = true, --  map <CR> on insert mode
--   map_complete = true, -- it will auto insert `(` (map_char) after select function or method item
--   auto_select = true, -- automatically select the first item
--   insert = false, -- use insert confirm behavior instead of replace
--   map_char = { -- modifies the function or method delimiter by filetypes
--     all = '(',
--     tex = '{'
--   }
-- })
