local lsp = require('lspconfig')
local lsp_completion = require('completion')
local lsp_status  = require('lsp-status')
local util = require 'lspconfig/util'

local map = function(type, key, value)
	vim.fn.nvim_buf_set_keymap(0,type,key,value,{noremap = true, silent = true});
end
local function on_attach(client)
    lsp_status.on_attach(client)
    lsp_completion.on_attach(client)

    -- use omnifunc
    vim.bo.omnifunc = 'v:lua.vim.lsp.omnifunc'

    map('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>')
    map('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>')
    map('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>')
    map('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<CR>')
    map('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>')
    map('n', 'gt', '<cmd>lua vim.lsp.buf.type_definition()<CR>')
    map('n', '<leader>gw', '<cmd>lua vim.lsp.buf.document_symbol()<CR>')
    map('n', '<leader>gW', '<cmd>lua vim.lsp.buf.workspace_symbol()<CR>')
    map('n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>')
    map('n', '<leader>ee', '<cmd>lua vim.lsp.diagnostics.show_line_diagnostics()<CR>')
    map('n', '<leader>rr', '<cmd>lua vim.lsp.buf.rename()<CR>')
    map('n', '<leader>ai', '<cmd>lua vim.lsp.buf.incoming_calls()<CR>')
    map('n', '<leader>ao', '<cmd>lua vim.lsp.buf.outgoing_calls()<CR>')
    map('n', 'g[', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>')
    map('n', 'g]', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>')

    if client.resolved_capabilities.document_formatting then
        vim.api.nvim_command [[augroup Format]]
        vim.api.nvim_command [[autocmd! * <buffer>]]
        vim.api.nvim_command [[autocmd BufWritePost <buffer> lua vim.lsp.buf.formatting()]]
        vim.api.nvim_command [[augroup END]]
        vim.api.nvim_command [[ autocmd CursorHold * lua vim.lsp.diagnostic.show_line_diagnostics() ]]
    end
    -- Set some keybinds conditional on server capabilities
    if client.resolved_capabilities.document_formatting then
      map("n", "<space>ff", "<cmd>lua vim.lsp.buf.formatting()<CR>")
    elseif client.resolved_capabilities.document_range_formatting then
      map("n", "<space>ff", "<cmd>lua vim.lsp.buf.formatting()<CR>")
    end
end
--
-- using tab for navigating in completion
vim.api.nvim_exec(
[[
imap <Tab> <Plug>(completion_smart_tab) 
imap <S-Tab> <Plug>(completion_smart_s_tab) 
]],
true)

lsp_status.register_progress()

local default_lsp_config = {on_attach = on_attach, capabilities = lsp_status.capabilities}
local sumneko_root_path = vim.fn.stdpath('cache')..'/lspconfig/sumneko_lua/lua-language-server'
local sumneko_binary = "/home/unitato/.cache/nvim/lspconfig/sumneko_lua/lua-language-server/bin/Linux/lua-language-server"
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

local servers = {
  bashls = {},
  vimls = {},
  dockerls = {},
  yamlls = {},

  rust_analyzer = {
    filetypes = { 'rust' }
  },

  rls = {
    filetypes = { "rust" }
  },

  jsonls = {},

  tsserver = {
    cmd = { "typescript-language-server", "--stdio" },
    filetypes = { 'javascript', 'javascriptreact', 'javascript.jsx', 'typescript', 'typescriptreact', 'typescript.tsx' },
    capabilities = capabilities,
  },

  -- angularls = {
  --   cmd = { "node_modules/@angular/language-server/index.js" },
  --   filetypes = { "typescript", "html", "typescriptreact", "typescript.tsx" }
  -- },

  html = {
    capabilities = capabilities,
  },
  cssls = {
    cmd = {"css-languageserver", "--stdio"},
    filetypes = {"css", "scss", "less"},
    root_dir = util.root_pattern("package.json") or vim.loop.os_homedir(),
    capabilities = capabilities,
    settings = {
        css = { validate = true },
        scss = { validate = true },
        less = { validate = true },
    }
  },

  efm = {
  },
  pyls = {
    filetypes = { 'python' }
  },

  sumneko_lua = {
      cmd = {sumneko_binary, "-E", sumneko_root_path .. "/main.lua"};
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
                globals = {'vim', 'nnoremap', 'nmap', 'inoremap', 'vnoremap', 'cnoremap'},
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

for server, config in pairs(servers) do
  lsp[server].setup(vim.tbl_deep_extend("force", default_lsp_config, config, capabilities))
end
