# Quick edits
alias vim 'nvim'
alias fishalias 'nvim ~/.config/fish/aliases.fish'
alias fishconf 'nvim ~/.config/fish/config.fish'
alias vimrc 'nvim ~/.config/nvim/init.vim'
alias tmuxconf 'nvim ~/.tmux.conf'
alias cl 'clear'
alias python 'python3'
alias ls 'exa --icons'
alias stop 'sudo systemctl stop '
alias start 'sudo systemctl start '
if type -q bass && test -f ~/.local/bin/cd_up_to_git.sh 
  alias c2g 'bass source ~/.local/bin/cd_up_to_git.sh'
end
