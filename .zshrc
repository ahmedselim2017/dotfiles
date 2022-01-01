export EDITOR="/usr/bin/nvim"
export SUDO_EDITOR="/usr/bin/nvim"
export PAGER="less"
export BROWSER="brave"
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8
export QT_QPA_PLATFORMTHEME="qt5ct"
export MANPAGER="sh -c 'col -bx | bat -l man -p'"
export GPODDER_DOWNLOAD_DIR=/home/tozkoparan/mount/2/Medya/Auido/Podcasts
export PATH="/home/ahmedselimuzum/.local/bin:$PATH"
export TERM='alacritty'
export PYTHON_KEYRING_BACKEND=keyring.backends.null.Keyring

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
alias ls="exa"
alias lh="exa -lah"

alias cl="command /usr/bin/clear"
alias cls="command /usr/bin/clear; exa"
alias csl="command /usr/bin/clear; exa"

alias rf="rm -Irfv"
alias mkd='mkdir -pv'
function mkc (){mkdir -v $1 && cd $1}
alias mv='mv -iv'
alias cp='cp -iv'

alias s="sudo "
alias q='exit'


alias 'cd..'='cd ..'
alias 'cd...'='cd ../../'
alias tl="tldr --list | fzf --preview 'tldr {} --color always' | xargs tldr"
alias grep='grep --color=auto'
alias yoket="pkill -9"

alias jk="fg"

alias pbat='prettybat'
alias bman='batman'
alias bgrep='batgrep'

alias bos="cd $(mktemp -d)"

alias conf='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

alias g="git"
alias gs="git status"
alias gaa="git add -A"
alias gad="git add ."
alias gpm="git push origin master"
alias gc="git commit -m"
alias gca="git commit -am"

alias ymp="youtube-dl -if bestaudio --extract-audio --audio-format mp3 -o '%(playlist_index)s-%(title)s.%(ext)s'"
alias yp="youtube-dl -io '%(playlist_index)s-%(title)s.%(ext)s' -i"
alias yps="youtube-dl -io '%(playlist_index)s-%(title)s/%(title)s.%(ext)s' -i --sub-lang=en,tr"
alias y="youtube-dl"
alias yarch="yt-dlp --no-check-certificate --format 'bestvideo[height<=1080]+bestaudio/best[height<=1080]' --verbose --force-ipv4 --sleep-requests 1 --sleep-interval 5 --max-sleep-interval 30 --ignore-errors --no-continue --no-overwrites --download-archive archive.log --add-metadata --all-subs --embed-subs --output '%(uploader)s - %(title)s [%(id)s].%(ext)s' --merge-output-format 'mkv' --extractor-args youtube:player_client=android --throttled-rate 100K"

alias vi="nvim"
alias v="nvim"
alias vim="nvim"
alias e="nvr -l"
alias :q="exit"
alias :wq="exit"
alias :q!="exit"
alias :Q="exit"

# autoload -U colors && colors
# Make tab completion case insensetive:
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

# Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)		# Include hidden files.

# better search with arrow keys
autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "^[[A" up-line-or-beginning-search # Up
bindkey "^[[B" down-line-or-beginning-search # Down


#Plugins
source "/usr/share/zsh/plugins/zsh-vi-mode/zsh-vi-mode.plugin.zsh"
ZVM_VI_INSERT_ESCAPE_BINDKEY=jk

source "/home/$USER/.config/zsh/zsh-autosuggestions/zsh-autosuggestions.zsh"
source "/home/$USER/.config/zsh/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh"
source "/home/$USER/.config/zsh/zsh-z/zsh-z.plugin.zsh"

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

source /home/ahmedselimuzum/.config/zsh/minimal/minimal.zsh

 [ -f /opt/miniconda3/etc/profile.d/conda.sh ] && source /opt/miniconda3/etc/profile.d/conda.sh

MNML_PROMPT=(mnml_ssh mnml_pyenv mnml_status mnml_cwd mnml_keymap)
MNML_RPROMPT=(mnml_git)

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

# Use nvim keys in tab complete menu:
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v '^?' backward-delete-char

# Select Words Bash Style
autoload -U select-word-style
select-word-style bash
export WORDCHARS='.-'
