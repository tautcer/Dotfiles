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
nnoremap('<Down>', 'jzz')
nnoremap('<UP>', 'kzz')
nnoremap('<leader>h', '<cmd>noh<cr>')
nnoremap('<leader>w', '<cmd>w<cr>')
nnoremap('<C-J>', '<C-W>j')
nnoremap('<C-K>', '<C-W>k')
nnoremap('<C-L>', '<C-W>l')
nnoremap('<C-H>', '<C-W>h')

nmap('ZZ', '<cmd>:wq<cr>')

vmap('>', '>gv')
vmap('<', '<gv')
--
-- <Tab> to navigate the completion menu
inoremap('<S-Tab>', 'pumvisible() ? "\\<C-p>" : "\\<Tab>"', {expr = true})
inoremap('<Tab>', 'pumvisible() ? "\\<C-n>" : "\\<Tab>"', {expr = true})

vnoremap('p', ':<C-U>let @p = @+<CR>gvp:let @+ = @p<CR>', {expr = true})
