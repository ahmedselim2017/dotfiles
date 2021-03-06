. $HOME/.profile
# export EDITOR="/usr/bin/nvim"
# export SUDO_EDITOR="/usr/bin/nvim"
# export SUDO_ASKPASS="/usr/bin/dmenu_pass"
# export PAGER="less"
# export BROWSER="brave"
# export LC_ALL=en_US.UTF-8
# export LANG=en_US.UTF-8
# export LANGUAGE=en_US.UTF-8
# export QT_QPA_PLATFORMTHEME="qt5ct"

export EDITOR="/usr/bin/nvim"
export SUDO_EDITOR="/usr/bin/nvim"
export SUDO_ASKPASS="/usr/bin/dmenu_pass"
export PAGER="less"
export BROWSER="brave"
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8
export QT_QPA_PLATFORMTHEME="qt5ct"

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

# Aliases
# Configs
alias i3config="nvim ~/dotfiles-scripts/dotfiles/i3"
alias vimconfig="nvim ~/dotfiles-scripts/dotfiles/nvim"
alias zshconfig="nvim ~/dotfiles-scripts/dotfiles/zshrc"
alias ohmyzsh="nvim ~/.oh-my-zsh"
alias resetZSHSource="source ~/.zshrc"

# Some Commands
alias cl="command clear"
alias cls="command clear; ls"
alias csl="command clear; ls"
alias rf="rm -rf"
alias s="sudo "
alias mkd='mkdir -pv'
alias haydaa='s $(fc -ln -1)'
alias q='exit'
alias 'cd..'='cd ..'
alias 'cd ...'='cd ../../'
alias tb="nc termbin.com 9999"
alias jk="fg"
alias pacro="/usr/bin/pacman -Qtdq > /dev/null && sudo /usr/bin/pacman -Rns \$(/usr/bin/pacman -Qtdq | sed -e ':a;N;$!ba;s/\n/ /g')"
alias yoket="pkill -9"
alias weather="curl wttr.in"
alias ls="ls --color=auto"
alias chwp="nitrogen --set-zoom-fill --random /home/$USER/Pictures/Wallpapers/"
alias lock='betterlockscreen -l & betterlockscreen -u ~/Pictures/Wallpapers/'
alias tetris='ssh netris.rocketnine.space'
alias pbat='prettybat'
alias bman='batman'
alias bgrep='batgrep'
alias fzp="fzf --preview 'bat --style=numbers --color=always {} | head -500'"
alias hopper="/opt/hopper-v4/bin/Hopper"
alias bos="cd $(mktemp -d)"
alias grep='grep --color=auto'
alias zath="zathura"
alias news="newsboat"
alias lofi="mpv 'https://www.youtube.com/watch?v=5qap5aO4i9A' --no-video"
alias drag="dragon-drag-and-drop -x"
alias dragt="dragon-drag-and-drop -x -t"
alias dot='/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME'
alias mv='mv -iv'
alias cp='cp -iv'

# Git
alias g="git"
alias gs="git status"
alias gaa="git add -A"
alias gad="git add ."
alias gpm="git push origin master"
alias gc="git commit -m"
alias gca="git commit -am"

# Youtube-dl
alias ymp="youtube-dl -if bestaudio --extract-audio --audio-format mp3 -o '%(playlist_index)s-%(title)s.%(ext)s'"
alias yp="youtube-dl -io '%(playlist_index)s-%(title)s.%(ext)s' -i"
alias yps="youtube-dl -io '%(playlist_index)s-%(title)s/%(title)s.%(ext)s' -i --sub-lang=en,tr"
alias y="youtube-dl"

# nvim
alias vi="nvim"
alias v="nvim"
alias vim="nvim"
alias e="nvr -l"
alias :q="exit"
alias :wq="exit"
alias :q!="exit"
alias :Q="exit"

# Functions
function conf() {nvim $(du -a ~/.config | awk '{print $2}' | sed '/\/.git\//d' | fzf --cycle --height=20% --reverse)}
function mkc (){mkdir -v $1 && cd $1}


export TERM='xterm-256color'

PERL5LIB="/home/$USER/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/home/$USER/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/home/$USER/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/home/$USER/perl5"; export PERL_MM_OPT;

# Make tab completion case insensetive:
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'


# Enable colors and change prompt:
autoload -U colors && colors
# PS1="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%}$%b "

# Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)		# Include hidden files.

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

# vi mode
bindkey -v
export KEYTIMEOUT=1

# Change cursor shape for different vi modes.
function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]] ||
     [[ $1 = 'block' ]]; then
    echo -ne '\e[1 q'
  elif [[ ${KEYMAP} == main ]] ||
       [[ ${KEYMAP} == viins ]] ||
       [[ ${KEYMAP} = '' ]] ||
       [[ $1 = 'beam' ]]; then
    echo -ne '\e[5 q'
  fi
}
zle -N zle-keymap-select
zle-line-init() {
    zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
    echo -ne "\e[5 q"
}
zle -N zle-line-init
echo -ne '\e[5 q' # Use beam shape cursor on startup.
preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.

# greeter


# Plugins
source "/home/$USER/.config/zsh/zsh-autosuggestions/zsh-autosuggestions.zsh"
source "/home/$USER/.config/zsh/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh"
source "/home/$USER/.config/zsh/z/z.sh"

function c(){cd $(find -type d | fzf --tac --preview="tree -C -L 2 -x --noreport --dirsfirst {} | head -$LINES")}

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
      *)           echo "'$1' cannot be extracted via extract()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/tozkoparan/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/tozkoparan/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/home/tozkoparan/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/tozkoparan/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

#Theme
source "/home/$USER/.config/zsh/dracula/dracula.zsh-theme"

fpath+=${ZDOTDIR:-~}/.zsh_functions
