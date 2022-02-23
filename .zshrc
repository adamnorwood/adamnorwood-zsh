# search current directory, home directory, and www projects folder
# (via http://weblog.bocoup.com/shell-hacking-cdpath/)
cdpath=(. $HOME/www/)

# Run Oh My Posh prompt.
eval "$(oh-my-posh --init --shell zsh --config $HOME/.zsh/adamnorwood.omp.json)"

# Aliases to make life easier.
alias ...='cd ../../'
alias ....='cd ../../../'
alias dc='docker-compose'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias gb='git branch'
alias gbd='git branch -d'
alias gbm='git branch --merge'
alias gco='git checkout'
alias grep='grep --color=auto'
alias h='history 1'
alias hs='history | grep'
alias hsi='history | grep -i'
alias ip='ifconfig | egrep -o "inet ([0-9]{1,3}(\.)?){0,4}" | tr -d "\040\011inet"'
alias l='ls -lAh'
alias recents='defaults delete .GlobalPreferences NSNavRecentPlaces'
alias sizes='du -hd1|gsort -hr'
alias utweb='ssh anorwood@panel.utweb.utexas.edu'
alias utweberrors='ssh -t anorwood@panel.utweb.utexas.edu "~/bin/utweberrors utw10007"'
alias utwebprod='ssh utw10007@panel.utweb.utexas.edu'
alias utwebqual='ssh utw10006@panel.utweb.utexas.edu'
alias utwebtest='ssh utw10005@panel.utweb.utexas.edu'
alias wildgift='ssh adam@198.58.113.194'
alias wpd='docker-compose -f ~/docker/utweb/docker-compose.yml exec php-fpm wp --allow-root --path="/app/law.utexas.test/wp/"'

setopt alwaystoend
setopt appendhistory
setopt autocd
setopt autolist
setopt automenu
setopt autopushd
setopt completeinword
setopt correct
setopt extendedhistory
setopt histexpiredupsfirst
setopt histignoredups
setopt histignorespace
setopt histverify
setopt interactivecomments
setopt listpacked
setopt longlistjobs
setopt nocaseglob
setopt noflowcontrol
setopt promptsubst
setopt pushdignoredups
setopt pushdminus
setopt sharehistory

# Set up zsh up/down/home/end key search completions.
autoload -U history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey -e
bindkey "^[[A" history-beginning-search-backward-end
bindkey "^[[B" history-beginning-search-forward-end
bindkey '\e[H' beginning-of-line
bindkey '\e[F' end-of-line
bindkey '[C' forward-word
bindkey '[D' backward-word

# A handy git diff that ignores JS and CSS source maps and compiled files.
function gdiff () {
    git diff $1 ':!*.map' ':!*.css' ':!*.min.*'
}

export EDITOR='code'
export PATH="$PATH:/usr/local/opt/php@7.3/bin:/usr/local/opt/php@7.3/sbin:/usr/local/sbin"

# Set up zany color schemes.
export LESS_TERMCAP_mb=$(print -P "%F{cyan}") \
    LESS_TERMCAP_md=$(print -P "%B%F{cyan}") \
    LESS_TERMCAP_me=$(print -P "%f%b") \
    LESS_TERMCAP_so=$(print -P "%K{magenta}") \
    LESS_TERMCAP_se=$(print -P "%K{black}") \
    LESS_TERMCAP_us=$(print -P "%U%F{yellow}") \
    LESS_TERMCAP_ue=$(print -P "%f%u")

# LS colors, made with http://geoff.greer.fm/lscolors/
export CLICOLOR=1
export LS_COLORS='di=36:ln=1;35:so=32:pi=33:ex=31:bd=34;46:cd=34;43:su=30;41:sg=30;46:tw=30;42:ow=30;43'
export GREP_COLOR='1;35;40'

# Run zsh-syntax-highlighting (installed via homebrew).
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# The following lines were added by compinstall
zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _complete _ignored _approximate
zstyle ':completion:*' completions 1
zstyle ':completion:*' glob 1
zstyle ':completion:*' group-name ''
zstyle ':completion:*' insert-unambiguous true
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list 'm:{[:lower:]}={[:upper:]}'
zstyle ':completion:*' max-errors 1
zstyle ':completion:*' menu select=0
zstyle ':completion:*' original true
zstyle ':completion:*' prompt 'Did you mean?'
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' verbose true
autoload -Uz compinit
compinit

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
imgcat ~/Pictures/bubble-bobble.png
