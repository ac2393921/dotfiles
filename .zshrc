export LANG=ja_JP.UTF-8
export PATH=$PATH:/opt/homebrew/bin
export PATH="/opt/homebrew/opt/mysql@5.7/bin:$PATH"
export NVM_DIR=~/.nvm
source $(brew --prefix nvm)/nvm.sh
export PATH=/Users/user_name/anaconda3/bin:$PATH
export PS1="%F{green}%n%f %F{yellow}%c%f %F{yellow}$%f "

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

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/masayakojima/miniforge3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/masayakojima/miniforge3/etc/profile.d/conda.sh" ]; then
        . "/Users/masayakojima/miniforge3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/masayakojima/miniforge3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

