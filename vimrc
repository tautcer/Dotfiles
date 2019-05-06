let mapleader = "\<Space>"

if !has("gui_running")
    set mouse=a
    set nocompatible
endif

set nolist
set nowrap
set cursorline                  " Highlight current line
set cursorcolumn                " Highlight current column
set colorcolumn=80
set scrolloff=3
set norelativenumber
set clipboard=unnamedplus
syntax enable

" Natural splits
set splitbelow
set splitright"

" Indetiation
set autoindent                  " keep indentiation
set smartindent                 " be smart

" Show linenumbers
set number
set ruler

" Set Proper Tabs
set tabstop=4
set shiftwidth=4
set smarttab
set expandtab

" Status bar
set laststatus=2

" Display options
set showmode
set showcmd
set encoding=UTF-8
set ignorecase
set smartcase
set re=1
set backspace=indent,eol,start

" Permanent undo
set dir=~/.vim/swapfiles
set backup
set backupdir=~/.vim/backupfiles
set undofile
set undodir=~/.vim/undofiles

" tab to select and don't hijack my enter key
inoremap <expr><Tab> (pumvisible()?(empty(v:completed_item)?"\<C-n>":"\<C-y>"):"\<Tab>")
" inoremap <expr><CR> (pumvisible()?(empty(v:completed_item)?"\<CR>\<CR>":"\<C-y>"):"\<CR>")"

filetype plugin indent on

call plug#begin('~/.vim/plugged')

" Declare the list of plugins.
Plug 'itchyny/lightline.vim'
Plug 'vim-airline/vim-airline'
Plug 'edkolev/tmuxline.vim'
Plug 'vim-airline/vim-airline-themes'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'majutsushi/tagbar'
Plug 'scrooloose/syntastic'
Plug 'sjl/badwolf'
" Plug 'Valloric/YouCompleteMe'
Plug 'sheerun/vim-polyglot'
Plug 'tomtom/tcomment_vim'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-commentary'
Plug 'w0rp/ale'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all'  }
Plug 'junegunn/fzf.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'machakann/vim-highlightedyank'
Plug 'python-mode/python-mode', { 'branch': 'develop'  }
Plug 'bling/vim-bufferline'
Plug 'neoclide/coc.nvim', {'do': './install.sh nightly'}
Plug 'morhetz/gruvbox'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'airblade/vim-rooter'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries'  }
Plug 'mdempsky/gocode', { 'rtp': 'vim', 'do': '~/.vim/plugged/gocode/vim/symlink.sh'  }
Plug 'maralla/completor.vim'

" List ends here. Plugins become visible to Vim after this call.
call plug#end()

let g:Powerline_symbols = "fancy"
let g:Powerline_dividers_override = ["\Ue0b0","\Ue0b1","\Ue0b2","\Ue0b3"]
let g:Powerline_symbols_override = {'BRANCH': "\Ue0a0", 'LINE': "\Ue0a1", 'RO': "\Ue0a2"}
let g:highlightedyank_highlight_duration = 1000
let g:pymode_python = 'python3'

" air-line
let g:airline_powerline_fonts = 0


if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

let g:ale_go_langserver_executable = 'gopls'
let g:go_fmt_command = "goimports"
set completeopt+=noinsert

nnoremap <C-J> <C-W>j
nnoremap <C-K> <C-W>k
nnoremap <C-L> <C-W>l
nnoremap <C-H> <C-W>h

if has('termguicolors')
    set t_Co=256
    colorscheme gruvbox
    let g:gruvbox_contrast_dark = 'hard'
endif 

" Color thingies
set background=dark
" set t_Co=256
let g:airline_theme='gruvbox'
colorscheme badwolf

" FZF
let g:fzf_buffers_jump = 0 " Always open new window
let g:fzf_layout = { 'down': '~40%'  }

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
" inoremap <leader>w <C-c>:w<cr>
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

let g:fzf_colors =
  \ { 'fg':    ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

" Editorconfig
let g:EditorConfig_exclude_patterns = ['fugitive://.*'] " Just in case I'll ever install fugitive

" Fold
let g:anyfold_activate=0 " Disable anyfold by default
let g:anyfold_motion=0 " Don't map motion commands

" Go text highlighting specific features 
let g:go_highlight_build_constraints = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_structs = 1
let g:go_highlight_types = 1
let g:go_highlight_function_calls = 1

" Error and warning signs
let g:ale_sign_error = '⤫'
let g:ale_sign_warning = '⚠'
" Enable integration with airline.
let g:airline#extensions#ale#enabled = 1

map <C-n> :NERDTreeToggle<CR>
" imap jj <Esc>
nmap ZZ :wq<CR>

au FileType markdown syn sync fromstart
au FileType markdown set foldmethod=syntax
au BufRead, BufNewFile *.go set filetype=go
