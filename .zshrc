if command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ]; then
  # exec tmux new-session -d -s 0; tmux new-session -t 0 \; set-option destroy-unattached
  exec tmux
fi

export PATH="$PATH:$HOME/.local/bin:$HOME/.cargo/bin:$HOME/tools/bin/:$HOME/software/pdb-tools/pdbtools"

export EDITOR="/usr/bin/nvim"
export SUDO_EDITOR="/usr/bin/nvim"

export MANPAGER="sh -c 'col -bx | batcat -l man -p'"
export MANROFFOPT="-c"

HIST_STAMPS="dd/mm/yyyy"
HISTFILE="$HOME/.zsh_history"
HISTSIZE=1000000000
SAVEHIST=1000000000

setopt BANG_HIST                 # Treat the '!' character specially during expansion.
setopt EXTENDED_HISTORY          # Write the history file in the ":start:elapsed;command" format.
setopt INC_APPEND_HISTORY        # Write to the history file immediately, not when the shell exits.
setopt SHARE_HISTORY             # Share history between all sessions.
setopt HIST_REDUCE_BLANKS        # Remove superfluous blanks before recording entry.
setopt HIST_VERIFY               # Don't execute immediately upon history expansion.
setopt HIST_BEEP                 # Beep when accessing nonexistent history.
setopt hist_ignore_space

# Some Commands
alias ls="eza"
alias lh="eza -lah"

alias cl="command /usr/bin/clear"
alias cls="command /usr/bin/clear; eza"
alias csl="command /usr/bin/clear; eza"

alias rf="rm -Irfv"
alias mkd='mkdir -pv'
function mkc (){mkdir -v $1 && cd $1}
alias mv='mv -iv'
alias cp='cp -iv'

alias s="sudo "
alias q='exit'

alias 'cd..'='cd ..'
alias 'cd...'='cd ../../'
alias grep='grep --color=auto'

alias yoket="pkill -9"
alias bos="cd $(mktemp -d)"

alias conf='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

alias g="git"
alias gs="git status"
alias gaa="git add -A"
alias gad="git add ."
alias gpm="git push origin master"
alias gc="git commit -m"
alias gca="git commit -am"
alias vi="nvim"
alias v="nvim"
alias vim="nvim"

# Make tab completion case insensetive:
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
# Basic auto/tab complete:
fpath+=~/.zfunc

autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)		# Include hidden files.


#Plugins
source "/home/$USER/.config/zsh/zsh-vi-mode/zsh-vi-mode.plugin.zsh"
ZVM_VI_INSERT_ESCAPE_BINDKEY=jk

source "/home/$USER/.config/zsh/zsh-autosuggestions/zsh-autosuggestions.zsh"
source "/home/$USER/.config/zsh/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh"

fpath+=$HOME/.config/zsh/typewritten
autoload -U promptinit; promptinit
prompt typewritten
export TYPEWRITTEN_RELATIVE_PATH="home"


# ^e to editcommand with nvim
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line

# reverse search
bindkey '^R' history-incremental-search-backward

# better search with arrow keys
autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "^[[A" up-line-or-beginning-search # Up
bindkey "^[[B" down-line-or-beginning-search # Down

# Use vim keys in tab complete menu:
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v '^?' backward-delete-char

# Select Words Bash Style
autoload -U select-word-style
select-word-style bash
export WORDCHARS='.-'

# Setup extract alias
x () {
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1 ;;
      *.tar.gz)    tar xzf $1 ;;
      *.bz2)       bunzip2 $1 ;;
      *.rar)       rar x $1 ;;
      *.gz)        gunzip $1 ;;
      *.tar)       tar xvf $1 ;;
      *.tbz2)      tar xjf $1 ;;
      *.tgz)       tar xzf $1 ;;
      *.zip)       unzip $1 ;;
      *.Z)         uncompress $1 ;;
      *.7z)        7za x $1 ;;
      *.xz)        xz -d $1 ;;
      *)           echo "'$1' cannot be extracted via x()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

pdb_split () {
  if [ -f $1 ] ; then
    grep -n 'MODEL\|ENDMDL' "${1}" | cut -d: -f 1 | awk '{if(NR%2) printf "sed -n %d,",$1+1; else printf "%dp '"${1}"' > model_%03d.pdb\n", $1-1,NR/2;}' | parallel --bar --progress
    # grep -n 'MODEL\|ENDMDL' "${1}"  | cut -d: -f 1 | awk '{if(NR%2) printf "sed -n %d,",$1+1; else printf "%dp ${1} > model_%03d.pdb\n", $1-1,NR/2;}' | bash -sf
  fi
}

eval "$(zoxide init zsh)"
alias cd="z"

# >>> conda initialize >>>
conda() {
  unset -f conda
  __conda_setup="$('/home/ahmedselimuzum/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
  if [ $? -eq 0 ]; then
      eval "$__conda_setup"
  else
      if [ -f "/home/ahmedselimuzum/miniconda3/etc/profile.d/conda.sh" ]; then
          . "/home/ahmedselimuzum/miniconda3/etc/profile.d/conda.sh"
      else
          export PATH="/home/ahmedselimuzum/miniconda3/bin:$PATH"
      fi
  fi
  unset __conda_setup
}
ce(){
  conda activate $(conda info --envs | grep -v "^#" | fzf --height=~100%  | awk '{print $1}')
}
# <<< conda initialize <<<

export GOPATH=${HOME}/go
export PATH=/usr/local/go/bin:${PATH}:${GOPATH}/bin
eval "$(uv generate-shell-completion zsh)"
eval "$(uvx --generate-shell-completion zsh)"

_uv_run_mod() {
    if [[ "$words[2]" == "run" && "$words[CURRENT]" != -* ]]; then
        # Check if any previous argument after 'run' ends with .py
        if [[ ${words[3,$((CURRENT-1))]} =~ ".*\.py" ]]; then
            # Already have a .py file, complete any files
            _arguments '*:filename:_files'
        else
            # No .py file yet, complete only .py files
            _arguments '*:filename:_files -g "*.py"'
        fi
    else
        _uv "$@"
    fi
}
compdef _uv_run_mod uv

# better search with arrow keys
autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "^[[A" up-line-or-beginning-search # Up
bindkey "^[[B" down-line-or-beginning-search # Down

source /usr/share/modules/init/zsh
export MODULEPATH="${HOME}/dotfiles/modules:${MODULEPATH}"
