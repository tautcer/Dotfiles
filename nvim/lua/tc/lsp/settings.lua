local nvim_lsp = require('lspconfig')
local lsp_status = require('lsp-status')
local util = require('lspconfig/util')
local home = os.getenv('HOME')
local metals_config = require('metals').bare_config()
local utils = require('tc.telescope.utils')

local function mapping(client)
  nnoremap('gd', vim.lsp.buf.definition)
  nnoremap('K', vim.lsp.buf.hover)
  nnoremap('gs', vim.lsp.buf.signature_help)
  nnoremap('gi', vim.lsp.buf.implementation)
  nnoremap('gt', vim.lsp.buf.type_definition)
  nnoremap('<leader>gw', vim.lsp.buf.document_symbol)
  nnoremap('<leader>gW', vim.lsp.buf.workspace_symbol)
  nnoremap('<leader>rr', vim.lsp.buf.rename)
  nnoremap('g[', vim.diagnostic.goto_prev)
  nnoremap('g]', vim.diagnostic.goto_next)
  nnoremap('<leader>ff', vim.lsp.buf.formatting)

  local buf_name = vim.fn.expand('%s')
  if string.find(buf_name, 'NvimTree*') == nil and client ~= nil then
    vim.cmd([[autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()]])
    if client.resolved_capabilities.document_highlight then
      vim.cmd([[autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()]])
    end
    if client.resolved_capabilities.code_lens then
      vim.cmd([[autocmd BufEnter,CursorHold,InsertLeave <buffer> lua vim.lsp.codelens.refresh()]])
    end
  end
end

local function on_attach(client)
  lsp_status.on_attach(client)

  -- use omnifunc
  vim.bo.omnifunc = 'v:lua.vim.lsp.omnifunc'

  mapping(client)

  if client.name == 'tsserver' or client.name == 'html' or client.name == 'lua' then
    client.resolved_capabilities.document_formatting = false
  end
end

lsp_status.register_progress()

-- nvim-cmp supports additional completion capabilities
local capabilities = vim.lsp.protocol.make_client_capabilities()

local sumneko_binary = home .. '/Projects/lua-language-server/bin/lua-language-server'
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)
capabilities.textDocument.completion.completionItem.snippetSupport = true

local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, 'lua/?.lua')
table.insert(runtime_path, 'lua/?/init.lua')

local servers = {
  bashls = {},
  vimls = {},
  dockerls = {},
  yamlls = {},
  rust_analyzer = { filetypes = { 'rust' } },
  rls = { filetypes = { 'rust' } },
  jsonls = { filetypes = { 'json', 'avsc' } },
  tsserver = {
    cmd = { 'typescript-language-server', '--stdio' },
    root_dir = function()
      return vim.fn.getcwd()
    end,
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
  html = { capabilities = capabilities },
  cssls = {
    cmd = { 'vscode-css-language-server', '--stdio' },
    filetypes = { 'css', 'scss', 'less' },
    root_dir = util.root_pattern('package.json') or vim.loop.os_homedir(),
    capabilities = capabilities,
    settings = {
      css = { validate = true },
      scss = { validate = true },
      less = { validate = true },
    },
  },
  pylsp = {
    root_dir = function()
      return vim.fn.getcwd()
    end,
    init_options = { documentFormatting = false, codeAction = true },
  },
  gopls = {
    codelens = { generate = true, gc_details = true },
    experimentalWorkspaceModule = true,
    semanticTokens = true,
    experimentalPostfixCompletions = true,
  },
  pyright = {},
  clangd = {},
  sumneko_lua = {
    cmd = {
      sumneko_binary,
      '-E',
      home .. '/Projects/lua-language-server/main.lua',
    },
    filetypes = { 'lua' },
    capabilities = capabilities,
    settings = {
      Lua = {
        runtime = {
          -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
          version = 'LuaJIT',
          -- Setup your lua path
          path = runtime_path,
        },
        diagnostics = {
          -- Get the language server to recognize the `vim` global
          globals = {
            'vim',
            'vim.api',
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
  zk = {
    filetypes = { 'markdown' },
  },
  terraform_lsp = {
    filetypes = { 'terraform', 'tf' }
  },
}

local setup_server = function(server, config)
  if not config then
    return
  end

  if type(config) ~= 'table' then
    config = {}
  end

  config = vim.tbl_deep_extend('force', {
    on_attach = on_attach,
    capabilities = capabilities,
    flags = { debounce_text_changes = 50 },
  }, config)

  nvim_lsp[server].setup(config)
end

for server, config in pairs(servers) do
  setup_server(server, config)
end

metals_config.settings = {
  showImplicitArguments = true,
  showImplicitConversionsAndClasses = true,
  showInferredType = true,
  --testUserInterface = "test explorer",
  excludedPackages = {
    "akka.actor.typed.javadsl",
    "com.github.swagger.akka.javadsl",
    "akka.stream.javadsl",
    "akka.http.javadsl",
  },
  --fallbackScalaVersion = "2.13.7",
  serverVersion = "0.11.2+30-f9261de6-SNAPSHOT",
  --serverVersion = "0.11.3-SNAPSHOT",
}

metals_config.init_options.statusBarProvider = "on"
metals_config.capabilities = capabilities

metals_config.on_attach = function(client, _)
  mapping(client)

  -- nvim-dap
  -- I only use nvim-dap with Scala, so we keep it all in here
  local dap = require("dap")

  dap.configurations.scala = {
    {
      type = "scala",
      request = "launch",
      name = "RunOrTest",
      metals = {
        runType = "runOrTestFile",
        --args = { "firstArg", "secondArg", "thirdArg" }, -- here just as an example
      },
    },
    {
      type = "scala",
      request = "launch",
      name = "Run",
      metals = {
        runType = "run",
        --args = { "firstArg", "secondArg", "thirdArg" }, -- here just as an example
      },
    },
    {
      type = "scala",
      request = "launch",
      name = "Test Target",
      metals = {
        runType = "testTarget",
      },
    },
  }

  nnoremap("<leader>dc", [[<cmd>lua require("dap").continue()<CR>]])
  nnoremap("<leader>dr", [[<cmd>lua require("dap").repl.toggle()<CR>]])
  nnoremap(
    "<leader>ds",
    [[<cmd>lua require("dap.ui.widgets").sidebar(require("dap.ui.widgets").scopes).toggle()<CR>]]
  )
  nnoremap("<leader>dK", [[<cmd>lua require("dap.ui.widgets").hover()<CR>]])
  nnoremap("<leader>dt", [[<cmd>lua require("dap").toggle_breakpoint()<CR>]])
  nnoremap("<leader>dbc", [[<cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>]])
  nnoremap("<leader>dso", [[<cmd>lua require("dap").step_over()<CR>]])
  nnoremap("<leader>dsi", [[<cmd>lua require("dap").step_into()<CR>]])
  nnoremap("<leader>dl", [[<cmd>lua require("dap").run_last()<CR>]])

  require("metals").setup_dap()
end

local lsp_group = vim.api.nvim_create_augroup("lsp", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "scala", "sbt", "java" },
  callback = function()
    require("metals").initialize_or_attach(metals_config)
  end,
  group = lsp_group,
})
