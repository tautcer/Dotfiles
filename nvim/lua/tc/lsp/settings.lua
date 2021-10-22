local nvim_lsp = require('lspconfig')
local lsp_status = require('lsp-status')
local util = require 'lspconfig/util'
local home = os.getenv("HOME")

local map = function(type, key, value)
  vim.api.nvim_buf_set_keymap(
    0, type, key, value, {noremap = true, silent = true}
  );
end
local function on_attach(client)
  lsp_status.on_attach(client)

  -- use omnifunc
  vim.bo.omnifunc = 'v:lua.vim.lsp.omnifunc'

  map('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>')
  map('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>')

  map('n', 'gr', '<cmd>lua require(\'telescope.builtin\').lsp_references()<CR>')
  map('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<CR>')
  map('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>')
  map('n', 'gt', '<cmd>lua vim.lsp.buf.type_definition()<CR>')
  map('n', '<leader>gw', '<cmd>lua vim.lsp.buf.document_symbol()<CR>')
  map('n', '<leader>gW', '<cmd>lua vim.lsp.buf.workspace_symbol()<CR>')

  map(
    'n', '<leader>ca',
    '<cmd>lua require(\'telescope.builtin\').lsp_code_actions()<CR>'
  )
  map(
    'v', '<leader>ca',
    '<cmd>lua require(\'telescope.builtin\').lsp_range_code_actions({ timeout = 1000 })<CR>'
  )

  map(
    'n', '<leader>ee',
    '<cmd>lua vim.lsp.diagnostics.show_line_diagnostics()<CR>'
  )
  map('n', '<leader>rr', '<cmd>lua vim.lsp.buf.rename()<CR>')
  map('n', '<leader>ai', '<cmd>lua vim.lsp.buf.incoming_calls()<CR>')
  map('n', '<leader>ao', '<cmd>lua vim.lsp.buf.outgoing_calls()<CR>')
  map('n', 'g[', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>')
  map('n', 'g]', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>')
  map('n', '<Leader>ff', '<cmd>lua vim.lsp.buf.formatting()<cr>')

end

lsp_status.register_progress()

-- nvim-cmp supports additional completion capabilities
local capabilities = vim.lsp.protocol.make_client_capabilities()

local sumneko_binary =
  home .. '/Projects/lua-language-server/bin/Linux/lua-language-server'
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)
capabilities.textDocument.completion.completionItem.snippetSupport = true

local servers = {
  bashls = {},
  vimls = {},
  dockerls = {},
  yamlls = {},
  rust_analyzer = {filetypes = {'rust'}},
  rls = {filetypes = {'rust'}},
  jsonls = {},
  efm = {
    init_options = {documentFormatting = true, codeAction = true},
    root_dir = function() return vim.fn.getcwd() end,
    filetypes = {
      'lua',
      'typescript',
      'typescriptreact',
      'yaml',
      'javascript',
      'python',
      'markdown',
      'vim',
      'json',
      'html',
      'sass',
      'scss',
      'css',
      'xml',
    },
  },
  tsserver = {
    cmd = {'typescript-language-server', '--stdio'},
    filetypes = {
      'javascript',
      'javascriptreact',
      'javascript.jsx',
      'typescript',
      'typescriptreact',
      'typescript.tsx',
    },
    capabilities = capabilities,
  },
  html = {capabilities = capabilities},
  cssls = {
    cmd = {'css-languageserver', '--stdio'},
    filetypes = {'css', 'scss', 'less'},
    root_dir = util.root_pattern('package.json') or vim.loop.os_homedir(),
    capabilities = capabilities,
    settings = {
      css = {validate = true},
      scss = {validate = true},
      less = {validate = true},
    },
  },
  -- pylsp = {
  --   root_dir = function() return vim.fn.getcwd() end,
  --   init_options = {documentFormatting = false, codeAction = true},
  -- },
  pyright = {},
  clangd = {},
  sumneko_lua = {
    cmd = {
      sumneko_binary,
      '-E',
      home .. '/Projects/lua-language-server/main.lua',
    },
    filetypes = {"lua"},
    capabilities = capabilities,
    settings = {
      Lua = {
        runtime = {
          -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
          version = 'LuaJIT',
          -- Setup your lua path
          path = vim.split(package.path, ';'),
        },
        diagnostics = {
          -- Get the language server to recognize the `vim` global
          globals = {
            'vim',
            'nnoremap',
            'nmap',
            'inoremap',
            'vnoremap',
            'cnoremap',
            'Util',
          },
        },
        workspace = {
          -- Make the server aware of Neovim runtime files
          library = {
            [vim.fn.expand('$VIMRUNTIME/lua')] = true,
            [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true,
          },
        },
      },
    },
  },
}

local setup_server = function(server, config)
  if not config then
    return
  end

  if type(config) ~= "table" then
    config = {}
  end

  config = vim.tbl_deep_extend("force", {
    on_attach = on_attach,
    capabilities = capabilities,
    flags = {
      debounce_text_changes = 50,
    },
  }, config)

  nvim_lsp[server].setup(config)
end

for server, config in pairs(servers) do
  setup_server(server, config)
end
