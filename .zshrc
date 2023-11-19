# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# oh-my-zsh
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"
plugins=(git vi-mode fzf) #fzf should come after vi-mode to override C-r key conflict
source $ZSH/oh-my-zsh.sh

export EDITOR='nvim'

# FZF
export FZF_DEFAULT_COMMAND='rg --files --no-ignore-vcs --hidden .'
export FZF_DEFAULT_OPTS='--height 40% --layout=reverse --border'
export FZF_ALT_C_OPTS="--preview 'tree -C {}'"

# Alias
alias v="nvim"
alias tl="tmux ls"
alias tn="tmux new -s"
alias ta="tmux attach -t"
alias tk="tmux kill-session -t"
alias tka="tmux kill-session -a"

source /usr/local/share/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
