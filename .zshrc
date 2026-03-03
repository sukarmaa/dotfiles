# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Plugin mnager {{{
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

if [ ! -d "$ZINIT_HOME" ]; then
   mkdir -p "$(dirname $ZINIT_HOME)"
   git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

source "${ZINIT_HOME}/zinit.zsh"
# }}} end - plugin manager

# Export {{{
export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"
export EDITOR="vim"
if [[ ":$PATH:" != *":$HOME/bin:"* ]]; then
    export PATH="$HOME/bin:$PATH"
fi
export MANPAGER="vim -M +MANPAGER -"
export PAGER="$MANPAGER"

# }}}

# Plugins {{{
zinit ice depth=1; zinit light romkatv/powerlevel10k
zinit light zsh-users/zsh-autosuggestions
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions

zinit snippet OMZL::git.zsh
zinit snippet OMZP::command-not-found
# }}} end - plugins

# General Settings {{{
autoload -Uz compinit && compinit
zinit cdreplay -q
setopt auto_cd
setopt correct
setopt noclobber
setopt hist_ignore_dups
setopt share_history
setopt inc_append_history
setopt append_history
setopt hist_ignore_all_dups
setopt hist_ignore_space
setopt hist_find_no_dups

HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.zsh_history

# }}} end - general settings

# Aliases {{{
alias gl='git log --pretty=format:"%an, %ar, %h: %s"'
alias gs='git status'
alias gf='git fetch'
alias ga='git add'
alias gc='git commit -m'
alias gu='git ls-files --other --exclude-standard'
alias gt='git log --graph --oneline --decorate --all'

# }}} end - aliases

# Keymaps {{{
bindkey -e

## Reference: https://gist.github.com/Pitometsu/5871629a886902816c39
bindkey "^[[A" history-search-backward
bindkey "^[[B" history-search-forward

bindkey '^R' history-incremental-search-backward
bindkey '^S' history-incremental-search-forward

bindkey '^K' kill-whole-line
bindkey "\e[7~" beginning-of-line
bindkey "\e[8~" end-of-line

# }}} end - keymaps

# Complition styling {{{
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'
# }}}

# Shell Integration {{{
eval "$(fzf --zsh)"
eval "$(zoxide init --cmd cd zsh)"
function y() {
    local tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
    cwd
    yazi "$@" --cwd-file="$tmp"
    if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
        builtin cd -- "$cwd"
    fi
    rm -f -- "$tmp"
}

# }}}

# vim:set ft=sh et sw=4 ts=4 fdm=marker fdl=1:
 

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
