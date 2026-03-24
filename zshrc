# apt install zsh-autosuggestions zsh-syntax-highlighting zoxide starship
# git clone https://github.com/Aloxaf/fzf-tab ~/.zsh/fzf-tab

# Kiro CLI pre block. Keep at the top of this file.
[[ -f "${HOME}/.local/share/kiro-cli/shell/zshrc.pre.zsh" ]] && builtin source "${HOME}/.local/share/kiro-cli/shell/zshrc.pre.zsh"

# history
HISTFILE=$HOME/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt APPEND_HISTORY       # 履歴をファイルに追記する
setopt SHARE_HISTORY        # 複数のzshセッション間で履歴を共有する
setopt HIST_IGNORE_ALL_DUPS # 重複するコマンドを履歴に残さない
setopt HIST_IGNORE_SPACE    # スペースで始まるコマンドを履歴に残さない
setopt HIST_REDUCE_BLANKS   # 余分な空白を除去して履歴に保存する
setopt EXTENDED_GLOB        # 拡張グロブパターンを有効にする
setopt INTERACTIVE_COMMENTS # インタラクティブシェルでコメントを使えるようにする
setopt AUTO_PUSHD           # cdのたびにディレクトリスタックに自動プッシュする
setopt PUSHD_IGNORE_DUPS    # ディレクトリスタックに重複を追加しない
setopt PUSHD_SILENT         # pushdのスタック表示を抑制する

# completion
autoload -Uz compinit
if [[ ! -f ~/.zcompdump ]]; then
  compinit
else
  compinit -C
fi
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zmodload zsh/complist

# key bindings
bindkey -e

# prompt
autoload -Uz colors && colors
# PROMPT='%F{green}%n@%m%f:%F{blue}%~%f %# '
eval "$(starship init zsh)"

# useful aliases
alias ls='eza'
alias ll='eza -lah --git'
alias la='eza -a'
alias l='eza -CF'
alias tree='eza --tree'
alias grep='grep --color=auto'

# fzf-tab (補完候補をfzfで選択する)
source ~/.zsh/fzf-tab/fzf-tab.plugin.zsh

# plugins from Debian packages
# apt install zsh zsh-autosuggestions zsh-syntax-highlighting
# source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# zsh-history-substring-search (履歴のサブストリング検索)
# ※ zsh-syntax-highlighting より後にsourceする必要がある
source ~/.zsh/zsh-history-substring-search/zsh-history-substring-search.zsh

# fzf
[ -f /usr/share/doc/fzf/examples/key-bindings.zsh ] && source /usr/share/doc/fzf/examples/key-bindings.zsh
[ -f /usr/share/doc/fzf/examples/completion.zsh ] && source /usr/share/doc/fzf/examples/completion.zsh

# Node.js
export PATH=$HOME/.npm-global/bin:$PATH

# zoxide (スマートなcdコマンド)
eval "$(zoxide init zsh)"


# Kiro CLI post block. Keep at the bottom of this file.
[[ -f "${HOME}/.local/share/kiro-cli/shell/zshrc.post.zsh" ]] && builtin source "${HOME}/.local/share/kiro-cli/shell/zshrc.post.zsh"
export PATH="$HOME/.local/bin:$PATH"

# history-substring-search のキーバインド（最後に設定して上書きを防ぐ）
bindkey '^P' history-substring-search-up   # Ctrl+P
bindkey '^N' history-substring-search-down # Ctrl+N
