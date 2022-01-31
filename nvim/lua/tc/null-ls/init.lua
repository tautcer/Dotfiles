local null_ls = require('null-ls')
local u = require('null-ls.utils')
local b = null_ls.builtins

local get_local_config = function(files, default)
  local root = u.get_root()
  local file
  for _, v in pairs(files) do file = v end

  if file then return vim.fn.expand(root .. '/' .. file) end
  return vim.fn.expand(default)
end

null_ls.setup(
  {
    diagnostics_format = '[#{c}] #{m} (#{s})',
    sources = {
      b.formatting.lua_format.with(
        {extra_args = {'-c', vim.fn.expand('~/.config/nvim/lua_format.yaml')}}
      ),
      b.formatting.prettier,
      b.diagnostics.eslint_d.with(
        {
          args = {
            '-f',
            'unix',
            '--stdin',
            '-c',
            get_local_config({'.eslintrc.js'}, '~/.config/nvim/.eslintrc.js'),
            '--stdin-filename',
            '$FILENAME',
          },
        }
      ),
      b.formatting.eslint_d,
      b.code_actions.eslint_d,
      b.completion.spell,
      b.formatting.golines.with(
        {extra_args = {'--max-len=120', '--base-formatter=gofumpt'}}
      ),
      b.code_actions.gitsigns,
      b.hover.dictionary,
    },
  }
)
