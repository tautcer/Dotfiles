local scopes = {o = vim.o, b = vim.bo, w = vim.wo, g = vim.g}
local indent = 2

local function opt(scope, key, value)
  scopes[scope][key] = value
  if scope ~= 'o' then scopes['o'][key] = value end
end

vim.g.mapleader = ' '

opt('g', 'redrawtime', 10000)
opt('g', 'lazyredraw', true)
opt('b', 'expandtab', true)                -- Use spaces instead of tabs
opt('b', 'shiftwidth', indent)             -- Size of an indent
opt('b', 'smartindent', true)              -- Insert indents automatically
opt('b', 'tabstop', indent)                -- Number of spaces tabs count for
opt('o', 'smarttab', true)
opt('b', 'expandtab', true)
opt('o', 'mouse', 'a')                     -- Enables a mouse mode
opt('o', 'hidden', true)                   -- Enable modified buffers in background
opt('o', 'ignorecase', true)               -- Ignore case
opt('o', 'joinspaces', false)              -- No double spaces with join after a dot
opt('o', 'scrolloff', 4)                   -- Lines of context
opt('o', 'shiftround', true)               -- Round indent
opt('o', 'sidescrolloff', 4)               -- Columns of context
opt('o', 'incsearch', true)
opt('o', 'gdefault', true)
opt('o', 'smartcase', true)                -- Don't ignore case with capitals
opt('o', 'splitbelow', true)               -- Put new windows below current
opt('o', 'splitright', true)               -- Put new windows right of current
opt('o', 'termguicolors', true)            -- True color support
opt('o', 'wildmode', 'longest:full,full')  -- Command-line completion mode
opt('w', 'list', true)                     -- Show some invisible characters (tabs etc.)
opt('w', 'number', true)                   -- Print line number
opt('w', 'relativenumber', true)           -- Relative line numbers
opt('w', 'wrap', false)                    -- Disable line wrap
opt('o', 'clipboard', 'unnamedplus')
opt('o', 'title', true)
opt('o', 'updatetime', 100)
opt('o', 'backup', true)
opt('o', 'ruler', true)
opt('o', 'signcolumn', 'yes')
opt('o', 'autoindent', true)
opt('o', 'cindent', true)
opt('o', 'showmode', true)
opt('o', 'showcmd', true)
opt('o', 'encoding', 'UTF-8')
opt('o', 'backspace', 'indent,eol,start')
opt('o', 'cmdheight', 2)
opt('o', 'undofile', true)
opt('o', 'completeopt', 'menuone,noinsert,noselect')
opt('o', 'dir', '/home/unitato/.config/nvim/swap/')
opt('o', 'undodir', '/home/unitato/.config/nvim/undo/')
vim.o.shortmess = vim.o.shortmess .. 'c'

-- Permanent undo
-- vim.o.dir = '/home/unitato/.config/nvim/swap/'
-- vim.o.undodir = '/home/unitato/.config/nvim/undo/'
-- maintain undo history between sessions
vim.o.completeopt = "menu,menuone,noselect"
vim.cmd(
	[[
		set undofile
	]]
)

vim.api.nvim_command [[ 
  syntax enable 
]]

vim.api.nvim_exec([[
 autocmd Syntax * call matchadd('Todo', '\W\zs\(TODO\|FIXME\|CHANGED\|BUG\|HACK\)')
 autocmd Syntax * call matchadd('Debug', '\W\zs\(NOTE\|INFO\|IDEA\)')
 highlight! link mkdLineBreak NONE
]], '')
