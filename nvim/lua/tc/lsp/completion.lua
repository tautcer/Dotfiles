local cmp_kinds = {
  Class = ' Class',
  Color = ' Color',
  Constant = ' Constant',
  Constructor = ' Constructor',
  Enum = '了Enum',
  EnumMember = ' EnumMember',
  Field = 'ƒ Field',
  File = ' File',
  Folder = ' Folder',
  Function = ' Function',
  Interface = 'ﰮ Interface',
  Keyword = ' Keyword',
  Method = 'ƒ Method',
  Module = ' Module',
  Property = ' Property',
  Snippet = '﬌ Snippet',
  Struct = ' Struct',
  Reference = 'Reference',
  Text = ' Text',
  Unit = ' Unit',
  Value = ' Value',
  Variable = ' Variable',
  Operator = 'Operator',
  Event = '  Event',
  TypeParameter = 'TypeParameter',
}

require('luasnip/loaders/from_vscode').lazy_load()

-- luasnip setup
local luasnip = require('luasnip')

-- nvim-cmp setup
local cmp = require('cmp')
cmp.setup({
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = {
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    ['<C-n>'] = cmp.mapping.select_next_item(),
    ['<C-f>'] = cmp.mapping.scroll_docs(-4),
    ['<C-d>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.close(),
    ['<CR>'] = cmp.mapping.confirm({
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    }),
    ['<Tab>'] = cmp.mapping(function(fallback)
      if luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end, { 'i', 's' }),

    ['<S-Tab>'] = cmp.mapping(function(fallback)
      if luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { 'i', 's' }),
  },
  formatting = {
    format = function(_, vim_item)
      vim_item.kind = (cmp_kinds[vim_item.kind] or '') .. vim_item.kind
      return vim_item
    end,
  },
  sources = {
    { name = 'luasnip' },
    { name = 'nvim_lsp' },
    { name = 'nvim_lua' },
    { name = 'path' },
    { name = 'buffer' },
    { name = 'orgmode' },
  },
})
