FireCode -> https://github.com/TautvydasCerniauskas/Dotfiles.git
Fzf -> https://github.com/junegunn/fzf
z -> https://github.com/rupa/z // Alternative is to use pacman to install
pyenv -> https://github.com/pyenv/pyenv
neovim -> https://github.com/neovim/neovim OR pacman
pikaur, yay 
polybar, i3, i3-gaps, dmenu, and all that crap

For ts setup do this:

run install.sh (located in the plugin folder)
open a .ts file so the plugin is activated
run :UpdateRemovePlugins
restart neovim (just to make sure :-)

Have these 2 installed:
    Plug 'leafgarland/typescript-vim'
    Plug 'mhartington/nvim-typescript', {'build': './install.sh'}

Add this to vimrc
" Ale setup for typescript
let g:ale_fixers = {
\    'javascript': ['eslint'],
\    'typescript': ['prettier'],
\    'vue': ['eslint'],
\    'scss': ['prettier'],
\    'html': ['prettier']
\}
let g:ale_fix_on_save = 1

Install the following Coc Scripts
coc-json coc-angular coc-html coc-css coc-tsserver coc-highlight 

List of git aliases:

gaa -> git add --all
gcmsg -> git commit -m 
ggpush -> git push orgin $current-branch
