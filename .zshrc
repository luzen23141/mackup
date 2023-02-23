# Path to your dotfiles.

# 開啟p10k instant_prompt
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi


# 是否區分大小寫
# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# 使否區分 _ 與 -
# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# 關閉連結檢查 (連結有斜線時，自動增加反斜線等，會嚴重影響複製貼上速度)
DISABLE_MAGIC_FUNCTIONS=true

source $ZSH/oh-my-zsh.sh
source $DOTFILES/plugins/powerlevel10k/powerlevel10k.zsh-theme
source $DOTFILES/aliasConfig.sh
source $DOTFILES/p10k.zsh
source $DOTFILES/plugins/fsh/F-Sy-H.plugin.zsh
source $DOTFILES/plugins/zshAutosuggestions/zsh-autosuggestions.zsh

# User configuration
export TERM="xterm-256color"

# You may need to manually set your language environment
export LC_ALL=en_US.UTF-8
# export LANG=en_US.UTF-8

export PATH="/usr/local/sbin:$PATH"

# export PATH=$(dirname $0):${PATH}
export PATH="$DOTFILES/plugins/gitOpen:$PATH"


# 安裝theFuck
# eval $(thefuck --alias)

# plugins=(git-open)


# 安裝autojump.sh
[ -f $(brew --prefix)/etc/profile.d/autojump.sh ] && . $(brew --prefix)/etc/profile.d/autojump.sh
