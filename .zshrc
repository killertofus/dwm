export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="dracula"


plugins=(git
zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh


#exports here
export BAT_THEME=Dracula
export DRACULA_ARROW_ICON="❯"
export EDITOR=nvim

#alias here
alias ls="lsd -a"
alias cat="bat"
alias lz="lazygit"
alias fzf="fzf --preview "bat --color=always --style=numbers --line-range=:500 {}""
alias update="sudo apt update && sudo apt upgrade && sudo apt clean && sudo apt autoclean && sudo apt autoremove"
autoload -U colors && colors
PS1="%{$fg[red]%}%n%{$reset_color%}@%{$fg[blue]%}%m %{$fg[yellow]%}%~ %{$reset_color%}%% " 


[[ -f ~/.config/zsh/zsh-snap/znap.zsh ]] ||
    git clone --depth 1 -- \
        https://github.com/marlonrichert/zsh-snap.git ~/.config/zsh/zsh-snap
LS_COLORS+=':ow=01;33'
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=60'
source ~/.config/zsh/zsh-snap/znap.zsh


znap prompt sindresorhus/pure


znap source marlonrichert/zsh-autocomplete
znap source zsh-users/zsh-autosuggestions
znap source zsh-users/zsh-syntax-highlighting
znap source marlonrichert/zcolors
znap eval zcolors "zcolors ${(q)LS_COLORS}"
znap source dracula/zsh

znap function _pyenv pyenv 'eval "$( pyenv init - --no-rehash )"'
compctl -K    _pyenv pyenv
compinit -d "$XDG_CACHE_HOME"/zsh/zcompdump-"$ZSH_VERSION"

#startups here
if [ -z "$TMUX" ]
then
    tmux attach -t TMUX || tmux new -s TMUX \; new-window \ yazi;
fi
function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}
