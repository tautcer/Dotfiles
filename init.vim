let mapleader = "\<Space>"

if !has("gui_running")
    set mouse=a
    set nocompatible
endif
set termguicolors

set nolist
set nowrap
set scrolloff=3
set rnu
set clipboard=unnamedplus
set title
syntax enable
syntax sync fromstart
" set re=1
set redrawtime=10000
set lazyredraw
set ttyfast
set completeopt+=noinsert

" Natural splits
set splitbelow
set splitright"

" Indentations
set autoindent                  " keep indentations
set smartindent                 " be smart

" Show linenumbers
set number
set ruler

" Set Proper Tabs
set tabstop=2
set shiftwidth=2
set smarttab
set expandtab

" Status bar
set laststatus=2

" Display options
set showmode
set showcmd
set encoding=UTF-8
set backspace=indent,eol,start

" Proper search
set incsearch
set ignorecase
set smartcase
set gdefault

" Permanent undo
set dir=~/.config/nvim/swap/
set backup
set backupdir=~/.config/nvim/backup/
set undofile
set undodir=~/.config/nvim/undo/

set guifont=FiraCode\ Nerd\ Font\ 12

filetype plugin indent on

call plug#begin('~/.config/nvim/plugged/')

" Declare the list of plugins.
Plug 'itchyny/lightline.vim'
Plug 'edkolev/tmuxline.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-commentary'
Plug 'w0rp/ale'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'machakann/vim-highlightedyank'
Plug 'bling/vim-bufferline'
Plug 'neoclide/coc.nvim', {'do': 'yarn install'}
Plug 'gruvbox-community/gruvbox'
Plug 'plasticboy/vim-markdown'
Plug 'airblade/vim-rooter'
Plug 'leafgarland/typescript-vim'
Plug 'mhartington/nvim-typescript', {'build': './install.sh'}
Plug 'HerringtonDarkholme/yats.vim'
Plug 'rust-lang/rust.vim'
Plug 'ryanoasis/vim-devicons'

Plug 'neovim/nvim-lspconfig'
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'tpope/vim-fugitive'
Plug 'voldikss/vim-floaterm'

Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

" List ends here. Plugins become visible to Vim after this call.
call plug#end()

let g:Powerline_symbols = "fancy"
let g:Powerline_dividers_override = ["\Ue0b0","\Ue0b1","\Ue0b2","\Ue0b3"]
let g:Powerline_symbols_override = {'BRANCH': "\Ue0a0", 'LINE': "\Ue0a1", 'RO': "\Ue0a2"}
let g:highlightedyank_highlight_duration = 250
let g:pymode_python = 'python3'
let g:python3_host_prog= '/usr/bin/python3.8'


lua <<EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = "all",     -- one of "all", "language", or a list of languages
  highlight = {
    enable = true,              -- false will disable the whole extension
    disable = {},  -- list of language that will be disabled
  },
}
EOF
" lua require'nvim_lsp'.tsserver.setup{}

" air-line

let g:go_gocode_propose_source = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

let g:go_auto_sameids = 1
" let g:ale_go_langserver_executable = 'gopls'
let g:go_fmt_command = "goimports"

let g:gruvbox_contrast_dark = 'hard'
let g:gruvbox_invert_selection = 0

" This is only necessary if you use 'set termguicolors'
" It fixes tmux+vim
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

colorscheme gruvbox

" Color thingies
set background=dark

" FZF
let g:fzf_buffers_jump = 0 " Always open new window
" let g:fzf_layout = { 'down': '~40%'  }
let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.8 } }
let $FZF_DEFAULT_OPTS = '--reverse'

" Better tab completion ???
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

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

" Ale setup for typescript
let g:ale_fixers = {
\    'typescript': ['eslint', 'prettier'],
\    'scss': ['prettier'],
\    'html': ['prettier'],
\    'python': ['yapf']
\}

let g:ale_linters = {
\   'typescript': ['tsserver', 'eslint'],
\   'python': ['flake8', 'pylint'],
\}

let g:ale_fix_on_save = 1
let g:yats_host_keyword = 1

let g:lightline = {
      \ 'colorscheme': 'gruvbox',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'FugitiveHead'
      \ },
      \ 'mode_map': {
        \ 'n' : 'N',
        \ 'i' : 'I',
        \ 'R' : 'R',
        \ 'v' : 'V',
        \ 'V' : 'VL',
        \ "\<C-v>": 'VB',
        \ 'c' : 'C',
        \ 's' : 'S',
        \ 'S' : 'SL',
        \ "\<C-s>": 'SB',
        \ 't': 'T',
        \ },
      \ }

au FileType markdown syn sync fromstart
au FileType markdown set foldmethod=syntax
au FileType go setlocal omnifunc=go#complete#GocodeComplete
au BufRead, BufNewFile *.go set filetype=go
au BufNewFile,BufRead *.html set filetype=html

if has("autocmd")
 " Highlight TODO, FIXME, NOTE, etc.
 if v:version > 701
 autocmd Syntax * call matchadd('Todo', '\W\zs\(TODO\|FIXME\|CHANGED\|BUG\|HACK\)')
 autocmd Syntax * call matchadd('Debug', '\W\zs\(NOTE\|INFO\|IDEA\)')
 endif
endif

source ~/.config/nvim/coc.vim
source ~/.config/nvim/mappings/mappings.vim
