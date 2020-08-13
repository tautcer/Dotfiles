" Search results centered please
nnoremap <silent> n nzz
nnoremap <silent> N Nzz
nnoremap <silent> * *zz
nnoremap <silent> # #zz
nnoremap <silent> g* g*zz

" Very magic by default
nnoremap ? ?\v
nnoremap / /\v
cnoremap %s/ %sm/
vnoremap p :<C-U>let @p = @+<CR>gvp:let @+ = @p<CR>

nnoremap <C-J> <C-W>j
nnoremap <C-K> <C-W>k
nnoremap <C-L> <C-W>l
nnoremap <C-H> <C-W>h

""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Ctrl B for buffer related mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <silent> <Leader>bb :bn<CR> "create (N)ew buffer
nnoremap <silent> <Leader>bd :bdelete<CR> "(D)elete the current buffer
nnoremap <silent> <Leader>bu :bunload<CR> "(U)nload the current buffer
nnoremap <silent> <Leader>bl :setnomodifiable<CR> " (L)ock the current buffer"
nnoremap <silent> <leader>f :FZF<cr>
nnoremap <silent> <leader>F :FZF ~<cr>
nnoremap <silent> <leader>b :Buffers<cr>
nnoremap <Tab> :bnext<CR>
nnoremap <S-Tab> :bprevious<CR>
nnoremap <leader>w :w<cr>
nnoremap <C-f> :Rg <C-R>=expand("<cword>")<CR><CR>

" Organise imports and format file
nnoremap <leader>oi :ALEOrganizeImports<cr>

" remove highlight
nnoremap <leader>h :noh<cr>

nnoremap j jzz
nnoremap k kzz
nnoremap <Down> jzz
nnoremap <Up> kzz

" Ctrl+c and Ctrl+j as Esc
inoremap <C-j> <Esc>
vnoremap <C-j> <Esc>
inoremap <C-c> <Esc>
vnoremap <C-c> <Esc>

" Jump to start and end of line using the home row keys
map H ^
map L $

nmap ZZ :wq<CR>
vmap > >gv
vmap < <gv

nnoremap <leader>prw :CocSearch <C-R>=expand("<cword>")<CR><CR>
nnoremap <leader>pw :Rg <C-R>=expand("<cword>")<CR><CR>
nnoremap <leader>phw :h <C-R>=expand("<cword>")<CR><CR>
