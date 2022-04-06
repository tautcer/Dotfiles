-- alternative esc
inoremap('<C-j>', '<esc>')
vnoremap('<C-j>', '<esc>')
inoremap('<C-c>', '<esc>')
vnoremap('<C-c>', '<esc>')

nnoremap('n', 'nzz')
nnoremap('N', 'Nzz')
nnoremap('*', '*zz')
nnoremap('#', '#zz')
nnoremap('g*', 'g*zz')
nnoremap('?', '?\\v')
nnoremap('/', '/\\v')
cnoremap('%s/', '%sm/')

-- Jump to start and end of line using the home row keys
mapall('H', '^')
mapall('L', '$')

nnoremap('j', 'jzz')
nnoremap('k', 'kzz')
nnoremap('<leader>h', '<cmd>noh<cr>')
nnoremap('<leader>w', '<cmd>w<cr>')
nnoremap('<C-J>', '<C-W>j')
nnoremap('<C-K>', '<C-W>k')
nnoremap('<C-L>', '<C-W>l')
nnoremap('<C-H>', '<C-W>h')

nmap('ZZ', '<cmd>:wq<cr>')

vmap('>', '>gv')
vmap('<', '<gv')

vnoremap('p', ':<C-U>let @p = @+<CR>gvp:let @+ = @p<CR>')

-- resize buffer easier
nnoremap('<Left>', '<cmd>vertical resize +2<cr>')
nnoremap('<Right>', '<cmd>vertical resize -2<cr>')
nnoremap('<Up>', '<cmd>resize +2<cr>')
nnoremap('<Down>', '<cmd>resize -2<cr>')
nnoremap('gx', '<cmd>lua Util.xdg_open()<cr>')
nnoremap('<leader>rg', '<cmd>source<cr>')
nmap('<C-t>', ':vsplit | term<CR>')
