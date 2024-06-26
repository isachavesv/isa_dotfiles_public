# Isa: This was admin standard on Corn
# Editing as I go along.

# Set up the prompt
#

autoload -Uz promptinit
promptinit
prompt adam1

setopt histignorealldups sharehistory

# Isa: Vim key bindings
#bindkey -v

# Isa: Good shortcuts
alias ls="ls --color=auto"
alias mkdir="mkdir -p" 

# Isa: good screen shortcuts
alias bigscreen="xrandr --output HDMI1 --primary --auto"
alias littlescreen="xrandr --output eDP1 --primary --auto && xrandr --output HDMI1 --off"

alias onlyBigScreen="xrandr --output HDMI1 --primary --auto && xrandr --output eDP1 --off"

#Isa: quick git
function gitit() {
	git add --all && git commit -m "$1" && git push origin master
}

# Isa: other git shortcuts
alias ga="git add"
alias gc="git commit"
alias gh="git hist"
alias gs="git status"

#Isa: latex compile sequence of last resort

function mll() {
	pdflatex "$1" && bibtex "$1" && pdflatex "$1" && pdflatex "$1"
}

function showMe() {
	latexmk --pdf --pvc "$1"
}


#Isa: screen switch

alias screenB="xrandr --output HDMI1 --auto --primary && xrandr --output eDP1 --off && conkywonky"

alias screenS="xrandr --output eDP1 --auto --primary && xrandr --output HDMI1 --off && conkywonky"

alias screenM="xrandr --output HDMI1 --auto --output eDP1 --auto --same-as HDMI1 && conkywonky"

# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history

# Use modern completion system
autoload -Uz compinit
compinit

zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2
eval "$(dircolors -b)"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true

zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/opt/homebrew/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/opt/homebrew/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/opt/homebrew/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/opt/homebrew/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

