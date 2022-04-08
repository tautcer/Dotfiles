. ~/.config/fish/aliases.fish
. ~/.config/fish/keys.fish

set -gx EDITOR nvim
set -gx VISUAL nvim
set -U fish_user_paths /usr/local/sbin /usr/local/bin /usr/bin /bin $HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin

# add the go bin path to be able to execute our programs
set -x GOPATH $HOME/go
set -x PATH $PATH /usr/local/go/bin $GOPATH/bin
set -x fish_user_paths ~/.deno/bin
set -x fish_user_paths $HOME/.local/bin
set -x fish_user_paths $HOME/.local/share/coursier/bin

set -Ux PYENV_ROOT $HOME/.pyenv
set -U fish_user_paths $PYENV_ROOT/bin $fish_user_paths

set -x VIRTUAL_ENV_DISABLE_PROMPT 0
set -x JAVA_HOME $HOME/.sdkman/candidates/java/11.0.12-open
set -U FZF_LEGACY_KEYBINDINGS 0
set -U fish_key_bindings fish_default_key_bindings
set PATH $HOME/.cargo/bin $PATH
set -x BROWSER /usr/bin/google-chrome-stable
set -x MANPAGER nvim +Man!
set -gx PATH $PATH $HOME/.krew/bin

abbr -a e nvim
abbr -a v nvim

# Fish git prompt
set __fish_git_prompt_showuntrackedfiles 'yes'
set __fish_git_prompt_showdirtystate 'yes'
set __fish_git_prompt_showstashstate ''
set __fish_git_prompt_showupstream 'none'
set -g fish_prompt_pwd_dir_length 3


if [ -e /usr/share/fish/functions/fzf_key_bindings.fish ]; and status --is-interactive
	source /usr/share/fish/functions/fzf_key_bindings.fish
end

setenv FZF_DEFAULT_OPTS '--height 20%'
export FZF_DEFAULT_COMMAND='fd --type f --color=never'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd --type d --color=never"

# This function runs RG to find and replace a string across all the files in the dir
# Takes 2 arguments 1: what to search for 2: what to replace it with
function rgr 
  set RGR_FROM $argv[1]
  set RGR_TO $argv[2]
  rg $RGR_FROM 
  rg $RGR_FROM -l -n | xargs sed -i "s/$RGR_FROM/$RGR_TO/g"
end

function fco -d "Fuzzy-find and checkout a branch"
  git branch --all | grep -v HEAD | string trim | fzf | read -l result; and git checkout "$result"
end

function fcoc -d "Fuzzy-find and checkout a commit"
  git log --pretty=oneline --abbrev-commit --reverse | fzf --tac +s -e | awk '{print $1;}' | read -l result; and git checkout "$result"
end

function fish_user_key_bindings
	bind \cz 'fg>/dev/null ^/dev/null'
	if functions -q fzf_key_bindings
		fzf_key_bindings
	end
end

if status --is-interactive
	tmux 2> /dev/null; and exec true
end

function pushorigin
    git push origin --set-upstream (git branch | grep '^*' | tr -d '* ')
end

nvm use v17.7.1 1> /dev/null
