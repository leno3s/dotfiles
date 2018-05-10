# enviroment
setopt nonomatch
export LANG=ja_JP.UTF-8
bindkey -v

autoload -U compinit; compinit
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
zstyle ':completion:*:default' menu select=1
WORDCHARS='*?_-.[]~=&;!#$%^(){}<>'

autoload colors
colors

# prompt
local cdir="%{$fg[yellow]%}[%d]%{$reset_color%}"
local info="%{$fg[cyan]%}%n%{$reset_color%} @ %{$fg[green]%}%m%{$reset_color%} $ "
PROMPT="$cdir
$info"
PROMPT2="%{$fg[green]%}%_> %{$reset_color%}"
SPROMPT="%{$fg[red]%}correct: %R -> %r [nyae]? %{$reset_color%}"

# aliases
alias ls='ls -F --color=auto --show-control-chars -I "NTUSER.DAT*"'
alias ll='ls -al -F --color=auto --show-control-chars -I "NTUSER.DAT*"'
alias cmd='cmd.exe /c '
alias exp='explorer.exe /c'

# EDITOR
export EDITOR='vim'
export VISUAL='vim'

# path
export PATH=$PATH:/mnt/c/Users/3sodn/git/Misc/bin

