. ~/.config/fish/aliases.fish

set -gx EDITOR nvim
set -U fish_user_paths /usr/local/sbin /usr/local/bin /usr/bin /bin $HOME/.pyenv/bin $HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin /home/unitato/.dotnet/tools

# add the go bin path to be able to execute our programs
set -x GOPATH /home/unitato/go
set -x PATH $PATH /usr/local/go/bin $GOPATH/bin
set -x fish_user_paths $HOME/.pyenv
set -x fish_user_paths $PYENV_ROOT/bin:$PATH

set PYENV_ROOT $HOME/.pyenv
set -x PATH "/home/unitato/.pyenv/bin" $PATH
status --is-interactive; and pyenv init - | source
set -x VIRTUAL_ENV_DISABLE_PROMPT 0
set -x JAVA_HOME "/home/unitato/dev/jdk-13.0.2"
set -U FZF_LEGACY_KEYBINDINGS 0
set -U fish_key_bindings fish_default_key_bindings
set PATH $HOME/.cargo/bin $PATH

eval (python -m virtualfish)

abbr -a e nvim

# Fish git prompt
set __fish_git_prompt_showuntrackedfiles 'yes'
set __fish_git_prompt_showdirtystate 'yes'
set __fish_git_prompt_showstashstate ''
set __fish_git_prompt_showupstream 'none'
set -g fish_prompt_pwd_dir_length 3


if [ -e /usr/share/fish/functions/fzf_key_bindings.fish ]; and status --is-interactive
	source /usr/share/fish/functions/fzf_key_bindings.fish
end

# colored man output
# from http://linuxtidbits.wordpress.com/2009/03/23/less-colors-for-man-pages/
setenv LESS_TERMCAP_mb \e'[01;31m'       # begin blinking
setenv LESS_TERMCAP_md \e'[01;38;5;74m'  # begin bold
setenv LESS_TERMCAP_me \e'[0m'           # end mode
setenv LESS_TERMCAP_se \e'[0m'           # end standout-mode
setenv LESS_TERMCAP_so \e'[38;5;246m'    # begin standout-mode - info box
setenv LESS_TERMCAP_ue \e'[0m'           # end underline
setenv LESS_TERMCAP_us \e'[04;38;5;146m' # begin underline

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
	tmux ^ /dev/null; and exec true
end

function pushorigin
    git push origin --set-upstream (git branch | grep '^*' | tr -d '* ')
end
