# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export LANG=ja_JP.UTF-8
export PATH=$PATH:/opt/homebrew/bin
export PATH="/opt/homebrew/opt/mysql@5.7/bin:$PATH"
export NVM_DIR=~/.nvm
source $(brew --prefix nvm)/nvm.sh
export PATH=/Users/user_name/anaconda3/bin:$PATH
export PS1="%F{green}%n%f %F{yellow}%c%f %F{yellow}$%f "
export　PATH=/Users/user_name/anaconda3/bin:$PATH
export GOENV_ROOT="$HOME/.goenv"
export PATH="$GOENV_ROOT/bin:$PATH"
eval "$(goenv init -)"
export GOPATH="$HOME/go"
export PATH="$GOROOT/bin:$PATH"
export PATH="$PATH:$GOPATH/bin"

# ----------
#    補完
# ----------
if type brew &>/dev/null; then
    FPATH=$(brew --prefix)/share/zsh/site-functions:$FPATH

    autoload -Uz compinit
    compinit
fi

# ----------
#    zinit
# ----------
zinit module build
source "$HOME/.zinit/bin/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

## コマンドに色付け
zinit ice wait'!0'; zinit load zsh-users/zsh-syntax-highlighting

# anyframeのセットアップ
zinit light mollifier/anyframe

# Ctrl+x -> b
# peco でディレクトリの移動履歴を表示
bindkey '^xb' anyframe-widget-cdr
autoload -Uz chpwd_recent_dirs cdr add-zsh-hook
add-zsh-hook chpwd chpwd_recent_dirs

# Ctrl+x -> r
# peco でコマンドの実行履歴を表示
bindkey '^xr' anyframe-widget-execute-history

# Ctrl+x -> Ctrl+b
# peco でGitブランチを表示して切替え
bindkey '^x^b' anyframe-widget-checkout-git-branch

# Ctrl+x -> g
# GHQでクローンしたGitリポジトリを表示
bindkey '^xg' anyframe-widget-cd-ghq-repository



# ----------
#   alias
# ----------
alias zsh='source ~/.zshrc'
alias c='clear'
alias con='source ~/.conda_zshrc'
#docker alias
alias dcud='docker-compose up -d'
alias tensorflow='source /Users/masayakojima/tensorflow_macos_venv/bin/activate'
alias ..='cd ..'
alias sail='[ -f sail ] && bash sail || bash vendor/bin/sail'

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/ac2393921/opt/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/ac2393921/opt/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/ac2393921/opt/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/ac2393921/opt/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<


### Added by Zinit's installer
if [[ ! -f $HOME/.zinit/bin/zinit.zsh ]]; then
    print -P "%F{33}▓▒░ %F{220}Installing %F{33}DHARMA%F{220} Initiative Plugin Manager (%F{33}zdharma/zinit%F{220})…%f"
    command mkdir -p "$HOME/.zinit" && command chmod g-rwX "$HOME/.zinit"
    command git clone https://github.com/zdharma/zinit "$HOME/.zinit/bin" && \
        print -P "%F{33}▓▒░ %F{34}Installation successful.%f%b" || \
        print -P "%F{160}▓▒░ The clone has failed.%f%b"
fi

source "$HOME/.zinit/bin/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit
### End of Zinit's installer chunk

SCRIPT_DIR=$HOME/dotfiles

source $SCRIPT_DIR/zsh/plugins.zsh
source $SCRIPT_DIR/zsh/config.zsh
source $SCRIPT_DIR/zsh/p10k.zsh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"
