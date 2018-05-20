# enviroment
setopt nonomatch
export LANG=ja_JP.UTF-8
bindkey -v

autoload -U compinit
compinit -u
setopt auto_param_slash
setopt print_eight_bit
setopt auto_cd

export DISPLAY=localhost:0.0

hash -d hoge=/long/path/to/hogehoge

# histroy
setopt auto_pushd
setopt pushd_ignore_dups
setopt extended_glob
setopt hist_ignore_all_dups
setopt hist_ignore_space
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion:*:default' menu select=1
WORDCHARS='*?_-.[]~=&;!#$%^(){}<>'

autoload colors
colors

# prompt
autoload -Uz vcs_info
setopt prompt_subst
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' stagedstr "%F{yellow}!"
zstyle ':vcs_info:git:*' unstagedstr "%F{red}+"
zstyle ':vcs_info:*' formats "%F{green}%c%u[%b]%f"
zstyle ':vcs_info:*' actionformats '[%b|%a]'
precmd () { vcs_info }
local PROMPT='%{${fg[yellow]}%}[%~]%{${reset_color}%}'
local info="%{$fg[cyan]%}%n%{$reset_color%} @ %{$fg[green]%}%m%{$reset_color%} $ "
local gitst='%{$fg[cyan]%}${vcs_info_msg_0_}%{$reset_color%}'
PROMPT="${PROMPT} ${gitst}
${info}"
PROMPT2="%{$fg[green]%}%_> %{$reset_color%}"
SPROMPT="%{$fg[red]%}correct: %R -> %r [nyae]? %{$reset_color%}"

# aliases
alias ls='ls -F --color=auto --show-control-chars -I "NTUSER.DAT*"'
alias ll='ls -al -F --color=auto --show-control-chars -I "NTUSER.DAT*"'
alias cmd='cmd.exe /c '
alias exp='explorer.exe .'

# EDITOR
export EDITOR='vim'
export VISUAL='vim'

# path
export PATH=$PATH:/mnt/c/Users/3sodn/git/Misc/bin

